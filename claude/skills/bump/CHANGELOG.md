# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2026.06.03] - 2026-06-03

### Added
- CalVer (Calendar Versioning) モードのサポート（`YYYY.0M.0D` 形式）
- バージョニングモードの自動判定（既存バージョン文字列から SemVer/CalVer を判断）
- 同日複数リリース時の連番付加ルール（`.N` サフィックス）

### Changed
- 手順4を SemVer/CalVer 両対応に書き換え

(git commit: 8ca53a2)

## [0.2.0] - 2026-04-03

### Changed
- CHANGELOGの例を Keep a Changelog フォーマットに準拠するように変更
- より詳細な変更タイプカテゴリ（Added, Changed, Deprecated, Removed, Fixed, Security）を明記
- `[Unreleased]`セクションを含む標準的なCHANGELOG構造を追加
- Semantic Versioning への準拠を明示

## [0.1.0] - 2024-06-01

### Added
- プロジェクトのバージョンを自動インクリメントする機能
- git diff による変更内容の分析
- Semantic Versioning に基づくバージョン判定
- CHANGELOGファイルの自動生成と更新

(git commit: 5fa3ef2)
