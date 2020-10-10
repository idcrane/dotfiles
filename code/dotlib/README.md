# dotfiles

Ian's dotfiles and resources.

## Getting Started

[yadm Installation Guide](https://yadm.io/docs/install)

```sh
# 1) install yadm as script (if necessary)
mkdir -p ~/code/bin 
curl -fLo ~/code/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod 700 ~/code/bin/yadm

# 2) install optional tools
#    (not necessary, but easier if done before bootstrap)

# 3)
~/code/bin/yadm clone --bootstrap https://github.com/idcrane/dotfiles

# 4)
zinit self-update   # in a new shell if using zsh
```

### Post-Bootstrap Tasks

- `ssh-keygen-25519` to create ssh keys (`id_ed25519` and `id_ed25519_git`)
- Install Miniconda (try `install-miniconda`)

## Dependencies

- [git](guides/git.md) (>= 2.0)
- yadm

### Optional Tools (easiest if installed before yadm bootstrap)

- [fzf](guides/fzf.md)
- [keychain](guides/keychain.md) (linux only)
- [neovim](guides/neovim.md)
- tmux (version >= 2.1)
- zsh

## Custom Configurations

Shell customizations can be added to `~/.dotenv_local`, `~/.dotshell_local`

Git customizations can be added  `~/.config/git/user`

## Directory Layouts

```sh
~/code
├── bin              # added to PATH
├── dotlib           # resources from dotfile repo
├── managed          # location for files managed elsewhere (ie PyCharm deploy)
├── repos            # location for repos (repos without remote at this level)
│   └── _github      # subdirectories by remote server
└── scratch          # work without a repo
```

## Thanks to these developers

[arcticicestudio](https://github.com/arcticicestudio) for the Nord color scheme (MIT License)
