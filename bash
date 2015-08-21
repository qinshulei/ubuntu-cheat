# To implement a for loop:
for file in *; do
    echo $file found;
done

# while loop
while [ expression ]; do
    commands
done

# if statement
if [expr]; then
    commands
elif
    commands
else
    command
fi

# To implement a case command:
case "$1"
in
    0) echo "zero found";;
    1) echo "one found";;
    2) echo "two found";;
    3*) echo "something beginning with 3 found";;
esac

# functions
fname(){
    commands
}

# Turn on/off debugging:
set -x
set +x


# Turn on/off fail exit:
set -e
set +e

# Turn on/off pip fail:
set -o pipefail
set +o pipefail

# How all bash scripts should start (sharp-bang)
#!/bin/bash

# <<< redirect words to stdin:
less <<< "foo bar"

# ctrl-x ctrl-e opens editor to work on long complex command

# split with space
IFS="  "
for LINE in `cat /etc/passwd`
do
        echo $LINE
done

# read line
while read LINE
do
        echo $LINE
done < /etc/passwd
