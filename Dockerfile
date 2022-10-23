FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y python3 \
      # resolve missing package error
      libxcb-util1 \
      # resolve missing machine-uuid error
      dbus-tests \
      # resolve GUI rendering issue
      libgdk-pixbuf2.0-dev \
      # resolve SSL Certificate error during braiins os installation
      --reinstall ca-certificates

WORKDIR '/'
# copy utils folder into image
COPY utils ./utils

# make bos-toolbox executable
RUN chmod u+x ./utils/bos-toolbox

# run bos-toolbox on container start
CMD ["./utils/bos-toolbox"]