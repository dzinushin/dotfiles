return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = false, -- Neo-tree internally loads its sources only when they are used.
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>pv", "<cmd>Neotree toggle filesystem left<cr>", desc = "Toggle explorer" },
    { "<leader>pr", "<cmd>Neotree reveal filesystem left<cr>", desc = "Reveal current file" },
    { "<leader>pb", "<cmd>Neotree toggle buffers left<cr>", desc = "Buffer explorer" },
    { "<leader>pg", "<cmd>Neotree toggle git_status left<cr>", desc = "Git explorer" },
  },
  ---@module "neo-tree"
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = "filesystem", display_name = " Files" },
        { source = "buffers", display_name = " Buffers" },
        { source = "git_status", display_name = " Git" },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      modified = { symbol = "●" },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    window = {
      position = "left",
      width = 36,
      mappings = {
        ["h"] = "close_node",
        ["l"] = "open",
        ["<space>"] = "none",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        never_show = { ".DS_Store" },
      },
    },
    buffers = {
      follow_current_file = { enabled = true },
      show_unloaded = true,
    },
  },
}
