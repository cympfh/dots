---
name: arxiv-memo
description: 論文の内容を完全に理解するための補助教材となるテキストを Markdown 形式で作成する
---

# arxiv-memo

## Instructions

1. arxiv の ID または URL を特定する
2. arxiv-mcp-server を用いて論文をダウンロードする
    - ダウンロードには時間が掛かるので sleep 10 くらいする
    - ~/.arxiv-mcp-server/papers/*.md が保存されるはず
3. 論文の内容を読む
    - 必要に応じて分割しながら読む (2000行ずつくらいが目安)
4. 内容を理解してドキュメントを作成する

ドキュメントのファイル名は `{arxiv_id}.{slug}.md` とする.
slug は論文の内容が完結に分かる英単語を３つ程度 _ で繋げたものとする.
元のタイトルに含まれている単語を使うことが望ましい.

例えば "Phantom Subgroup Poisoning: Stealth Attacks on Federated Recommender Systems" が元のタイトルであれば `Phantom_Subgroup_Poisoning` などが考えられる.

## Document Content

- 論文の内容を完全に理解させることが目的です
- 数式は Mathjax3 形式で記述 ($~$, $$~$$)
- 箇条書き (list) のブロックの前後には必ず空行を入れる
- 言語は日本語を用いるが, 専門用語は英語のままが望ましい

簡単なサンプルは以下のとおりです

```markdown
# title
## 論文情報

- タイトル: ...
- 著者: ...
- arxiv ID: 2309.03409
- 発表日: YYYY年MM月
- URL: [https://arxiv.org/abs/2309.03409](https://arxiv.org/abs/2309.03409)

# 1. 論文の概要と目的

...

# 12. 関連リソース

- 公式 Github リポジトリなど

# 13. 読解のための補足

## 用語集

## 重要な記号

## 重要な数式まとめ

# 14. まとめ
```

