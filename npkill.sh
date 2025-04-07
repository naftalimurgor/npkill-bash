#!/bin/bash

# Default to $HOME if no directory passed
TARGET_DIR="${1:-$HOME}"

echo "⚠️  This will permanently delete all node_modules folders under: $TARGET_DIR"
read -p "Are you sure? (y/N): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "🔍 Searching for node_modules folders..."
  find "$TARGET_DIR" -type d -name "node_modules" -prune -print | while read dir; do
    echo "🗑️  Deleting $dir"
    rm -rf "$dir"
  done
  echo "✅ Done. All node_modules folders deleted from $TARGET_DIR"
else
  echo "❌ Operation cancelled."
fi
