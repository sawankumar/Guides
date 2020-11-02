@ECHO off
title Gclone: Rclone Mod
 
@ECHO off
    (echo [GC]) > rclone.conf
    (echo type = drive) >> rclone.conf
	(echo scope = drive) >> rclone.conf
	(echo service_account_file = accounts/1.json) >> rclone.conf
	(echo service_account_file_path = accounts/) >> rclone.conf	
echo.
color 0b
echo Hey Sexy! Wanna clone some TBs?
ECHO ----------------------------------------------------------------------------------------------------------------------
echo off
ECHO 1) COPY
ECHO 2) MOVE
ECHO 3) SIZE
ECHO 4) DEDUPE
ECHO 5) REMOVE EMPTY FOLDERS
ECHO 6) EMPTY TRASH
ECHO.
SET /P option="Choose your Mode: "
if %option% == 1 (goto copy)
if %option% == 2 (goto move)
if %option% == 3 (goto size)
if %option% == 4 (goto dedp)
if %option% == 5 (goto rmdi)
if %option% == 6 (goto empt)

echo.

:copy
ECHO.
SET /P src="[Enter Source Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P dst="[Enter Destination Folder ID] "
gclone copy GC:{%src%} GC:{%dst%} --transfers 50 -vvP --stats-one-line --stats=15s --ignore-existing --drive-server-side-across-configs --drive-chunk-size 128M --drive-acknowledge-abuse --drive-keep-revision-forever
ECHO.
PAUSE
EXIT

:move
ECHO.
SET /P src="[Enter Source Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
SET /P dst="[Enter Destination Folder ID] "
gclone move GC:{%src%} GC:{%dst%} --transfers 50 -vP --stats-one-line --stats=15s --ignore-existing --drive-server-side-across-configs --drive-chunk-size 128M --drive-acknowledge-abuse --drive-keep-revision-forever
ECHO.
PAUSE
EXIT

:size
ECHO.
SET /P src="[Enter Folder ID] "
gclone size GC:{%src%} 
ECHO.
PAUSE
EXIT

:dedp
ECHO.
set /p choice=Do you want to do dry run? (y,n)
if /I %choice%==y goto drd
if /I %choice%==n goto nodrd
ECHO.
PAUSE
EXIT

:rmdi
ECHO.
set /p choice=Do you want to do dry run? (y,n)
if /I %choice%==y goto drr
if /I %choice%==n goto nodrr
ECHO.
PAUSE
EXIT

:drr
SET /P src="[Enter Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
gclone rmdirs GC:{%src%} -vP --stats-one-line --stats=15s --dry-run
ECHO ----------------------------------------------------------------------------------------------------------------------
echo off
ECHO 1) COPY
ECHO 2) MOVE
ECHO 3) SIZE
ECHO 4) DEDUPE
ECHO 5) REMOVE EMPTY FOLDERS
ECHO 6) EMPTY TRASH
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto copy)
if %option% == 2 (goto move)
if %option% == 3 (goto size)
if %option% == 4 (goto dedp)
if %option% == 5 (goto rmdi)
if %option% == 6 (goto empt)
ECHO.
PAUSE
EXIT

:nodrr
SET /P src="[Enter Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
set /p choice=Do you want to permanently delete empty folders? (y,n)
if /I %choice%==y gclone rmdirs GC:{%src%} -vP --stats-one-line --stats=15s --drive-use-trash=false --verbose=2 --fast-list
if /I %choice%==n gclone rmdirs GC:{%src%} -vP --stats-one-line --stats=15s 
ECHO.
PAUSE
EXIT	

:drd
SET /P src="[Enter Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
gclone dedupe --dedupe-mode newest GC:{%src%} -vP --stats-one-line --stats=15s --dry-run
ECHO ----------------------------------------------------------------------------------------------------------------------
echo off
ECHO 1) COPY
ECHO 2) MOVE
ECHO 3) SIZE
ECHO 4) DEDUPE
ECHO 5) REMOVE EMPTY FOLDERS
ECHO 6) EMPTY TRASH
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto copy)
if %option% == 2 (goto move)
if %option% == 3 (goto size)
if %option% == 4 (goto dedp)
if %option% == 5 (goto rmdi)
if %option% == 6 (goto empt)
ECHO.
PAUSE
EXIT

:nodrd
SET /P src="[Enter Folder ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
set /p choice=Do you want to permanently delete the duplicates? (y,n)
if /I %choice%==y gclone dedupe --dedupe-mode largest GC:{%src%} -vP --stats-one-line --stats=15s --drive-use-trash=false --verbose=2 --fast-list
if /I %choice%==n gclone dedupe --dedupe-mode largest GC:{%src%} -vP --stats-one-line --stats=15s 
ECHO.
PAUSE
EXIT

:empt
ECHO.
SET /P src="[Enter TeamDrive ID] "
ECHO ----------------------------------------------------------------------------------------------------------------------
set /p choice=Do you want to do dry run? (y,n)
if /I %choice%==y gclone delete GC:{%src%} --drive-trashed-only --drive-use-trash=false --verbose=2 --fast-list --dry-run
echo off
ECHO 1) COPY
ECHO 2) MOVE
ECHO 3) SIZE
ECHO 4) DEDUPE
ECHO 5) REMOVE EMPTY FOLDERS
ECHO 6) EMPTY TRASH
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto copy)
if %option% == 2 (goto move)
if %option% == 3 (goto size)
if %option% == 4 (goto dedp)
if %option% == 5 (goto rmdi)
if %option% == 6 (goto empt)
if /I %choice%==n gclone delete GC:{%src%} --drive-trashed-only --drive-use-trash=false --verbose=2 --fast-list
ECHO.
PAUSE
EXIT




	