-- bootstrap lazy.nvim, LazyVim and your plugins

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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    -- { import = "plugins" },
    {
      "folke/snacks.nvim",
      opts = {
        explorer = {},
        picker = {
          sources = {
            explorer = {
              layout = { preset = "sidebar", preview = false, layout = { position = "right" } },
            },
          },
        },
        dashboard = {
          preset = {
            header = [[ /$$$$$$$$ /$$$$$$$$ /$$$$$$$   /$$$$$$ 
|_____ $$ | $$_____/| $$__  $$ /$$__  $$
     /$$/ | $$      | $$  \ $$| $$  \ $$
    /$$/  | $$$$$   | $$$$$$$/| $$  | $$
   /$$/   | $$__/   | $$__  $$| $$  | $$
  /$$/    | $$      | $$  \ $$| $$  | $$
 /$$$$$$$$| $$$$$$$$| $$  | $$|  $$$$$$/
|________/|________/|__/  |__/ \______/ ]],
            keys = {
              { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
              -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
              -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
              { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
              { icon = " ", key = "s", desc = "Restore Session", section = "session" },
              -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
              -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
              { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
          },
          sections = {
            { section = "header" },
            { section = "keys",  gap = 1, padding = 1 },
            -- { section = "startup" },
          },
        },
      },
      keys = {
        {
          "<leader><space>",
          function()
            local snacks = Snacks.picker.current
            if snacks then
              snacks.input.win:focus()
            else
              Snacks.explorer({ focus = "input" })
            end
          end,
          desc = "Find files",
        },
      },
    }
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- REMAPS
local map = vim.keymap.set
local command = vim.api.nvim_create_user_command

-- better indenting
map("v", "<S-Tab>", "<gv")
map("v", "<Tab>", ">gv")
-- map("n", "<Space>", "i", { noremap = true, silent = true })
map("n", "<C-z>", "u", { noremap = true })
map("i", "<C-z>", "<ESC>u<CR>i", { noremap = true })

command("Q", function(opts)
  if opts.bang then
    vim.cmd("qa!")
  else
    vim.cmd("qa")
  end
end, { bang = true })
