@ECHO OFF
SET /P src="[Enter Path to source] "
SET /P dest="[Enter Path to destination] "
ECHO.
for /r "%src%" %%x in (*.mp3 *.flac *.wav *wma *.ogg *.aac) do move "%%x" "%dest%"
ECHO.
PAUSE