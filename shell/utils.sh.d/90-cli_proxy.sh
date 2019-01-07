

function cli_proxy() {
	case $1 in
		on )
			export http_proxy=http://127.0.0.1:8123
			export https_proxy=https://127.0.0.1:8123
			;;

		off )
			unset http_proxy
			unset https_proxy
			;;

		* )
			echo
			echo "$0 <on|off>"
			echo
			;;
	esac
}
