return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    { "gh", vim.lsp.buf.hover, desc = "Hover" },

    {
      "'f",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          no_ignore = false,
          hidden = true,
        })
      end,
    },
    {
      "'r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep()
      end,
    },
    {
      "<leader><space>",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
    },
    {
      "<leader>sf",
      function()
        local telescope = require("telescope")
        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        n = {},
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 9999,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
        mappings = {
          ["n"] = {
            ["N"] = fb_actions.create,
            ["h"] = fb_actions.goto_parent_dir,
            ["R"] = fb_actions.rename,
            ["D"] = fb_actions.remove,
          },
        },
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
}
