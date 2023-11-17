return {
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(prop)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(prop.buf), ":t")
          if vim.bo[prop.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
