#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function git_gitee() {
    gitee_url=$1
    github_url=$2
    repo=$(basename "$gitee_url" ".${gitee_url##*.}")

    git clone $gitee_url
    cd $repo
    git remote set-url origin $github_url
    git pull
    git remote add gitee $gitee_url
}
