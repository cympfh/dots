git-config-user() {
    git config --local user.name "$1"
    git config --local user.email "$2"
}

git-config-cympfh() {
    git-config-user cympfh cympfh@gmail.com
}

git-config-khattori() {
  git-config-user khattori kazuhiro_hattori@dwango.co.jp
}
