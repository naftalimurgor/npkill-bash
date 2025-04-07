#!/bin/bash

echo "🔍 Scanning Android Studio-related folders for disk usage..."

# Directories to check
paths=(
  "$HOME/.gradle/caches"
  "$HOME/.gradle/daemon"
  "$HOME/.gradle/native"
  "$HOME/.android/avd"
  "$HOME/Android/Sdk/system-images"
  "$HOME/Android/Sdk/platforms"
  "$HOME/Android/Sdk/build-tools"
  "$HOME/Android/Sdk/ndk"
  "$HOME/Android/Sdk/cmdline-tools"
  "$HOME/.cache/Google"
  "$HOME/.local/share/Google"
)

echo ""
echo "📦 Disk usage summary:"
for path in "${paths[@]}"; do
  if [ -d "$path" ]; then
    du -sh "$path"
  else
    echo "❌ $path not found"
  fi
done

echo ""
echo "⚠️ Skipping app/build/ folders — check those manually per project."

echo ""
echo "✅ Done. You can now manually delete folders above that you don't need."
