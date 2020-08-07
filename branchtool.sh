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

show_branches() {
    (git branch -r --no-color; git branch --no-color)|sed -r 's/^[ *]*//'
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
            echo "Remote branches"
            show_branches | grep '/'

            echo "Local branches"
            show_branches | grep -v '/'
        count)
            local lines
            lines="$(git log --oneline | wc -l)"

            echo "This branch has $lines commits."
            ;;
    esac
}

main "$@"
