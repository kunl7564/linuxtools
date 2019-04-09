:set root=c:\tpsonproxy

set root=E:\Installers\frp\20190409\frp_0.25.3_windows_386
%root%\nssm.exe stop tpson_client
%root%\nssm.exe remove tpson_client confirm
pause