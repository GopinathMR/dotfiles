Installation steps

* Install ITerm2
* Install brew
* Execute below script in zsh shell

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/GopinathMR/dotfiles/HEAD/setup.sh)"

```

To reset to default, run the script in the repository.

**WARN: Please read the script before running it**

```
./reset.sh
```


### AI Coding setup

This repo contains config files to use Claude code. Follow below steps to setup

* Run the command `./setup_vibe.sh`
* Copy `./claude/example.settings.local.json` to `~/.config/claude/settings.local.json` and update API keys
* Open claude CLI and run below commands in Claude REPL


```
/plugin install gopi-must-haves@gopi-code-workflows 
```
