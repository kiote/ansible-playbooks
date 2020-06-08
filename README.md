## Local system setup

1. Install ansible
2. Run `ansible-playbook nvim-playbook.yml --ask-become-pass`
3. Run `ansible-playbook nvim-config-playbook.yml`
4. Run `:PlugInstall` in neovim
5. Run `:CocInstall coc-json coc-tsserver`
6. Run `:CocConfig` and add these lines:
```
{
  "elixir.pathToElixirLS": "~/.elixir-ls/release/language_server.sh"
}
```
7. Change default shell (open kitty first): `chsh -s $(which zsh)`

### Todo:

kien.github.io/ctrlp.vim/#installation add to ansible
