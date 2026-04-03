---
name: bump
version: 0.2.0
description: Git コマンドを使用して、リポジトリの管理やコードのバージョン管理を行うスキルです
---

# Bump スキル

プロジェクトのバージョンを適切にインクリメントします。

1. Python なら `pyproject.toml` や Rust なら`Cargo.toml` などのプロジェクトのバージョンを管理するファイルを見つけます
    - 無ければユーザーに報告して終了
2. CHANGELOG ファイルを見つけ、変更内容を確認します
    - 無ければ新規作成する
3. 前回からの差分を git diff で確認し、変更内容の大きさを判断します
4. 変更内容の大きさを判断して **Semantic Versioning** に従ったバージョンアップを行います。
5. CHANGELOG ファイルに変更内容を記載します
6. ユーザーに新しいバージョンと根拠を報告します

## CHANGELOG の例

[Keep a Changelog](https://keepachangelog.com/ja/1.1.0/) のフォーマットに従います。

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- 追加予定の新機能

## [0.1.0] - 2024-06-01

### Added
- ユーザーがプロジェクトのバージョンをインクリメントできる機能

### Fixed
- 以前のバージョンで発生していたバグ

(git commit: f3ab2c3)
```

変更タイプは以下のカテゴリを使用：
- `Added`: 新機能
- `Changed`: 既存機能の変更
- `Deprecated`: 間もなく削除される機能
- `Removed`: 今回で削除された機能
- `Fixed`: バグ修正
- `Security`: 脆弱性に関する場合

git commit hash は各バージョンの末尾に記載すると後から遡れて便利です。
