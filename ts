# Prepending a timestamp to each line of output from a command

# install ts command
sudo apt-get install moreutils

# usage
command | ts '[%Y-%m-%d %H:%M:%S]'
