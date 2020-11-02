<h1 align="center">🔥 AutoRclone on Android</h1> 

<hr>

> ## Autorclone guide for android

## Installation :-

- Install Termux.
- Go to `Settings-Apps-Termux` Give Storage Permissions.
- Run the code in Termux.
```
pkg install python && pkg install rclone && pkg install openssl
```
- Then download [AutoRclone Repository](https://github.com/xyou365/AutoRclone/archive/master.zip).
- Extract it.
- Open browser and go [Here](https://developers.google.com/drive/api/v3/quickstart/python).
- Remember which email you are using for this step..its important.
- Enable Drive API - Choose Desktop.
- Download the credentials.json & Move it to Autorclone Folder.
- Then Run these codes in Termux :-
```
cd /sdcard/Autorclone && pip install -r requirements.txt
```
```
python gen_sa_accounts.py --quick-setup 1 --new-only
```
- After it is finished, there will be many .json files in one folder named accounts. 1 here signifies number of project that has to be created. 1 project can create 100 Service accounts (i.e. to copy 75TB a day).
- After that copy paste this code in termux :-
```
cd /sdcard/Autorclone/accounts/ && grep -oPh '"client_email": "\K[^"]+' *.json > emails.txt
```
- Go to accounts Folder in Autorclone Folder. 
- You will see emails.txt , Open it-You will see 100 emails.
- Add these emails in a google group.
- Add the group address  `name@googlegroups.com` to your source Team Drive (as viewer at least) and destination Team Drive (as contributor at least).
- Run this in Termux to copy from one path to another :-
```
python3 rclone_sa_magic.py -s SourceID -d DestinationID -dp DestinationPathName -b 1 -e 600
```
- For meaning of above flags, please run `python3 rclone_sa_magic.py -h`.
- Add `--disable_list_r` if rclone [cannot read all contents of public shared folder](https://forum.rclone.org/t/rclone-cannot-see-all-files-folder-in-public-shared-folder/12351).


