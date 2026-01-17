# NVIM concetps

### run with another config

NVIM_APPNAME=nvim-scratch ./build/bin/nvim


### Options

:h options

```
vim.o
vim.opt
```

### Runtime path

runtimepath or rtp

```
set rtp?
```

rtp scanned for scripts in /lua/*.lua (for require) or /plugin (for autp exec)

```
vim.o.rtp
vim.o.runtimepath
```

```
-- how modify
local packages = vim.fn.expand("~/packages")
local foo = packages .. "/foo"

vim.o.runtimepath = vim.o.runtimepath .. "," .. foo
-- or (same)
vim.opt.rtp::append(foo)
```

```
-- you can view autoexecuted scripts (in particular order) with
scriptnames
```


### User commands


```
local function runtime_paths()
  print("Runtime paths:")
  for path in vim.o.runtimepath:gmatch("[^,]+") do
     print("  - " .. path)
  end
end


vim.api.nvim_create_user_command("RuntimePath", runtime_paths, {})
```

