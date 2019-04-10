set root=%~dp0
echo %root%
cd /d %~dp0
%root%\nssm.exe stop tpson_client
%root%\nssm.exe remove tpson_client confirm
pause