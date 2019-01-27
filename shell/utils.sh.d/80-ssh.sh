

function ssh-keygen-md5() {
	if [[ -s $1 ]]; then
		ssh-keygen -E md5 -lf $1
	fi
}

function ssh-keygen-sha1() {
	if [[ -s $1 ]]; then
		ssh-keygen -E sha1 -lf $1
	fi
}
