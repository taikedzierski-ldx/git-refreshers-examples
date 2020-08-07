# Uh oh.

`branchtool.sh` doesn't always run properly. Somebody somewhere went and developed without testing.

Use `git bisect` to find out when it happened. You should mark the commit when "Hello world" was created as "good" and mark the newest commit as "bad".

See `git bisect --help` for more information (it will open in your web browser)
