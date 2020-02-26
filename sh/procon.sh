catcoder() {
  case "$1" in
    install | update )
      cargo install --git https://github.com/tanakh/cargo-atcoder.git
      ;;
    * )
      cargo atcoder $@
      ;;
  esac
}
