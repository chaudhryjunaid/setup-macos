#!/usr/bin/env bash
#
# A script to install a collection of Homebrew applications, services,
# languages, fonts, and utilities in a controlled manner.
#

# -------------------------------------------------------------------------
# 1. Safety settings
# -------------------------------------------------------------------------
# -e (errexit):      Exit on error.
# -u (nounset):      Treat unset variables as an error.
# -o pipefail:       Pipeline fails if any command in the pipeline fails.
# IFS=$'\n\t':       Safe handling of word splitting.
# -------------------------------------------------------------------------
set -euo pipefail
IFS=$'\n\t'

# -------------------------------------------------------------------------
# 2. Detecting Homebrew
# -------------------------------------------------------------------------
if ! command -v brew &>/dev/null; then
  echo "Error: Homebrew is not installed or not found in PATH."
  echo "Please install Homebrew first (https://brew.sh/) before running this script."
  exit 1
fi

# -------------------------------------------------------------------------
# 3. Script definitions
# -------------------------------------------------------------------------
SCRIPTS=(
  "brew-cli.sh"
  "brew-apps.sh"
  "brew-services.sh"
  "brew-langs.sh"
  "brew-fonts.sh"
  "brew-utils.sh"
)

echo "Installing selected applications..."

# -------------------------------------------------------------------------
# 4. Main Installation Loop
# -------------------------------------------------------------------------
for script in "${SCRIPTS[@]}"; do
  if [[ -x "$script" ]]; then
    echo "Running $script..."
    "./$script"
  else
    echo "Warning: $script is not executable or not found. Skipping."
  fi
done

# -------------------------------------------------------------------------
# 5. Completion Message
# -------------------------------------------------------------------------
echo "All done!"
