# sum integers from a file or stdin, one integer per line:
printf '1\n2\n3\n' | awk '{ sum += $1} END {print sum}'

# Sets field separator to comma and for each line prints second field
awk 'BEGIN { FS = "," } ; { print $2 }'

# print all lines with 'gold' in it
awk '/gold/' 1.txt


# print number of fields
awk '{print NF}'

# print excel parse txt into markdown link
awk 'BEGIN { FS = "\t" } ; { print "+ [`",$1,"`](",$2,")" }' ppurl.txt

# find line repeat >3
awk '{c[$0]++} END {for (i in c) {if (c[i] > 3) {print i}}}' <file-name>
