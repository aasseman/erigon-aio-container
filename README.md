# Erigon AIO container

## Background

The `Dockerfile` builds on top of the official
[thorax/erigon](https://hub.docker.com/r/thorax/erigon) docker image by running both
`erigon` and `rpcdaemon` in the same container using
[`supervisord`](https://github.com/Supervisor/supervisor).

The default `supervisord.conf` contains a standard configuration that will set-up
`erigon` and `rpcdaemon` with some safe standard, and connect them together using
shared memory *and* RPC as recommended by Erigon's docs when using "local-mode".

You can supply your own `supervisord.conf` without rebuilding the container by mounting
it to `/etc/supervisord.conf`.

## How to build

```sh
docker build -t erigon-aio:version .
```

## How to run

The container's entrypoint is `supervisord`, so no need to give arguments. For example:
```sh
docker run \
    -v /path/to/erigon/data:/root/.local/share/erigon \
    -p 30303:30303/tcp \
    -p 30303:30303/udp \
    -p 30304:30304/tcp \
    -p 30304:30304/udp \
    -p 6060:6060/tcp \
    -p 8545:8545/tcp \
    erigon-aio
```
