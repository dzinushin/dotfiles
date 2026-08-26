return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    keys = {
      { "<leader>mm", "<cmd>RenderMarkdown toggle<cr>", desc = "toggle markdown render" },
      { "<leader>me", "<cmd>RenderMarkdown expand<cr>", desc = "expand anti-conceal margin" },
      { "<leader>mc", "<cmd>RenderMarkdown contract<cr>", desc = "contract anti-conceal margin" },
    },
    opts = {
      -- строка под курсором показывается в сыром виде, чтобы её можно было править
      anti_conceal = { enabled = true, above = 0, below = 0 },

      -- conceallevel переключается только в отрендеренных буферах,
      -- в остальных филетайпах остаётся глобальный 0
      win_options = {
        conceallevel = { default = 0, rendered = 3 },
        concealcursor = { default = "", rendered = "" },
      },

      heading = {
        sign = false,
        position = "inline",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- фон заголовка тянется на всю ширину блока, а не строки
        width = "block",
        min_width = 72,
        left_margin = 0,
        left_pad = 0.05,
        right_pad = 0.05,
        border = true,
        border_virtual = true,
      },

      code = {
        sign = false,
        style = "full",
        position = "left",
        language_pad = 1,
        language_icon = true,
        language_name = true,
        width = "block",
        min_width = 72,
        left_pad = 2,
        right_pad = 2,
        border = "thin",
      },

      bullet = { icons = { "●", "○", "◆", "◇" } },

      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 ", scope_highlight = "@markup.strikethrough" },
        custom = {
          -- задача в работе: `- [-] ...`
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
        },
      },

      quote = { icon = "▋", repeat_linebreak = true },

      pipe_table = {
        preset = "round",
        cell = "padded",
        alignment_indicator = "┅",
      },

      link = {
        image = "󰥶 ",
        email = "󰀓 ",
        hyperlink = "󰌷 ",
        -- [[wiki-ссылки]] — прячем путь, оставляем заголовок
        wiki = { icon = "󱗖 ", body = nil, highlight = "RenderMarkdownWikiLink" },
        footnote = { superscript = true },
      },

      -- вложенные секции визуально сдвигаются, документ читается как документ
      indent = {
        enabled = true,
        per_level = 2,
        skip_level = 1,
        skip_heading = false,
      },
    },
  },
}
