-- Java/Kotlin через intellij-server (движок IDEA по LSP, pre-alpha); бандл ~380 МБ
-- скачивается при первом старте, после 30-дневного триала нужна подписка Ultimate
-- (:IntellijLspLicense login)
return {
  "JetBrains/intellij-lsp.nvim",
  -- без ft = { "java", "kotlin" }: импорт проекта стартует до открытия первого файла.
  -- вместо этого — только когда nvim запущен внутри JVM-проекта: иначе сервер (и его
  -- скачивание) поднимается в любом каталоге. :cd в проект из уже открытого nvim
  -- плагин не подгрузит — нужен перезапуск
  cond = function()
    return vim.fs.root(vim.uv.cwd(), {
      "pom.xml",
      "build.gradle",
      "build.gradle.kts",
      "settings.gradle",
      "settings.gradle.kts",
    }) ~= nil
  end,
  dependencies = { "mfussenegger/nvim-dap" }, -- только для run/debug
  opts = {
    -- JDK для анализа проектов без своего toolchain, не для запуска сервера
    default_sdk = vim.fn.expand("~/.sdkman/candidates/java/current"),
    -- accept_eula не выставлен: при первом старте спросит один раз и запомнит
    region = "europe",
    data_sharing = "none",
  },
}
