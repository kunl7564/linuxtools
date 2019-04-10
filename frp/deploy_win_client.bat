set root=%~dp0
echo %root%
cd /d %~dp0
:install service
%root%\nssm.exe install tpson_client %root%\tpson_client.exe -c %root%\tpson_win_client.ini
:start service
%root%\nssm.exe restart tpson_client
pause