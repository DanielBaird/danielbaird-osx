

# OSX config files

My custom config dir from my standard macOS setup.  If [I had more
 time](http://quoteinvestigator.com/2012/04/28/shorter-letter/) this would be better.


### Setting up

When you run the `git` command below, you'll be prompted to install Xcode Command 
Line Tools, which you should agree to (don't get "full" Xcode unless you want it).
If that doesn't work for some reason &emdash; e.g. if you're at JCU and their update
server doesn't have it &emdash; then go to https://developer.apple.com/download/more/, 
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

| run | which does... |
|-----|---------------|
| `bash-color-vars.sh` | defines `echo`-able variables for bash colours
| `show-bash-color-vars.sh` | quick reference to the colour vars defined in `bash-color-vars.sh`
| `cd..`      | does a `cd ..` (up one dir)
| `ll`        | does a `ls -halPF` (detailed ls)
| `cdf`       | `cd`s to the dir showing in the front-most Finder window
| `openports` | does a `lsof -i | grep LISTEN` (showing open ports)
| `clean-ds`  | does a `find` on `.DS_Store` files in current dir and below, and deletes them
| `gron`      | greps JSON (see https://github.com/tomnomnom/gron for more)
| `grepr`     | does a `grep -r` (recursive grep)
