#! bash

## I am a hello world script
##
## What did you expect?
##
## OK. Try using --dump

checkhelp() {
    if [[ "$*" =~ --help ]]; then
        grep -E '^##' "$0"
        exit
    fi
}

dump() {
    if [[ "$*" =~ --dump ]]; then
        cat "$0"
        exit
    fi
}

main() {
    checkhelp "$@"
    dump "$@"

    echo "Hello world"
}

main "$@"
