@echo off
setlocal
set /A "timeout=%1"
ping 127.0.0.1 -n %timeout% > nul
endlocal