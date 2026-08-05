# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

このファイルは、このリポジトリでコードを操作する際にClaude Code (claude.ai/code) にガイダンスを提供します。

## リポジトリの概要

これは、モジュラーなMakefileベースのインストールシステムを使用して、さまざまな開発ツールの設定ファイルを管理する個人のdotfilesリポジトリです。このリポジトリは、シンボリックリンクとsourceコマンドを使用して設定をユーザーの環境に統合します。

## 共通コマンド

### インストールコマンド

```bash
# 個別のツール設定をインストール
make feh           # 画像ビューア設定
make vim           # Vimエディタのプラグイン付きセットアップ
make nvim          # Neovimのプラグインインストール付きセットアップ
make zsh           # ZSHシェル設定
make git           # ユーザープロファイル付きGit設定
make tmux          # ターミナルマルチプレクサ設定
make screen        # GNU Screen設定
make i3            # i3ウィンドウマネージャ設定
make bash          # Bashシェル設定
make input         # Readline入力設定
make uv            # uv (Python パッケージマネージャ) のインストールとサンプル環境作成
make claude-skills # ~/.claude/skills/ に claude/skills/ 以下の各スキルをシンボリックリンク

# 利用可能な全てのターゲットを説明付きで表示
make help
```

`make help` は各ターゲット直前の `## コメント` から動的に説明を生成している（`Makefile` 内の `help` ターゲットを参照）。新しいターゲットを追加する場合は、ターゲットの直前に `## 説明文` を書くこと。

### 主要なインストール動作

- ほとんどの設定でシンボリックリンクを使用（git、tmux、nvim、feh、claude-skills）
- 既存のdotfilesにsourceコマンドを追記（vim、zsh、bash、screen）
- プラグインマネージャーを自動ダウンロード（vim/nvim用のvim-plug）
- 必要なディレクトリを作成し、依存関係を処理
- Neovimインストールには自動プラグインインストールとCoC更新が含まれる（`nvim --headless -u ... +PlugInstall +qall` / `+CocUpdateSync +qall`）

## アーキテクチャと構造

### モジュラープラグインシステム

- **ZSH**: `/zsh/plug/` に特定機能用の個別`.sh`/`.zsh`ファイルを格納（git、fzf、prompt等）。`zshrc` が全てをsource
- **Neovim**: `/nvim/core/` に異なる機能用の特化した`.vim`と`.lua`ファイルを格納。`init.vim` が全てをsource
- **Git**: `/git/users/`内の別々のユーザープロファイルを持つ`includeIf`ディレクティブを使用した条件付きユーザー設定

### 設定読み込みパターン

- 中央設定ファイル（zshrc、init.vim）がモジュラーコンポーネントをsource
- 環境変数でプラグインディレクトリを定義（`$ZPLUGDIR`、`$ZDOTDIR`。`zsh/zshenv` で定義）
- プラットフォーム固有プラグイン（mac.sh、windows.sh）によるクロスプラットフォーム互換性

### Neovim LSP設定（`nvim/core/lsp.lua` / `nvim/lsp/`）

- Neovim組み込みの `vim.lsp.enable({...})` を使い、有効化するサーバー名のリストを `nvim/core/lsp.lua` で宣言する
- 各サーバーの実体設定（`cmd`、`filetypes`、`root_markers`、`settings`）は `nvim/lsp/<name>.lua` に1ファイルずつ定義する（例: `ruff.lua`、`rust-analyzer.lua`、`ty.lua`）。`nvim/` が runtimepath に含まれているため、`vim.lsp.enable` はここを自動検出する
- 新しいLSPサーバーを追加する場合は、`nvim/lsp/<name>.lua` を追加し、`nvim/core/lsp.lua` の `vim.lsp.enable({...})` にサーバー名を加える
- 保存時フォーマット（`BufWritePre`）はサーバーごとに `LspAttach` autocmd 内で `client.name` によって分岐している。Python(`ruff`)は import 整理 + format、Rust(`rust-analyzer`)はformatのみ

### Claude Code スキル（`claude/skills/`）

- 各スキルは `claude/skills/<name>/SKILL.md`（YAMLフロントマター + Markdown本文）として定義され、`make claude-skills` で `~/.claude/skills/<name>` にシンボリックリンクされる
- スキル追加時は `claude/skills/` にディレクトリを作り、`Makefile` の `claude-skills` ターゲットにリンク行を追加すること

## 開発ノート

### Gitユーザー管理

このリポジトリは条件付きincludeを通じて複数のGitユーザープロファイルをサポート:

- メインgitconfigのデフォルトユーザー
- `/git/users/`内のディレクトリ固有ユーザー（例：`cympfh.git`、`khattori-dw.git`）
- `includeIf "gitdir:"`を使用してリポジトリ場所に基づいてプロファイルを有効化

### プラグイン構成

- 各ツールカテゴリがモジュラーコンポーネント付きの独自ディレクトリを持つ
- ZSHプラグインが特定機能を処理（エイリアス、バインディング、シンタックスハイライト）
- Neovimコアファイルが機能を整理（言語サポート、ファイル管理、テーマ、LSP）
- 他に影響を与えずに個別コンポーネントの追加/削除が容易
