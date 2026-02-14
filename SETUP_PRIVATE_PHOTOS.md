# Setup Guide: Private Photos Submodule

This guide explains how to complete the setup of the private photos submodule for the HappyValentine project.

## Overview

The photos have been moved from `docs/photos/` to a Git submodule at `docs/private-photos/`. This allows you to:
- Keep photos in a **private repository** separate from the main project
- Still use the photos in your website through the submodule
- Control access to the photos independently from the main repository

## What Has Been Done

✅ All photos moved to `docs/private-photos/photos/`  
✅ HTML references updated to point to the new location  
✅ Git submodule configuration created  
✅ Old `docs/photos/` directory removed  

## What You Need to Do

### Step 1: Create a Private GitHub Repository

1. Go to GitHub and create a **new private repository**
2. Suggested name: `HappyValentine-Photos` or `HappyValentine-Private`
3. **Important**: Make sure it's set to **Private**
4. Do NOT initialize with README, .gitignore, or license (we already have content)

### Step 2: Push the Private Photos Repository

The private photos repository is currently stored locally in the submodule. You need to push it to GitHub:

```bash
# Navigate to the submodule directory
cd docs/private-photos

# Add your new private repository as the remote
git remote add origin https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git

# Push the photos to your private repository
git push -u origin main
```

### Step 3: Update the Submodule Configuration

After pushing to GitHub, update the submodule URL in the main repository:

```bash
# Go back to the main repository root
cd /home/runner/work/HappyValentine/HappyValentine

# Update the submodule URL to your actual private repository
git config -f .gitmodules submodule.docs/private-photos.url https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git

# Sync the submodule configuration
git submodule sync

# Update the submodule
git submodule update --init --recursive --remote
```

### Step 4: Update README.md (Optional)

Edit `.gitmodules` file to use your actual repository URL:

```
[submodule "docs/private-photos"]
	path = docs/private-photos
	url = https://github.com/YOUR_USERNAME/YOUR_PRIVATE_REPO.git
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
