#! bash

## Branch tool
##
## branchtool.sh { log | graph | count }

checkhelp() {
    if [[ "$*" =~ --help ]]; then
        grep -E '^##' "$0"
        exit
    fi
}

main() {
    checkhelp "$@"

    local action
    action="$1"; shift
    case "$action" in
        log)
            git log --oneline
            ;;
        graph)
            git log --oneline --graph --decorate=short --all
            ;;
        all)
            git branch -vv
        count)
            local lines
            lines="$(git log --oneline | wc -l)"

            echo "This branch has $lines commits."
            ;;
    esac
}

main "$@"
