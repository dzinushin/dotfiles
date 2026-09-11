local map = vim.keymap.set

map("n", ";", ":", { desc = "enter command mode" })

-- use Ctrl-HJKL convention jumps.
-- <C-L> при этом теряет дефолт (redraw + nohlsearch); nohlsearch перевешен на <esc>,
-- а перерисовка осталась за :redraw!
map("n", "<C-L>", "$", { desc = "end of line" })
map("n", "<C-H>", "^", { desc = "first non-blank" })
map("n", "<C-J>", "}", { desc = "next paragraph" })
map("n", "<C-K>", "{", { desc = "prev paragraph" })

-- clear highlights on search when pressing <Esc> in normal mode
-- see `:help hlsearch`
map("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "clear search highlight" })

-- save on Ctrl-s. insert-режим намеренно не трогаем: с 0.11 <C-s> там
-- дефолтный маппинг на vim.lsp.buf.signature_help()
map({ "n", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "save file" })

-- ходьба по меню автодополнения. принять элемент — <C-y>: только он применяет
-- импорты, text edits и сниппеты. дефолтный прыжок по активному сниппету не теряем
map("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  if vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  end
  return "<Tab>"
end, { expr = true, silent = true, desc = "next completion item" })

map("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end
  if vim.snippet.active({ direction = -1 }) then
    return "<Cmd>lua vim.snippet.jump(-1)<CR>"
  end
  return "<S-Tab>"
end, { expr = true, silent = true, desc = "prev completion item" })

-- buffers
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "new buffer" })
map("n", "<C-q>", "<cmd>bd<cr>", { desc = "delete buffer" })

-- переключение буферов — нативные ]b/[b и ]B/[B (первый/последний) из 0.11,
-- со счётчиком: 3]b прыгает через три буфера. своих маппингов не держим:
-- <Tab> в normal нельзя (в терминале без CSI-u это тот же байт, что <C-i>,
-- и прыжок вперёд по jumplist пропадает), а <S-h>/<S-l> заняли бы H/L

-- windows managment
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "split window horizontally" })
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "split window vertically" })
map("n", "<leader>si", "<cmd>resize +2<cr>", { desc = "increase window height" })
map("n", "<leader>sd", "<cmd>resize -2<cr>", { desc = "decrease window height" })

-- прыжки по диагностике. дублируют нативные ]d/[d из 0.11, оставлены как привычка.
-- opts.float депрекейтнут (удалят в 0.14) — всплывающее окно поднимаем через on_jump
local function diag_jump(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
      end,
    })
  end
end
map("n", "]g", diag_jump(1), { desc = "next diagnostic" })
map("n", "[g", diag_jump(-1), { desc = "prev diagnostic" })

map("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "source current file" })
map("n", "<leader>x", "<cmd>.lua<cr>", { desc = "source current line" })
-- в visual остаётся `:`: он сам подставляет диапазон '<,'>, а <cmd> — нет
map("v", "<leader>x", ":lua<cr>", { desc = "source selection" })

map("n", "<leader>u", "<cmd>Lazy update<cr>", { desc = "Lazy update" })

-- группы леадер-префиксов объявлены в спеке which-key (plugins/which-key.lua)
