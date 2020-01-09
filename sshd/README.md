# sshd

An empty Debian container that runs SSHD.

## Cool Files Inside the Container

| ---------- | - |
| `/init`    | The default `CMD` for the container.  Runs `/init.rc` in the background (if the file exists).  Runs `sshd` in the foreground. |
| `/init.rc` | Optional file that is executed in the background.  Expose this via a volume mount to customize the container on startup. |