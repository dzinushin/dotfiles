return {
  {
    'mistweaverco/kulala.nvim',
    keys = {"<leader>Rs", "<leader>Ra", "<leader>Ro"},
    ft = {"http", "rest"},
    opts = {
      global_keymaps = {
        ["View current env"] = { -- sets global mapping
          "<leader>RE",
          function() print("***ENV: " .. require("kulala").get_selected_env()) end,
        },
      },
    },
  },
}
