return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      -- на 0.11+ конфиги серверов приезжают из lsp/*.lua внутри nvim-lspconfig,
      -- поднимать сервер руками через vim.lsp.start не нужно —
      -- включением занимается mason-lspconfig (см. plugins/mason.lua)

      -- кеймапы навешиваются только там, где сервер реально подключился
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspKeymaps", {}),
        callback = function(args)
          -- LSP-дополнение всплывает на triggerCharacters сервера (для lua это '.' и ':'),
          -- а <C-y> применяет побочные эффекты элемента: text edits, импорты, сниппеты.
          -- 'autocomplete' при этом отвечает за слова из буферов и окон — два механизма
          -- дополняют друг друга и не конфликтуют
          vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })

          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buf = args.buf, desc = desc })
          end

          map("<leader>lf", function() vim.lsp.buf.format() end, "format buffer")
          map("<leader>lr", vim.lsp.buf.rename, "rename symbol")
          map("<leader>la", vim.lsp.buf.code_action, "code action")
          map("<leader>ls", function()
            require("telescope.builtin").lsp_document_symbols()
          end, "document symbols")
        end,
      })
    end,
  },
}
