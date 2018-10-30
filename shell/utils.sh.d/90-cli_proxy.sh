

function cli_proxy() {
	case $1 in
		on )
			export http_proxy=http://127.0.0.1:8123
			;;

		off )
			unset http_proxy
			;;

		* )
			echo
			echo "$0 <on|off>"
			echo
			;;
	esac
}