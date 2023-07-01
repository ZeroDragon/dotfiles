# Run a command and count how many times the word "res:" appears in the output
count=$(displayplacer list | tail -n 1 | grep -o 'res:' | wc -l)

# Extract the integer value from the count
count=${count//[[:blank:]]/}
count=$((count))

if [ "$count" -eq 1 ]; then
  displayplacer "id:603D43FB-A569-1DF7-0857-D6964E3302DB res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0" "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1440x900 hz:60 color_depth:8 scaling:on origin:(-1440,477) degree:0"
else
  displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230+603D43FB-A569-1DF7-0857-D6964E3302DB res:1440x900 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0"
fi
