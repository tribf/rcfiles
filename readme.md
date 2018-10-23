# Tribf rcfiles

## shell
### install
```bash
git clone --depth 1 https://github.com/tribf/rcfiles.git rcfiles
cd rcfiles
./rcfiles
```

## vim2editor
### install
```bash
cp vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tomasr/molokai.git
cp -r molokai/colors/ ~/.vim
aptinstall exuberant-ctags
vim
:BundleInstall

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
:YcmRestartServer
:YcmDebugInfo
```
