# git

[Project Homepage](https://git-scm.com/)

[Repo](https://github.com/git/git)

## Installation

Note that git-lfs requires git >= 1.8.2

```sh
# apt-get
apt-get install git
apt-get install git-lfs
git lfs install

# homebrew
brew install git
brew install git-lfs
git lfs install

# yum (RHEL/CentOS 5 and 7)
yum install git
yum install git-lfs
git lfs install

# yum (RHEL/CentOS 6)
yum install git2u
yum install git-lfs
git lfs install
```

## git Hints

```sh
# temporarily ignore certifcate checks
git -c http.sslVerify=false clone https://github.com/...
```

## LFS Hints

```sh
# check if repo uses lfs
git lfs ls-files

# download local copies of LFS files
git lfs fetch

# download local copies of LFS files and place in working tree
git lfs pull
```
