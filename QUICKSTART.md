# Quick Start: Setup Private Photos Repository

## Current Status

✅ HTML references updated to expect photos at `private-photos/photos/`  
✅ Old photos directory removed from the repository  
⚠️ Submodule configuration removed (to prevent clone errors)  

## Next Steps (REQUIRED to restore photos)

The photos submodule has been temporarily removed because it was referencing a non-existent repository. To restore the photos functionality:

### 1. Create a Private GitHub Repository

Go to GitHub and create a new **private** repository:
- Name suggestion: `HappyValentine-Photos`
- Set visibility to **Private**
- Initialize with README (recommended)

### 2. Add Your Photos

Upload your photos to the private repository:
- Create a `photos/` directory
- Add all your photo files (photo1.jpg, photo3.jpg, etc.)
- Commit and push

### 3. Add as Submodule

From your main HappyValentine repository:

```bash
# Add the private repository as a submodule
git submodule add https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git docs/private-photos

# Commit the submodule configuration
git add .gitmodules docs/private-photos
git commit -m "Add private photos submodule"
git push
```

### 4. Verify Setup

After setting up the submodule:

```bash
# Initialize and update the submodule
git submodule update --init --recursive

# Test locally
cd docs
python3 -m http.server 8000
```

Visit http://localhost:8000 and verify photos load correctly.

## For More Details

See [SETUP_PRIVATE_PHOTOS.md](SETUP_PRIVATE_PHOTOS.md) for complete documentation.

## Important Notes

⚠️ **Why was the submodule removed?**
The submodule configuration was referencing a non-existent repository (`https://github.com/tsTsuki/HappyValentine-Photos.git`), which caused clone errors in CI/CD pipelines. It has been removed until you create your actual private repository.

## Result

Once complete:
- Main repository: Can stay public (no photos in it)
- Photos repository: Private (only you and collaborators can access)
- Website: Works normally with photos via submodule 🎉
