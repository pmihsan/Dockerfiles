FROM ubuntu:latest

# Basic Packages
RUN apt update && apt install -y pcmanfm featherpad xterm

# Display ENV variable
ENV DISPLAY=host.docker.internal:0.0

# Start file manager
CMD pcmanfm
