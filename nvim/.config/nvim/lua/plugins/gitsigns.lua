-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keyutils.maps.
local utils = require "utils"

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        -- Navigation
        utils.map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { buffer = bufnr, desc = 'Jump to next git [c]hange' })

        utils.map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { buffer = bufnr, desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        utils.map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { buffer = bufnr, desc = 'stage git hunk' })
        utils.map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { buffer = bufnr, desc = 'reset git hunk' })
        -- normal mode
        utils.map('n', '<leader>hs', gitsigns.stage_hunk, { buffer = bufnr, desc = 'git [s]tage hunk' })
        utils.map('n', '<leader>hr', gitsigns.reset_hunk, { buffer = bufnr, desc = 'git [r]eset hunk' })
        utils.map('n', '<leader>hS', gitsigns.stage_buffer, { buffer = bufnr, desc = 'git [S]tage buffer' })
        utils.map('n', '<leader>hu', gitsigns.undo_stage_hunk, { buffer = bufnr, desc = 'git [u]ndo stage hunk' })
        utils.map('n', '<leader>hR', gitsigns.reset_buffer, { buffer = bufnr, desc = 'git [R]eset buffer' })
        utils.map('n', '<leader>hp', gitsigns.preview_hunk, { buffer = bufnr, desc = 'git [p]review hunk' })
        utils.map('n', '<leader>hb', gitsigns.blame_line, { buffer = bufnr, desc = 'git [b]lame line' })
        utils.map('n', '<leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = 'git [d]iff against index' })
        utils.map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { buffer = bufnr, desc = 'git [D]iff against last commit' })
        -- Toggles
        utils.map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = '[T]oggle git show [b]lame line' })
        utils.map('n', '<leader>tD', gitsigns.toggle_deleted, { buffer = bufnr, desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
