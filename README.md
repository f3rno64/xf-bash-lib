# A personal utility library for my [**`bashrc`**][bashrc-url]

> xf-bash-lib

This library contains aliases and helpful short functions which serve as
shorter versions of commands I find myself using often. It is highly
opinionated and isn't expected to be useful for anyone other than myself.i

Besides the aliases and command shortcuts, it also automatically sources
several utilities I use, such as [**`nvm`**][nvm-url] and [**`rvm`**][rvm-url].

## Usage

After cloning the repo, init and update submodules. To use this library in your
**`.bashrc`**, source it with `source xf_bash_lib.sh`.

## Environments

Various commands operate differently depending on the environment; for example,
the package management commands (**`pkgi`**, **`pkgu`**, etc) use **`apt`** on
Debian-like systems and **`dnf`** on Fedora. The following environments are
supported:

- Linux
- MacOS
- Termux (Android)

### Automatically Sourced Utilities

The following utilities are automatically setup (added to **`$PATH`**, init
files sourced, etc):

- [**`nvm`**][nvm-url] -- node version manager
- [**`rvm`**][rvm-url] -- ruby version manager

### Aliases

The full list of aliases has evolved over time based on my own personal usage
patterns. By now, most are in my muscle memory. Besides shortening often-typed
commands, some aliases map to better versions of common utilities.

#### General Aliases

- **less** -- aliased to [**`moar`**][moar-url] if it is available.
- **cat** -- aliased to [**`bat`**][bat-url] if it is available.
- **nv** -- `nvim`

#### **git** Aliases

- **gb** -- `git branch`
- **gbd** -- `git branch -D`
- **gt** -- `git tag`
- **gtd** -- `git tag -D`
- **gcam** -- `git commit -am`
- **gcm** -- `git commit -m`
- **gl** -- `git log --graph ...` (includes a long custom format string)
- **ga** -- `git add -p`
- **gd** -- `git diff`
- **gs** -- `git status`
- **gfoa** -- `git fetch --all --tags`
- **gst** -- `git stash`
- **gstd** -- `git stash drop`
- **grsoft** -- `git reset --soft HEAD^`
- **grhard** -- `git reset --hard HEAD^`
- **gpl** -- `git pull origin $(git branch --show-current)`

#### **ls** Aliases

If available, **`ls`** is mapped to [**`lsd`**][lsd-url].

- **ls** -- `ls $LS_CMD_ARGS_STR`
- **ll** -- `ls -al`
- **lt** -- `ls -alt`
- **lh** -- `ls -alt .*`

#### **npm** Aliases

- **n** -- `npm`
- **ns** -- `npm run start`
- **nt** -- `npm run test`
- **ntc** -- `npm run test:coverage`
- **nl** -- `npm run lint`
- **nb** -- `npm run build`
- **nu** -- `npm run update-version`
- **no** -- `npm run outdated`
- **ni** -- `npm run init`
- **nd** -- `npm run docs`

#### [**`pnpm`**][pnpm-url] Aliases

- **pn** -- `pnpm`
- **pns** -- `pnpm start`
- **pnt** -- `pnpm test`
- **pntc** -- `pnpm test:coverage`
- **pnts** -- `pnpm test:snapshots`
- **pnf** -- `pnpm format:check`
- **pnff** -- `pnpm format`
- **pnl** -- `pnpm lint`
- **pnlf** -- `pnpm lint fix`
- **pnb** -- `pnpm build`
- **pnd** -- `pnpm dev`

#### [**`yarn`**][yarn-url] Aliases

- **y** -- `yarn`
- **ys** -- `yarn start`
- **yt** -- `yarn test`
- **ytc** -- `yarn test:coverage`
- **yl** -- `yarn lint`
- **yb** -- `yarn build`
- **yu** -- `yarn update-version`
- **yo** -- `yarn outdated`
- **yi** -- `yarn init`
- **ypl** -- `yarn plugin list`

### General Commands

- **x** -- `exit`
- **c** -- `clear`
- **fzf-cd** -- runs [**`fzf`**][fzf-url] and changes to the directory of the
    selected file.

#### **git** Commands

- **gpo** -- pulls the current branch from **origin**
- **gmpr \<gh-pr-id\> \<branch\>** -- checks out a PR and merges it into the
    specified branch.
- **gnew \<name\> \<origin-user\> \<origin-host-name\>** -- runs
    **git init .**, adds an origin using the provided arguments
    (**origin-user** defaults to the current username, and **origin-host-name**
    defaults **github.com**), and generates a default **.gitignore** file in
    the root repo directory.
- **goradd \<remote-name\> \<url\>** -- adds a new remote.
- **grsoft \<length\>** -- `git reset --soft HEAD^<length>`
- **gco \<branch\>** -- checks out the specified branch
- **gcob \<branch\>** -- like **gco**, but creates the branch if it does not
    exist.
- **gc \<github-user\>/\<repo-name\>** -- clones the specified **GitHub**
    repository into *`~/.src/github/<github-user>/<repo-name>` and changes
    to the created directory.
- **gf \<local-branch\> \<remote-branch\> \<origin\>** runs **git fetch** with
    the provided information, defaulting to the current branch and **origin**
    (i.e. **gf test-branch** results in **git fetch origin
    test-branch:test-branch**)
- **gpf \<branch\>** -- force pushes *\<branch\>* to **origin**; defaults to
    the current branch.
- **gu \<branch\>** -- pulls *\<branch\>* from **origin**; defaults to the
    current branch.

#### [**`yarn`**][yarn-url] Commands

- **ypi \<plugin\>** -- `yarn plugin import \<plugin\>`
- **ya \<...packages\>** -- runs **yarn add** with all specified packages
- **yad \<...packages\>** -- runs **yarn add -D** with all specified packages
- **ycl** -- `yarn config list -v --why`

#### Build Commands

- **conf** -- `bash -c './configure'`
- **mk** -- runs **conf** and `make -jC` where **C** is the number of CPU cores
    on the machine.
- **mki** -- `sudo make install`
- **cargomk** -- `cargo build --release`
- **cargoin** -- `cargo install --path .`

#### Package Commands

The following commands use the system package manager. **dnf**, **pacman**,
**apt**, **brew**, and termux **pkg** are all supported.

- **pkgi \<name\>** -- installs a package by name
- **pkgs \<name\>** -- searches for a package by name
- **pkgu \<name\>** -- updates a package by name
- **pkgd \<name\>** -- uninstalls a package by name

#### [**`pnpm`**][pnpm-url] Commands

- **pna \<...packages\>** -- runs **pnpm add** with all specified packages
- **pnad \<...packages\>** -- runs **pnpm add -D** with all specified packages

#### System Commands

- **shutdn** -- `shutdown -h -P now`
- **kk \<process-name\>** -- uses **killall** to kill a process by name with
    signal **9**.
- **mnt \<dev-name\>** -- mounts **/dev/\<dev-name\>** at **/mnt**
- **umnt** -- unmounts **/mnt**

#### SystemCTL Commands

- **sysup \<service\>** -- starts a service by name
- **sysdn \<service\>** -- stops a service by name
- **sysre \<service\>** -- restarts a service by name
- **sysst \<service\>** -- displays the status of a service by name
- **syson \<service\>** -- enables a service by name
- **sysoff \<service\>** -- disables a service by name

#### tmux Commands

- **tmn** -- starts a new tmux session named **T**
- **tma** -- attaches to the tmux session named **T** (created by **tmn**)

## Release History

See [**CHANGELOG.md**](/CHANGELOG.md) for more information.

## License

Distributed under the **MIT** license. See [**LICENSE.md**](/LICENSE.md) for
more information.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[bashrc-url]: https://github.com/f3rno64/dotfiles/blob/master/bashrc
[nvm-url]: https://github.com/nvm-sh/nvm
[rvm-url]: https://github.com/rvm/rvm
[bat-url]: https://github.com/sharkdp/bat
[moar-url]: https://github.com/walles/moar
[lsd-url]: https://github.com/lsd-rs/lsd
[pnpm-url]: https://github.com/pnpm/pnpm
[yarn-url]: https://github.com/yarnpkg/yarn
[fzf-url]: https://github.com/junegunn/fzf
