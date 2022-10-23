# Braiins OS bos-toolbox on Mac (intel chip)

While attemting to install Braiins OS on an Antminer s9, I was unable to run the bos-toolbox on my mac &  did not find any solutions online.

Error code recieved:

```bash
exec format error: ./bos-toolbox
```

Heres how I was able to:
- Run the bos-toolbox in a linux container
- Unlock Antminer S9 SSH & install Braiins OS on miner.

1. Clone this repo.

2. Follow the [Braiins OS docs](https://braiins.com/os/plus), download `bos-toolbox`, save it in the repo's `utils` folder.

3. Follow this guide to [Run Linux GUI apps on Mac](https://www.youtube.com/watch?v=cNDR6Z24KLM) 

    - Install [XQuartz](https://www.xquartz.org/)
    - Run cmd in MAC terminal to get your local machine's ip address
        ```bash
        ifconfig en0
        ```
        - Look for `inet xxx.xxx.xxx.xxx`, copy ip address -> `xxx.xxx.xxx.xxx`

    - Launch XQuartz
        - Open Preferences > security > check box to 'Allow connections from network clients'
        - Run cmd in XQUARTZ terminal (replace `<MACHINE_IP>` with ip obtained earlier)

            ```bash
            xhost <MACHINE_IP>
            ```

- Download, install, & start [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)
- Open a terminal in this repo's root directory
- Build an image from repo's Dockerfile

    ```bash
    docker build . -t ubuntu-bt
    ```

- Run container from image (will lauch the `bos-toolbox` GUI)

    ```bash
    docker run -it -e DISPLAY=<MACHINE_IP>:0 --rm --name ubuntu-bt ubuntu-bt
    ```

Cheers!