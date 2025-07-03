
# kills port
portkill() {
    if [ -z "$1" ]; then
        echo "Kills specified port"
        echo
        echo "Usage: portkill <port>"
        return 1
    fi
    lsof -t -i tcp:$1 | xargs kill
}

portpid() {
    if [ -z "$1" ]; then
        echo "Show the process PID for specified port"
        echo
        echo "Usage: portpid <port>"
        return 1
    fi
    lsof -t -i tcp:$1
}