# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

local username=${(%):-%n}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${username}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${username}.zsh"
fi

# PATH
export PATH=$PATH:$HOME/bin:/usr/local/bin:/opt/nvim/bin:$HOME/go/bin/

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Case sensitive
# CASE_SENSITIVE="true"

# Hyphen insensitive
# HYPHEN_INSENSITIVE="true"

# Update frequency
# zstyle ':omz:update' frequency 13

# Disable magic functions
DISABLE_MAGIC_FUNCTIONS="true"

# Disable colors in ls
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Disable untracked files dirty
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins in $ZSH/plugins/
plugins=(sudo fzf)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/zsh-sudo/zsh-sudo.zsh

# Configuración del usuario

# Editor preferido para sesiones locales y remotas
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Para personalizar el prompt, ejecuta `p10k configure` o edita ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# configurar atajos de teclado
bindkey -e                                        # atajos de teclado estilo emacs
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;3C' forward-word                    # alt + ->
bindkey '^[[1;3D' backward-word                   # alt + <-
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end

# Enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# Manual aliases
alias ll='/usr/bin/lsd -lh --group-dirs=first'
alias la='/usr/bin/lsd -a --group-dirs=first'
alias l='/usr/bin/lsd --group-dirs=first'
alias lla='/usr/bin/lsd -lha --group-dirs=first'
alias ls='/usr/bin/lsd --group-dirs=first'

alias cat='/usr/bin/batcat'
alias catn='/usr/bin/cat'
alias catnp='/usr/bin/batcat --paging=never'

# Functions
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# Extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

# Settarget
function settarget(){
        if [ $# -eq 1 ]; then
        	echo $1 > ~/.config/polybar/shapes/scripts/target
        elif [ $# -gt 2 ]; then
        	echo "settarget [IP] [NAME] | settarget [IP]"
        else
        	echo $1 $2 > ~/.config/polybar/shapes/scripts/target
        fi
}

# Mejora de fzf
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (batcat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (batcat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

# rmk
function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

source ~/powerlevel10k/powerlevel10k.zsh-theme

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
