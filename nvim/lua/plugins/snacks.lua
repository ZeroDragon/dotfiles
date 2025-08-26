return {
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
|________/|________/|__/  |__/ \______/]],
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          -- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
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
