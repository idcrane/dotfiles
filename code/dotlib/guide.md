# Guides

## git

[Project Homepage](https://git-scm.com/)

[Repo](https://github.com/git/git)

Note that git-lfs requires git >= 1.8.2

```sh
# installation

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

```sh
# temporarily ignore certifcate checks
git -c http.sslVerify=false clone https://github.com/...
```

```sh
# git lfs

# check if repo uses lfs
git lfs ls-files

# download local copies of LFS files
git lfs fetch

# download local copies of LFS files and place in working tree
git lfs pull
```

## fzf

[Project Homepage](https://github.com/junegunn/fzf)

[Repo](https://github.com/junegunn/fzf)

```sh
# installation

# apt-get
apt-get install fzf

# git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# homebrew
brew install fzf

# yum
# none
```

## keychain

[Project Homepage](https://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/)

[Repo](https://github.com/funtoo/keychain)

```sh
# installation

# apt-get
apt-get install keychain

# yum
rpm --import http://wiki.psychotic.ninja/RPM-GPG-KEY-psychotic
rpm -ivh http://packages.psychotic.ninja/6/base/i386/RPMS/psychotic-release-1.0.0-1.el6.psychotic.noarch.rpm

yum --enablerepo=psychotic install keychain
```

## neovim

[Project Homepage](https://neovim.io/)

[Repo](https://github.com/neovim/neovim)

## Installation

```sh
# apt-get
apt-get install neovim

# homebrew
brew install neovim

# yum
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
```

## ssh

```sh
# create key (using dotlib script)
ssh-keygen-25519

# install public key on server
ssh-copy-id -i ~/.ssh/id_rsa.pub -p port user@host
```
