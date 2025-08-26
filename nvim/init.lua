-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local os_name = vim.loop.os_uname().sysname
if os_name == "Windows_NT" then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
  }
else
  print("Detected unknown OS")
end
