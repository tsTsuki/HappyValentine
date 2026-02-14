# Happy Valentine

A romantic Valentine's Day website with Arabic styling and music.

## 🌐 Website

Visit the live website: [https://tstsuki.github.io/HappyValentine/](https://tstsuki.github.io/HappyValentine/)

## 📁 Repository Structure

```
HappyValentine/
├── docs/                    # GitHub Pages website files
│   ├── index.html          # Main website page
│   ├── mp3/               # Audio files
│   └── private-photos/    # Git submodule → Private photos repository
│       └── photos/        # Image gallery (in private submodule)
└── SETUP_PRIVATE_PHOTOS.md # Guide for setting up the private photos submodule
```

**Note**: Photos are now stored in a **Git submodule** that points to a private repository. This keeps personal photos private while maintaining the website functionality. See [SETUP_PRIVATE_PHOTOS.md](SETUP_PRIVATE_PHOTOS.md) for setup instructions.

## 🔒 Privacy Settings

Want to make this repository private while keeping the website public? See [MAKE_REPOSITORY_PRIVATE.md](MAKE_REPOSITORY_PRIVATE.md) for detailed instructions.

**Quick Summary:**
- GitHub allows private repositories to have public GitHub Pages (with GitHub Pro or higher)
- Your website will remain accessible while the code stays private
- Follow the steps in the guide to configure it correctly

## 🚀 GitHub Pages Configuration

This repository is configured to serve GitHub Pages from the `/docs` folder:
- **Source**: Deploy from a branch
- **Branch**: main/master
- **Folder**: /docs

### Cloning This Repository

To clone this repository with the private photos submodule:

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/tsTsuki/HappyValentine.git

# Or if already cloned, initialize submodules
cd HappyValentine
git submodule update --init --recursive
```

**Note**: You need access to the private photos repository to clone the submodule. See [SETUP_PRIVATE_PHOTOS.md](SETUP_PRIVATE_PHOTOS.md) for details.

## ⚠️ Important Notes

- Free GitHub accounts cannot have public Pages on private repositories
- You need GitHub Pro, Team, or Enterprise for this feature
- If using a free account, the repository must remain public for the website to be accessible

## 📝 License

Personal project - all rights reserved to the repository owner.
