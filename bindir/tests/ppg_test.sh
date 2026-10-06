#!/opt/homebrew/bin/bash
#
# тесты ppg: fzf и клиент БД подменяются стабами, проверяется итоговая строка подключения и пароль.
# запуск: bindir/tests/ppg_test.sh

set -uo pipefail

PPG="$(cd "$(dirname "$0")/../bin" && pwd)/ppg"
failures=0

setup() {
  WORK="$(mktemp -d)"
  mkdir -p "$WORK/stubs" "$WORK/cfg/env.d"

  # стаб fzf: отдаёт строку, первая колонка которой равна FZF_ENV / FZF_DB;
  # при --expect первой строкой печатает нажатую клавишу (FZF_KEY, пусто = Enter)
  cat > "$WORK/stubs/fzf" <<'STUB'
#!/opt/homebrew/bin/bash
want="" expect=0
for a in "$@"; do
  case "$a" in
    --prompt=env*) want="$FZF_ENV" ;;
    --prompt=*)    want="$FZF_DB" ;;
    --expect=*)    expect=1 ;;
  esac
done
[[ "$expect" == 1 ]] && printf '%s\n' "${FZF_KEY:-}"
while IFS= read -r line; do
  [[ "${line%%$'\t'*}" == "$want" ]] && { printf '%s\n' "$line"; exit 0; }
done
exit 1
STUB
  cat > "$WORK/stubs/fakeclient" <<'STUB'
#!/opt/homebrew/bin/bash
echo "CONN=$1"
echo "PASS=$PGPASSWORD"
STUB
  chmod +x "$WORK/stubs/fzf" "$WORK/stubs/fakeclient"

  cat > "$WORK/cfg/defaults" <<'CFG'
login = me
client = fakeclient
CFG
  cat > "$WORK/cfg/env.d/prod" <<'CFG'
@password mypass
@url db-prod:5432
@svc prod_camunda camunda_mks secret1
@svc prod_report {db}_mks secret2
prod_camunda
prod_report
prod_config
CFG
}

run_ppg() {
  FZF_ENV="$1" FZF_DB="$2" FZF_KEY="${3:-}" PPG_CONFIG_DIR="$WORK/cfg" \
    PATH="$WORK/stubs:$PATH" "$PPG" 2>&1
}

check() {
  local name="$1" expected="$2" actual="$3"
  if grep -qF -- "$expected" <<< "$actual"; then
    echo "ok   - $name"
  else
    echo "FAIL - $name: ожидалось '$expected'"; sed 's/^/       /' <<< "$actual"
    failures=$((failures + 1))
  fi
}

test_enter_connects_with_personal_account() {
  # given
  setup
  # when
  out="$(run_ppg prod prod_camunda)"
  # then
  check "enter: личная учётка" 'CONN=postgresql://me@db-prod:5432/prod_camunda' "$out"
  check "enter: личный пароль" 'PASS=mypass' "$out"
}

test_ctrl_s_connects_with_svc_account() {
  # given
  setup
  # when
  out="$(run_ppg prod prod_camunda ctrl-s)"
  # then
  check "ctrl-s: МКС-учётка" 'CONN=postgresql://camunda_mks@db-prod:5432/prod_camunda' "$out"
  check "ctrl-s: МКС-пароль" 'PASS=secret1' "$out"
  check "ctrl-s: режим в баннере" 'as=svc' "$out"
}

test_svc_login_expands_placeholders() {
  # given
  setup
  # when
  out="$(run_ppg prod prod_report ctrl-s)"
  # then
  check "ctrl-s: {db} в @svc" 'CONN=postgresql://prod_report_mks@db-prod:5432/prod_report' "$out"
}

test_ctrl_s_without_svc_fails() {
  # given
  setup
  # when
  out="$(run_ppg prod prod_config ctrl-s)"; rc=$?
  # then
  check "ctrl-s без @svc: ошибка" 'нет @svc-учётки' "$out"
  [[ "$rc" != 0 ]] || { echo "FAIL - ctrl-s без @svc: код возврата 0"; failures=$((failures + 1)); }
  [[ "$out" != *CONN=* ]] || { echo "FAIL - ctrl-s без @svc: клиент запущен"; failures=$((failures + 1)); }
}

for t in $(declare -F | awk '{print $3}' | grep '^test_'); do
  "$t"
  rm -rf "$WORK"
done

[[ "$failures" == 0 ]] && echo "все тесты прошли" || { echo "провалов: $failures"; exit 1; }
