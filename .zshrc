# ---------------------------- #
# --- GENERAL ZSH SETTINGS --- #
# ---------------------------- #

  ZSH=$HOME/.zsh          # Path to zsh_cfg.sh
  ZSH_THEME="hGen"        # chosen theme

  source $ZSH/zsh_cfg.sh  # laod zsh config file

  # path settings
  export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/usr/texbin:/usr/local/Cellar:

  # default editor
  export EDITOR=vim

# ---------------------- #
# --- LESS HIGHLIGHT --- #
# ---------------------- #
  LESSPIPE=`which src-hilite-lesspipe.sh`
  export LESSOPEN="| ${LESSPIPE} %s"
  export LESS='-R'

# --------------------- #
# --- PLUGIN LOADER --- #
# --------------------- #

  # found in ~/.zsh/plugins/
  plugins=(battery)

# ---------------------- #
# --- ALIAS SETTINGS --- #
# ---------------------- #

  # located here: ~/.zsh/lib/aliases.zsh

# -------------------------- #
# --- OH-MY-ZSH SETTINGS --- #
# -------------------------- #

# Set to this to use case-sensitive completion
  CASE_SENSITIVE="true"
# red dots while waiting for completion
  COMPLETION_WAITING_DOTS="true"
# disable bi-weekly auto-update checks
    # DISABLE_AUTO_UPDATE="true"
# change how many often would you like to wait before auto-updates occur? (in days)
    # export UPDATE_ZSH_DAYS=13
# disable autosetting terminal title.
   #  DISABLE_AUTO_TITLE="true"

