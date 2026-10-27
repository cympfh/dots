# AGENTS.md

個人の dotfiles。`git clone git@github.com:cympfh/dots.git ~/.dots/` で置く。インストールは `Makefile`。設定本体はツールごとのディレクトリにあり、シンボリックリンクか `source` でホームへつなぐ。

新しい `make` ターゲットは、直前に `## 説明` を書く。`make help` はその行から説明を出す。

## インストール

| ターゲット | 動作 |
|---|---|
| `feh` | `~/.config/feh/keys` へリンク |
| `vim` | `~/.vimrc` へ `source` を追記。vim-plug が無ければ取得 |
| `nvim` | `~/.config/nvim` へリンク。vim-plug 取得後、`PlugInstall` と `CocUpdateSync` |
| `zsh` | `~/.zshenv` と `~/.config/zsh/.zlogout` をリンク。`~/.config/zsh/.zshrc` へ `source` を追記 |
| `bash` | `~/.bashrc` へ `source` を追記 |
| `screen` | `~/.screenrc` へ `source` を追記 |
| `git` | `~/.gitconfig` へリンク |
| `tmux` | `~/.tmux.conf` へリンク |
| `input` | `~/.inputrc` へリンク |
| `i3` | `~/.i3/config` へコピー。リンクではない |
| `uv` | uv を入れ、`~/test/uv-env` を作る |

`make vim`、`bash`、`screen`、`zsh` は既存ファイルへ `source` 行を足す。同じターゲットを二度実行すると行が重複する。`ln -s` のターゲットは、リンク先が既にあると失敗する。`zsh` のリンクだけ `ln -sf` で上書きする。

## 構成

- `zsh/zshenv` が `ZDOTDIR=$HOME/.config/zsh` と `ZPLUGDIR=~/.dots/zsh/plug` を定義する
- `zsh/zshrc` が `zsh/plug/` の個別ファイルを `source` する。追加するプラグインはここに1行足す。`mac.sh` は `MAC=1` のときだけ。`linuxbrew.sh` はファイルがあるが `zshrc` は読まない
- `vimrc` と `nvim/init.vim` が `vim/` と `nvim/core/` を `source` する
- `nvim/plugged/` は `make nvim` が vim-plug で入れる。`nvim/.gitignore` で除外し、リポジトリには入れない
- `gitconfig` の `[init] templatedir` は `git/template`。`pre-commit` フックの実体はそこにある
- `vimperator/`、`xinitrc`、`yamllint` は Makefile にターゲットが無い。配置は手で行う

## Neovim

`nvim/init.vim` が `nvim/core/lsp.lua` を読む。有効なサーバーは `vim.lsp.enable` の引数。各サーバーの `cmd`、`filetypes`、`root_markers`、`settings` は `nvim/lsp/<name>.lua`。`nvim/` が runtimepath に入るので、`vim.lsp.enable` がそこを読む。

サーバーを足すときは `nvim/lsp/<name>.lua` を置き、`vim.lsp.enable` に名前を加える。保存時フォーマットが要るなら `LspAttach` 内の `client.name` 分岐にも足す。

今の保存時フォーマット:

- `ruff`: import 整理のあと format
- `rust-analyzer`: format
- `taplo`: LSP の format を試し、バッファが変わらなければ `taplo format -` に渡す。除外された文書は LSP が編集を返さない
- `ty`: 診断のみ。保存時フォーマットはしない

`taplo` の実行ファイルは `cargo install taplo-cli --locked` で入る。`make nvim` は入れない。

## Git ユーザー

`gitconfig` の `[user]` が既定。`includeIf "gitdir:"` でディレクトリごとのプロファイルに切り替える。

- `~/.dots/`、`~/bin/`、`~/git/` は `git/users/cympfh.git`
- `~/dw/` は `git/users/khattori-dw.git`。こちらは commit 署名が有効
