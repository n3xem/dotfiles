# dotfiles
## 初期設定
1. ホームディレクトリ直下に dotfiles ディレクトリができるように clone する。
2. dotfilesディレクトリに移動し、`$ bash init.sh` を実行してホームディレクトリにシンボリックリンクを張る。

## 各ファイルの説明
### .bashrc
ここに.bashrcのセットアップに関する説明を書く。

### .bash_aliases
エイリアスはこのファイルに書く。

### .bash_private
このリポジトリには含めない。特定の環境でしか動かない処理などを記載する。
.bashrcから呼び出されて実行される。

### .vimrc
#### Vundleのインストール
下記を実行する。
```bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### .gitconfig
`[user]` や `[ghq]` などの、使うユーザによって設定が変わる部分は、`~/.gitinclude` に記述する。

### .inputrc
https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File.html
