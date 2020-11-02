<h1 align="center">🔥 Gclone on Android</h1> 

<hr>

> ## Gclone guide for android.

## Installation :-

- Install Termux.
- Go to `Settings-Apps-Termux` Give Storage Permissions.
- Create service accounts.
- Run the code in Termux.
```
pkg install python && pkg install wget && wget https://raw.githubusercontent.com/sawankumar/Content-Delivery-Network/master/gclone && mv gclone /data/data/com.termux/files/usr/bin/ && chmod 777 /data/data/com.termux/files/usr/bin/gclone && echo gclone version
```
OR
```
apt update && apt install golang git && export GOPATH=`pwd`/go && mkdir go && git clone https://github.com/sawankumar/Gclone.git && cd gclone && go build && mv gclone /data/data/com.termux/files/usr/bin/ && pkg install python && cd /sdcard/gclone && gclone version
```
Then
```
mkdir /sdcard/Gclone/ && cd Gclone && wget https://raw.githubusercontent.com/sawankumar/Guides/master/Gclone%20Guide%20for%20Android/gc.py
```
- Create an accounts folder inside Gclone folder and add all SAs.
- Open accounts folder and select any one json File and rename it as 1.json.

## Running Gclone :-
 - Open Termux and Run this codes
```
cd /sdcard/Gclone
```
```
python gc.py
```
- After this Just Follow what is on the screen.