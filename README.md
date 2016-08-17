# OSX config files

My custom config dir from my standard macOS setup.  If I had more time and/or was smarter, this would be better.

### Setting up

```
mkdir -p ~/.config
pushd ~/.config
git clone git@github.com:DanielBaird/danielbaird-osx.git
~/.config/danielbaird-osx/setup/setup.sh
popd
```

The setup script symlinks the `bin\bash-profile.sh` file into place as your `~/.bash_profile`.

### What do I get

| run | which does... |
|-----|---------------|
| `bash-color-vars.sh` | defines `echo`-able variables for bash colours |
| `show-bash-color-vars.sh` | quick reference to the colour vars defined in `bash-color-vars.sh`|
| `cd..`      | does a `cd ..` (up one dir) |
| `ll`        | does a `ls -halPF` (detailed ls) |
| `openports` | does a `lsof -i | grep LISTEN` (showing open ports) |
| `clean-ds`  | does a `find` on `.DS_Store` files and deletes them |
