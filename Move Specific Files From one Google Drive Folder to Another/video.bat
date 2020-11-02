@ECHO OFF
SET /P src="[Enter Path to source] "
SET /P dest="[Enter Path to destination] "
ECHO.
for /r "%src%" %%x in (*.mkv *.mp4 *.avi *.flv *.webm *.wmv *m4a *m4b *m4v) do move "%%x" "%dest%"
ECHO.
PAUSE