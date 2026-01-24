#!/bin/bash

# Icon Generator Script for Greetings App
# This script generates all required app icon sizes from a single source image
# 
# Usage: 
#   1. Create a 1024x1024 PNG image named "icon-source.png" in this directory
#   2. Run: ./generate-icons.sh
#   3. The icons will be generated in the AppIcon.appiconset folder

SOURCE_IMAGE="icon-source.png"
ICON_DIR="Greetings/Assets.xcassets/AppIcon.appiconset"

# Check if source image exists
if [ ! -f "$SOURCE_IMAGE" ]; then
    echo "❌ Error: $SOURCE_IMAGE not found!"
    echo ""
    echo "Please create a 1024x1024 PNG image named 'icon-source.png'"
    echo "You can use any image editor or online tool to create it."
    echo ""
    echo "The image should represent 'Greetings' - could be:"
    echo "  - A friendly greeting message (Hello, Hi, etc.)"
    echo "  - A hand wave emoji or illustration"
    echo "  - A sunrise/sunset (for time-based greetings)"
    echo "  - A quote bubble or speech bubble"
    exit 1
fi

# Check if sips is available (macOS built-in tool)
if ! command -v sips &> /dev/null; then
    echo "❌ Error: sips command not found. This script requires macOS."
    exit 1
fi

echo "🎨 Generating app icons from $SOURCE_IMAGE..."
echo ""

# iOS Icons (1024x1024)
echo "📱 Generating iOS icons..."
sips -z 1024 1024 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-1024.png"
sips -z 1024 1024 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-1024-dark.png"
sips -z 1024 1024 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-1024-tinted.png"

# macOS Icons
echo "💻 Generating macOS icons..."

# 16x16 (1x and 2x)
sips -z 16 16 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-16.png"
sips -z 32 32 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-16@2x.png"

# 32x32 (1x and 2x)
sips -z 32 32 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-32.png"
sips -z 64 64 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-32@2x.png"

# 128x128 (1x and 2x)
sips -z 128 128 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-128.png"
sips -z 256 256 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-128@2x.png"

# 256x256 (1x and 2x)
sips -z 256 256 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-256.png"
sips -z 512 512 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-256@2x.png"

# 512x512 (1x and 2x)
sips -z 512 512 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-512.png"
sips -z 1024 1024 "$SOURCE_IMAGE" --out "$ICON_DIR/AppIcon-512@2x.png"

echo ""
echo "✅ All icons generated successfully!"
echo ""
echo "📋 Generated icons:"
echo "   - iOS: 1024x1024 (standard, dark, tinted)"
echo "   - macOS: 16x16, 32x32, 128x128, 256x256, 512x512 (1x and 2x)"
echo ""
echo "💡 Tip: For dark and tinted iOS icons, you may want to:"
echo "   1. Create darker versions of your icon for dark mode"
echo "   2. Create tinted versions with your app's accent color"
echo "   3. Replace AppIcon-1024-dark.png and AppIcon-1024-tinted.png manually"
