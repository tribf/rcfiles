
bindkey '\e[1;3D' backward-word       	# ALT + left
bindkey '\e[1;3C' forward-word        	# ALT + right

bindkey -s '\eo'   'cd ..\n'    		# alt + o
bindkey -s '\e;'   'ls -l\n'    		# alt + ;

bindkey "^[0H" beginning-of-line
bindkey "^[OF" end-of-line
bindkey -s "\e[15~" "z -l | tail\n"