#!/bin/bash

gcc -w client.c -lm -o client
gcc -w server.c -lm -o server

echo -e "10³\t\t10⁴\t\t10⁵\t\t10⁶"
for i in {1..100}; do
for exp in 3 4 5 6; do
    size=$((10**exp))
    # echo "Buffer size $size bytes"
    
    ./server 4001 $size &
    SERVER_PID=$!
    # echo $SERVER_PID
    sleep 1
    ./client localhost 4001 $size
    #kill -9 $SERVER_PID
    sleep 1
done
echo ""
done