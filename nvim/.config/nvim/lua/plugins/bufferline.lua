local utils = require "utils"
  return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
      -- Mappings
      utils.map("n", "<Tab>", ":BufferLineCycleNext<CR>", {}),
      utils.map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {}),

        options = {
          diagnostics = "nvim_lsp",
          always_show_bufferline = false,
          right_mouse_command = utils.bufremove, -- can be a string | function | false, see "Mouse actions"
          left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          separator_style = "slope",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
          },
        }
      })
    end,
  }
