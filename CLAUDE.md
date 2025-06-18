# CLAUDE.md

このファイルは、このリポジトリでコードを操作する際にClaude Code (claude.ai/code) にガイダンスを提供します。

## リポジトリの概要

これは、モジュラーなMakefileベースのインストールシステムを使用して、さまざまな開発ツールの設定ファイルを管理する個人のdotfilesリポジトリです。このリポジトリは、シンボリックリンクとsourceコマンドを使用して設定をユーザーの環境に統合します。

## 共通コマンド

### インストールコマンド

```bash
# 個別のツール設定をインストール
make feh     # 画像ビューア設定
make vim     # Vimエディタのプラグイン付きセットアップ
make nvim    # Neovimのプラグインインストール付きセットアップ
make zsh     # ZSHシェル設定
make git     # ユーザープロファイル付きGit設定
make tmux    # ターミナルマルチプレクサ設定
make screen  # GNU Screen設定
make i3      # i3ウィンドウマネージャ設定
make bash    # Bashシェル設定
make input   # Readline入力設定

# 利用可能な全てのターゲットを説明付きで表示
make help
```

### 主要なインストール動作

- ほとんどの設定でシンボリックリンクを使用（git、tmux、nvim、feh）
- 既存のdotfilesにsourceコマンドを追記（vim、zsh、bash、screen）
- プラグインマネージャーを自動ダウンロード（vim/nvim用のvim-plug）
- 必要なディレクトリを作成し、依存関係を処理
- Neovimインストールには自動プラグインインストールとCoC更新が含まれる

## アーキテクチャと構造

### モジュラープラグインシステム

- **ZSH**: `/zsh/plug/` に特定機能用の個別`.sh`ファイルを格納（git、fzf、prompt等）
- **Neovim**: `/nvim/core/` に異なる機能用の特化した`.vim`と`.lua`ファイルを格納
- **Git**: `/git/users/`内の別々のユーザープロファイルを持つ`includeIf`ディレクティブを使用した条件付きユーザー設定

### 設定読み込みパターン

- 中央設定ファイル（zshrc、init.vim）がモジュラーコンポーネントをsource
- 環境変数でプラグインディレクトリを定義（`$ZPLUGDIR`、`$ZDOTDIR`）
- プラットフォーム固有プラグイン（mac.sh、windows.sh）によるクロスプラットフォーム互換性

### 主要ファイル

- `Makefile` - インストール自動化と利用可能ターゲット
- `zsh/zshrc` - `/zsh/plug/`から全プラグインを読み込むメインZSH設定
- `nvim/init.vim` - プラグイン読み込み付きNeovimエントリーポイント
- `gitconfig` - 条件付きユーザープロファイル包含付きGit設定
- `zsh/zshenv` - ZSH環境変数定義

## 開発ノート

### Gitユーザー管理

このリポジトリは条件付きincludeを通じて複数のGitユーザープロファイルをサポート:

- メインgitconfigのデフォルトユーザー
- `/git/users/`内のディレクトリ固有ユーザー（例：`cympfh.git`、`khattori-dw.git`）
- `includeIf "gitdir:"`を使用してリポジトリ場所に基づいてプロファイルを有効化

### プラグイン構成

- 各ツールカテゴリがモジュラーコンポーネント付きの独自ディレクトリを持つ
- ZSHプラグインが特定機能を処理（エイリアス、バインディング、シンタックスハイライト）
- Neovimコアファイルが機能を整理（言語サポート、ファイル管理、テーマ）
- 他に影響を与えずに個別コンポーネントの追加/削除が容易
