#!/bin/bash

# Start the shellinabox service
service shellinabox restart

# Start the SSH server in the foreground
/usr/sbin/sshd -D
