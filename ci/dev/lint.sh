#!/usr/bin/env bash
set -euo pipefail

main() {
  cd "$(dirname "$0")/../.."

  eslint --max-warnings=0 --fix $(git ls-files "*.ts" "*.tsx" "*.js")
  stylelint $(git ls-files "*.css")
  tsc --noEmit
  shellcheck -e SC2064,SC1090,SC2046 $(git ls-files "*.sh")
}

main "$@"
