#!/usr/bin/zsh -i

set -o errexit
set -o nounset
set -o pipefail

# Install runtime
asdf install

# Install Python dependencies
pip install -r requirements.txt -r requirements-dev.txt