# Personal Configuration Files

## Contents
- [Sparse Checkout](#sparse-checkout)
- [Dotfiles & Stow](#dotfiles--stow)

## Sparse Checkout

If only a subset of directories/files are needed from this repository then this can be atained using a sparse checkout 

### Version
In order to pull a folder or specific files, do a sparse checkout which requires Git 1.7.0. Sparse checkouts have since been much easier as such the following instructions require Git 2.25.0

### Instructions
1. First clone the config repo (without cloning file contents or checking out) and configure to use

```bash
git clone --filter=blob:none --no-checkout https://github.com/smithjjoseph/config.git
cd config
git sparse-checkout disable
```

> Note: By default Git sparse checkout includes patterns to checkout top-level files and not include subfolders. This can be modified in `.git/info/sparse-checkout` or by using:
> ```bash
> # Disables cone mode meaning inputs are interpretted as patterns (this is usually disabled as it is less efficient)
> git config core.sparseCheckoutCone false
> # Removes the current pattern list effectively cleaning it
> git sparse-checkout disable
> ```

2. Now define which files/folders should be checked out. This is achieved by listing them in .git/info/sparse-checkout, for example:

```bash
git sparse-checkout set "dir1/dir2/"
git sparse-checkout set "dir3/file.txt"
```

> Note: A list of files/folders/patterns to be checked out can be obtained using:
> ```bash
> git sparse-checkout list
> ```

3. Finally, checkout the entities specified in the sparse checkout:

```bash
git read-tree -mu HEAD
```

## Dotfiles & Stow

The strategy for handling configuration dotfiles is to 
1. Have a directory for each OS configuration
2. This repository is kept within `$HOME`
3. GNU stow can then be used to symlink the dotfiles to their correct locations

Ensure git and stow are installed

```bash
cd ~
git clone https://github.com/smithjjoseph/config.git dotfiles
# Choose which dotfiles configuration to use
cd dotfiles/[CHOSEN-DOTFILES]
# Creates symlinks to files rooted in the `$HOME` folder where `-t` sets the target folder
stow -t ~ .
```

> Note: `.` refers to the name of the package (`[CHOSEN-DOTFILES]`) and *not* the source, to refer to the source use `-d`

- To unstow a package use: `stow --delete [PACKAGE_NAME]`
- To restow (unstow then stow again) use: `stow --restow [PACKAGE_NAME]`