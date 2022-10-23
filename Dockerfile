FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3

# resolve missing package error
RUN apt-get install -y libxcb-util1

# resolve missing machine-uuid error
RUN apt-get install -y dbus-tests

# resolve GUI rendering issue
RUN apt-get install -y libgdk-pixbuf2.0-dev

# resolve SSL Certificate error during braiins os installation
RUN apt-get install -y --reinstall ca-certificates

WORKDIR '/'
COPY utils ./utils

RUN chmod u+x ./utils/bos-toolbox

CMD ["./utils/bos-toolbox"]
# cd utils && ./bos-toolbox install -p 13209 --open-source listOfMiners.csv