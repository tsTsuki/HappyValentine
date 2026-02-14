# Setup Guide: Private Photos Submodule

This guide explains how to set up a private photos submodule for the HappyValentine project.

## Overview

The website has been configured to load photos from `docs/private-photos/photos/`. This allows you to:
- Keep photos in a **private repository** separate from the main project
- Still use the photos in your website through a Git submodule
- Control access to the photos independently from the main repository

## Current Status

✅ HTML references updated to point to `private-photos/photos/`  
✅ Old `docs/photos/` directory removed  
⚠️ Submodule configuration removed (to prevent clone errors until you create your private repository)

## What You Need to Do

### Step 1: Create a Private GitHub Repository

1. Go to GitHub and create a **new private repository**
2. Suggested name: `HappyValentine-Photos` or `HappyValentine-Private`
3. **Important**: Make sure it's set to **Private**
4. You can initialize with README, .gitignore, or license (optional)

### Step 2: Add Photos to Your Private Repository

Upload your photos to the private repository:

1. Clone the private repository locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git
   cd YOUR_PRIVATE_REPO
   ```

2. Create a `photos/` directory and add your images:
   ```bash
   mkdir -p photos
   # Copy your photos to the photos/ directory
   # e.g., photo1.jpg, photo3.jpg, photo4.jpg, etc.
   ```

3. Commit and push:
   ```bash
   git add photos/
   git commit -m "Add photos"
   git push
   ```

### Step 3: Add the Private Repository as a Submodule

Return to your main HappyValentine repository and add the submodule:

```bash
# Make sure you're in the root of HappyValentine repository
cd /path/to/HappyValentine

# Add the private repository as a submodule
git submodule add https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git docs/private-photos

# Commit the submodule
git add .gitmodules docs/private-photos
git commit -m "Add private photos submodule"
git push
```

### Step 4: Verify the Setup

Initialize and update the submodule:

```bash
# Update the submodule
git submodule update --init --recursive
```

## How This Works

### Repository Structure

```
HappyValentine/                          (Public repository)
├── docs/
│   ├── index.html                      (References photos from submodule)
│   ├── mp3/                            (Audio files - still in main repo)
│   └── private-photos/                 (Git submodule → Private repository)
│       ├── README.md
│       └── photos/
│           ├── photo1.jpg
│           ├── photo3.jpg
│           └── ... (all photos)
└── .gitmodules                         (Submodule configuration)
```

### How References Work

The HTML file (`docs/index.html`) now references photos using paths like:
```html
<img src="private-photos/photos/photo1.jpg" alt="Memory 1">
```

These paths work because:
1. The submodule is checked out at `docs/private-photos/`
2. Photos are in the `photos/` subdirectory within the submodule
3. The website serves everything from the `docs/` directory

## Cloning the Repository with Submodules

### For You (Repository Owner)

When you clone the main repository in the future:

```bash
git clone --recurse-submodules https://github.com/tsTsuki/HappyValentine.git
```

Or if already cloned:

```bash
git submodule update --init --recursive
```

### For Collaborators

To give someone access to the photos:
1. Add them as a collaborator to your **private photos repository**
2. They can then clone with submodules using the same commands above

## Testing the Setup

After completing the setup:

1. Test locally:
   ```bash
   cd docs
   python3 -m http.server 8000
   ```
   Visit `http://localhost:8000` and verify all photos load correctly

2. Push changes and verify GitHub Pages still works

## Benefits of This Setup

✅ **Privacy**: Photos are in a private repository, separate from public code  
✅ **Control**: You can grant/revoke access to photos independently  
✅ **Functionality**: Website continues to work normally with photos  
✅ **GitHub Pages**: Still works because submodule is checked out during deployment  
✅ **Flexibility**: Can update photos without touching main repository  

## Troubleshooting

### Photos don't load on GitHub Pages

GitHub Pages automatically checks out submodules, but only if:
- The submodule repository is accessible (public OR you have GitHub Pro/Team/Enterprise)
- The submodule URL is correct

**Solution**: 
- Ensure your GitHub account has access to deploy private submodules, or
- Make the photos repository public (defeats the purpose of privacy)

### "fatal: could not access the private repository"

You need authentication. Use a personal access token:
```bash
git clone https://YOUR_TOKEN@github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git
```

Or configure Git credentials:
```bash
git config credential.helper store
```

## Alternative: Keeping Photos Fully Private

If GitHub Pages cannot access your private submodule (free account limitation), you have two options:

1. **Upgrade to GitHub Pro**: Allows private submodules with public Pages
2. **Use external hosting**: Host photos on a private server/CDN and reference by URL

## Security Notes

⚠️ **Important Security Considerations**:

- The **private photos repository** should remain private
- Only grant access to people you trust with the photos
- The **main repository** can be public (code is public, photos are not)
- Consider adding a `.gitignore` in the main repo if needed
- Never commit sensitive credentials or tokens

## Summary

You now have a structure where:
- Main repository: Can be public (contains HTML/CSS/JS code)
- Photos repository: Is private (contains personal photos)
- Website: Works normally with photos through Git submodules

The photos are kept private while still being integrated into your project! 🎉
