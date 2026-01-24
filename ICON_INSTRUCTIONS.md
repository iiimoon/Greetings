# App Icon Generation Instructions

## Quick Start

1. **Create a 1024x1024 PNG image** named `icon-source.png` in the project root
2. **Run the script**: `./generate-icons.sh`
3. **Done!** All icon sizes will be generated automatically

## Creating Your Icon

Your icon should represent "Greetings" - here are some ideas:

### Design Ideas:
- 🌅 **Time-based greeting**: Sunrise/sunset representing morning/evening
- 👋 **Hand wave**: Friendly wave gesture
- 💬 **Speech bubble**: With "Hello" or greeting text
- ✨ **Sparkles**: Representing inspiration and quotes
- 📜 **Scroll/quote**: Representing daily quotes
- 🌈 **Colorful gradient**: With greeting text overlay

### Design Requirements:
- **Size**: 1024x1024 pixels
- **Format**: PNG with transparency (if needed)
- **Style**: Simple, recognizable at small sizes
- **Colors**: Use your app's color scheme (blue/purple gradient from your app)
- **No text at small sizes**: Text should be readable or omitted for smaller icons

## Tools to Create Your Icon

### Free Online Tools:
1. **Canva** (https://www.canva.com) - Easy drag-and-drop design
2. **Figma** (https://www.figma.com) - Professional design tool (free tier)
3. **GIMP** (https://www.gimp.org) - Free image editor
4. **Photopea** (https://www.photopea.com) - Browser-based Photoshop alternative

### Quick Template:
1. Create a 1024x1024 canvas
2. Add a gradient background (blue to purple, matching your app)
3. Add a greeting emoji or icon in the center
4. Export as PNG

## After Creating icon-source.png

Simply run:
```bash
./generate-icons.sh
```

The script will automatically generate all required sizes:
- iOS: 1024x1024 (standard, dark mode, tinted)
- macOS: 16x16, 32x32, 128x128, 256x256, 512x512 (1x and 2x versions)

## Manual Alternative

If you prefer to create icons manually, here are all the required sizes:

### iOS Icons:
- `AppIcon-1024.png` - 1024x1024 (required for App Store)
- `AppIcon-1024-dark.png` - 1024x1024 (dark mode variant)
- `AppIcon-1024-tinted.png` - 1024x1024 (tinted variant)

### macOS Icons:
- `AppIcon-16.png` - 16x16
- `AppIcon-16@2x.png` - 32x32
- `AppIcon-32.png` - 32x32
- `AppIcon-32@2x.png` - 64x64
- `AppIcon-128.png` - 128x128
- `AppIcon-128@2x.png` - 256x256
- `AppIcon-256.png` - 256x256
- `AppIcon-256@2x.png` - 512x512
- `AppIcon-512.png` - 512x512
- `AppIcon-512@2x.png` - 1024x1024

## Tips

1. **Test at small sizes**: Make sure your icon is recognizable at 16x16
2. **Use simple shapes**: Complex designs don't scale well
3. **High contrast**: Ensure good visibility on different backgrounds
4. **No rounded corners**: iOS/macOS will add them automatically
5. **Transparent background**: Optional, but can look cleaner

## Need Help?

If you need a quick placeholder, you can:
1. Use any 1024x1024 image temporarily
2. Replace it later with your final design
3. The script will regenerate all sizes automatically
