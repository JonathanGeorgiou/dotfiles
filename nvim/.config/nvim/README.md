######################
ColossalNvim
######################

My Neovim config based on the wonderful [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
# TODO
- [x] Comment.nvim
- [x] open brackets/qutoes automatically close solved by auto-pairs.nvim
- [x] Markdown something
- [x] tabs/buffers
- [x] create git repo
- [ ] fix tree-sitter markdown-inline error on start up
- [ ] install which-key.nvim
- [ ] format on save
- [ ] look into gnu stow for managing dotfiles
- [ ] git plugin
- [ ] scroll through snippets with tab
- [ ] dadbod sql plugin
- [ ] make bufferline pretty
- [ ] make lualine pretty
- [ ] figure out neotree keymaps (unhiding files etc)

# Things I have done
- installed Catppuccin Plasma colorschemes
- edited crontab with the following
```bash
0 20 * * * plasma-apply-colorscheme CatppuccinMochaFlamingo >/dev/null 2>&1
0  7 * * * plasma-apply-colorscheme CatppuccinLatteFlamingo >/dev/null 2>&1
```
This will cause my system colorscheme to automatically switch at 8pm to dark mode 
NOTE this doesn't work and isnt really needed, I have just assigned a kde shortcut of 
`META + SHIFT + d` - Dark Mode
`META + SHIFT + l` - Light Mode

