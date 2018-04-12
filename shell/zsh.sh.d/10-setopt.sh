setopt hist_ignore_space

setopt completealiases

# enable wilchard, like dpkg -l firefox*
setopt no_nomatch

### settings for approximate match
zstyle ':completion::approximate:' max-errors 1 numeric