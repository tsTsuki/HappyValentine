# Photos Directory

This directory should contain your personal photos for the Valentine's Day website.

## Quick Start

### Option 1: Add Your Own Photos (Recommended)
Simply copy your photo files into this directory with the correct names (see Required Photos below).

### Option 2: Generate Placeholders for Testing
If you want to test the website before adding real photos:

```bash
# Requires ImageMagick
cd docs/photos
./create_placeholders.sh
```

This will create colorful placeholder images that you can replace later.

## Required Photos

Place the following photo files in this directory:

### JPG Files (photos 1, 3-7):
- `photo1.jpg`
- `photo3.jpg`
- `photo4.jpg`
- `photo5.jpg`
- `photo6.jpg`
- `photo7.jpg`

### PNG Files (photos 8-12):
- `photo8.png`
- `photo9.png`
- `photo10.png`
- `photo11.png`
- `photo12.png`

## Important Notes

⚠️ **Privacy Consideration**: 
- If you plan to keep this repository **public**, anyone can see photos in this directory
- If you want to keep photos private, consider making the entire repository private
- Alternatively, follow the instructions in `SETUP_PRIVATE_PHOTOS.md` to use a private submodule

## File Format

- Supported formats: JPG, PNG
- Recommended size: Optimize images for web (under 1MB each is ideal)
- The website will automatically handle image display and resizing

## Testing

After adding your photos, test the website locally:

```bash
cd docs
python3 -m http.server 8000
```

Then visit http://localhost:8000 to verify all photos load correctly.
