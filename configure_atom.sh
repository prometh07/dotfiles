#!/bin/bash
if [ ! -d ~/.atom/packages/package-sync ]; then
  if type apm > /dev/null 2>&1; then
    echo "Installing Atom package-sync package."
    apm install package-sync
  fi
fi
