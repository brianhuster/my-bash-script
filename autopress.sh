# autopress.sh - A script to automatically press a key (`Alt`) on keyboard to keep screen on

keypress(){
    xdotool key Alt
}
while true; do
    keypress
    sleep 10
done
