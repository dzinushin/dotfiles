return {
  "mistweaverco/kulala.nvim",
  -- все глобальные клавиши kulala, то есть работающие вне .http-буфера:
  -- пять дефолтных плюс своя RE. остальные привязаны к филетайпу и приезжают с ft.
  -- клавиши, которой нет в keys, до загрузки плагина не существует
  keys = {
    "<leader>Rb", -- scratchpad
    "<leader>Ro", -- open kulala
    "<leader>Rs", -- send request
    "<leader>Ra", -- send all requests
    "<leader>Rr", -- replay last request
    "<leader>RE", -- view current env (см. global_keymaps ниже)
  },
  ft = { "http", "rest" },
  opts = {
    global_keymaps = {
      ["View current env"] = { -- sets global mapping
        "<leader>RE",
        function() print("***ENV: " .. require("kulala").get_selected_env()) end,
      },
    },
  },
}
