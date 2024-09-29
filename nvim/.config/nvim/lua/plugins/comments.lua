return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        toggler = { line = '<leader>/' },
        opleader = { line = '<leader>/' },
      }
    end,
  },
}
