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


# get lines from log
function get_lines(){
    filename=$1
    start_line=$2
    end_line=$3
    awk -v start_line=$start_line -v end_line=$end_line 'NR>=start_line && NR<=end_line' $filename
}

# filter commit-msg summary
echo '[xxx][xxx][xxxx][jira_project-451]xxxxxx' | cut -d"["  --output-delimiter=" " -f 1- | cut -d"]"  --output-delimiter=" " -f 1- | tr " " "\n" | awk -F' ' '/jira_project_*/{print}'