#!/bin/bash

if [[ ! $(command -v asdf) ]]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.1 >/dev/null 2>&1 || true && echo "~ asdf has been installed"
fi
