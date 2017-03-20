

# OSX config files

My custom config dir from my standard macOS setup.  If [I had more
 time](http://quoteinvestigator.com/2012/04/28/shorter-letter/) this would be better.


### Setting up

When you run the `git` command below, you'll be prompted to install Xcode Command 
Line Tools, which you should agree to (don't get "full" Xcode unless you want it).
If that doesn't work for some reason &mdash; e.g. if you're at JCU and their update
server doesn't have it &mdash; then go to https://developer.apple.com/download/more/, 
find the lastest version of Command Line Tools, and download and install it.

```
mkdir -p ~/.config
pushd ~/.config
git clone https://github.com/DanielBaird/danielbaird-osx.git
~/.config/danielbaird-osx/setup/setup.sh
popd
```

The setup script symlinks these files into place:

| file                    | symlinked to...
|-------------------------|-----------------
| `bin\bash-profile.sh`   | `~/.bash_profile`
| `ssh\config`            | `~/.ssh/config`
| `config-dir\*`          | `~/.config/*`


### What do I get


##### Command line aliases and scripts

| run | which does... |
|-----|---------------|
| `bash-color-vars.sh`      | defines `echo`-able variables for bash colours
| `show-bash-color-vars.sh` | quick reference to the colour vars defined in `bash-color-vars.sh`
| `remove-bom.sh`           | removes the Byte Order Mark from a file, if it has one
| `cd..`      | does a `cd ..` (up one dir)
| `ll`        | does a `ls -halPF` (detailed ls)
| `cdf`       | `cd`s to the dir showing in the front-most Finder window
| `openports` | does a `lsof -i | grep LISTEN` (showing open ports)
| `clean-ds`  | does a `find` on `.DS_Store` files in current dir and below, and deletes them
| `grepr`     | does a `grep -r` (recursive grep)
| `` |



##### Command line programs

| tool    | which does... |
|---------|---------------|
| `git`   | version control
| xcode command line tools | compilers and whatnot
| `brew`  | package management http://brew.sh
| `gron`  | greps JSON https://github.com/tomnomnom/gron
| `entr`  | run stuff when the file system changes https://http://entrproject.org/
| `wget`  | fetches web pages, like `curl` but I prefer this
| `htop`  | live monitoring of processes, like `top` but shows CPU cores
| `watch` | repeatedly do something, show the result
| `graphviz` (`dot` etc) | graph-drawing tool http://www.graphviz.org/
| `direnv` | per-directory env management https://direnv.net/
| `` |



##### GUI applications

| app           | which does... |
|---------------|---------------|
| Dropbox       | remote file syncing
| Google Drive  | remote file syncing
| Sublime Text  | text editor
| Keeping You Awake | prevents Mac from sleeping 
| Itsycal       | I used it to replace the clock in the menu bar
| Spotify       | Streaming music
| VLC           | Video playback
| Slack         |  Chat rooms for work
| Skype         | Video conferencing
| Spectacle     | Key-based window layout (since Window Tidy went commercial)
| Firefox       | Web browser
| Google Chrome | Web browser
|  |

