# Run Braiins-os on Mac via Docker

download [BOS+ Toolbox (With SSH Unlocker)](https://braiins.com/os/plus/download)
save `bos-toolbox` package to this repo's `./utils` folder


1. Setup Mac to run Linux GUI apps via Docker

[Run Linux GUI Apps on macOS using Docker](https://www.youtube.com/watch?v=cNDR6Z24KLM)

- install [xquartz](https://www.xquartz.org/)
- open mac terminal & run cmd to get machine's ip address

```bash
ifconfig en0
```
- look for `inet 192.168.68.108`, machines ip in this example is `192.168.68.108`

- launch xquartz
- open preferences > security, check box 'allow connections from network clients'

- run cmd in xquartz terminal (replace `<MACHINE_IP>` with ip obtained earlier)

```bash
xhost <MACHINE_IP>
```

- start docker desktop
- build this docker image

```bash
docker build . -t ubuntu-bt
```

- start bos-toolbox

```bash
docker run -it -e DISPLAY=<MACHINE_IP>:0 --rm --name ubuntu-bt ubuntu-bt

docker run -it -e DISPLAY=192.168.68.108:0 --rm --name ubuntu-bt ubuntu-bt

docker run -it -e DISPLAY=192.168.68.108:0 -v /etc/ssl/certs:/etc/ssl/certs --rm --name ubuntu-bt ubuntu-bt
```
