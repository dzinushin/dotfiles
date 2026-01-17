
Runtime path

requrie("options") -> {rtp}/lua/options.lua

```
local function runtime_paths()
  print("Runtime paths:")
  for path in vim.o.runtimepath:gmatch("[^,]+") do
     print("  - " .. path)
  end
end


vim.api.nvim_create_user_command("RuntimePath", runtime_paths, {})

```
