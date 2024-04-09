# Personal Configuration Files

## Sparse Checkout
In order to pull a folder or specific files, do a sparse checkout (Requires Git 1.7.0)

1. First initialise a new repo and link to the config repo

```bash
git init
git remote add -f origin https://github.com/smithjjoseph/config.git
```

2. This fetches all objects but doesn't check them out. Next, configure: the repository to use sparse checkouts:

```bash
git config core.sparseCheckout true
```

3. Now define which files/folders should be checked out. This is achieved by listing them in .git/info/sparse-checkout, for example:

```bash
echo "dir1/dir2/" >> .git/info/sparse-checkout
echo "dir3/file.txt" >> .git/info/sparse-checkout
```

4. Finally, update the empty repo with the state from the remote:

```bash
git pull origin master
```

---

As of git 2.25.0 a sparse-checkout command has been added to git:

- Create repo and apply config:

`git sparse-checkout init`

- Add folders to be checked out:

`git sparse-checkout set "dir1/dir2/"`

- Read list of files/folders to be checked out

`git sparse-checkout list`