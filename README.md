# Happy Valentine

A romantic Valentine's Day website with photos, music, and beautiful animations.

## Quick Start

1. **Add Your Photos**
   - Place your photos in `docs/photos/` directory
   - Required: photo1.jpg, photo3-7.jpg (JPG), photo8-12.png (PNG)
   - See `docs/photos/README.md` for details

2. **Test Locally**
   ```bash
   cd docs
   python3 -m http.server 8000
   ```
   Visit http://localhost:8000

3. **Deploy to GitHub Pages**
   - Enable GitHub Pages in repository Settings
   - Set source to "Deploy from a branch"
   - Choose branch: main, folder: /docs

## Privacy Options

- **Public Repository**: Photos will be visible to everyone
- **Private Repository**: Photos and code will be private (Settings → Change visibility)
- **Advanced**: Use a private submodule for photos (see [SETUP_PRIVATE_PHOTOS.md](SETUP_PRIVATE_PHOTOS.md))

## Project Structure

```
HappyValentine/
├── docs/
│   ├── index.html          # Main website file
│   ├── mp3/                # Audio files
│   └── photos/             # Your photos go here
├── QUICKSTART.md           # Quick setup guide
└── SETUP_PRIVATE_PHOTOS.md # Advanced: Private submodule setup
```

## Features

- ❤️ Romantic animations and effects
- 🎵 Background music support
- ��️ Photo gallery with fullscreen viewer
- 📱 Mobile-friendly responsive design
- ✨ Elegant Arabic typography and styling

## Customization

Edit `docs/index.html` to customize:
- Text content and messages
- Photo references
- Colors and styling
- Music files

---

Made with ❤️ for Valentine's Day
