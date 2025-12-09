## fish  
  
Fish is a smart and user-friendly command line shell - optimized for performance.

## Performance Optimizations

This fish configuration benefits from the optimized profile and functions:

- **Fast startup** - Optimized profile sourcing
- **Smart caching** - Git operations cached per directory
- **POSIX compliant** profile scripts
- **Error handling** - Protected for reliability

### Key Features

✅ **Shared Optimizations**
- Uses optimized profile from misc
- Git repository detection cached
- Command-not-found with intelligent caching
- Protected against hanging operations

✅ **Fish-Specific**
- Fast abbreviations and completions
- Oh-My-Fish plugin support
- Interactive and user-friendly
- Syntax highlighting built-in

## Installation

### Automatic install/update

```shell
bash -c "$(curl -LSs https://github.com/dfmgr/fish/raw/main/install.sh)"
```

### Manual install
  
### Requirements

Debian based:

```shell
apt install fish
```  

Fedora Based:

```shell
yum install fish
```  

Arch Based:

```shell
pacman -S fish
```  

MacOS:  

```shell
brew install fish
```
  
```shell
mv -fv "$HOME/.config/fish" "$HOME/.config/fish.bak"
git clone https://github.com/dfmgr/fish "$HOME/.config/fish"
fish "$HOME"/.config/fish/omf-install --path=~/.local/share/fish/plugins/oh-my-fish --config=~/.config/fish/omf --noninteractive --yes
fish "$HOME"/.config/fish/plugins.fish
rm -Rf "$HOME"/.config/fish/omf-install
```

## Testing

All configurations validated for:
- Fast startup times
- Proper error handling
- Feature compatibility
- Interactive usability
  
<p align=center>
  <a href="https://wiki.archlinux.org/index.php/fish" target="_blank" rel="noopener noreferrer">fish wiki</a>  |  
  <a href="https://fishshell.com" target="_blank" rel="noopener noreferrer">fish site</a>
</p>  
