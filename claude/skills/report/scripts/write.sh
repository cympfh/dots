#!/usr/bin/env bash
# report write スクリプト
# 使い方: write.sh <報告者名> < body.md
#         echo "markdown text" | write.sh <報告者名>
#
# 引数:
#   $1  報告者名 (例: "Surveyor")
# stdin: 本文 (markdown をそのまま渡す)

set -euo pipefail

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    cat <<'EOF'
使い方:
  write.sh <報告者名> <<'MD'
  本文 (markdown)
  MD

引数:
  <報告者名>  レポートのセクションに表示される名前 (H2 ## で出力される)
  stdin       本文 (markdown をそのまま追記)

例:
  write.sh "Claude" <<'MD'
  - 不要なログを削除
  - ディレクトリ構造を整理
  MD

  write.sh "Surveyor" <<'MD'
  ### 調査結果の報告
  - 報告者名が H2 で出力されるので
  - 本文には H3 以下の見出しを使いましょう
  MD

出力先: ./report/YYYYMMDD.md
EOF
    exit 0
fi

REPORTER="${1:?報告者名が必要です}"

TIME=$(date "+%H:%M")

REPORT_DIR="./report"
DATE_STR=$(date "+%Y-%m-%d")
DATE_FILE=$(date "+%Y%m%d")
REPORT_FILE="${REPORT_DIR}/${DATE_FILE}.md"

# report/ ディレクトリがなければ作成
mkdir -p "${REPORT_DIR}"

# ファイルがなければ日付ヘッダーを書く
if [[ ! -f "${REPORT_FILE}" ]]; then
    printf '# %s\n' "${DATE_STR}" > "${REPORT_FILE}"
fi

# stdin から本文を読み込む
BODY=$(cat)

# 末尾に追記
{
    printf '\n## %s - %s\n' "${TIME}" "${REPORTER}"
    printf '\n'
    printf '%s\n' "${BODY}"
} >> "${REPORT_FILE}"

echo "✔ ${REPORT_FILE} に追記しました"
