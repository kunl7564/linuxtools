:set root=c:\tpsonproxy

set root=E:\Installers\frp\20190409\frp_0.25.3_windows_386
:install service
%root%\nssm.exe install tpson_client %root%\tpson_client.exe -c %root%\tpson_win_client.ini

:start service
%root%\nssm.exe restart tpson_client

:nssm stop tpson_client
:nssm restart tpson_client
:nssm remove tpson_client confirm
pause