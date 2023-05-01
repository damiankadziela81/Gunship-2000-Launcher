@echo off
cls
:main
ECHO [1;32m[42m
ECHO ������� Gunship 2000 Launcher ����������������������ͻ
ECHO �  1) Run the game                                   �
ECHO �  2) Setup the game                                 �
ECHO ������� Pilot Backup �������������������������������͹
ECHO �  3) Save backup roster                             �
ECHO �  4) Restore backup roster                          �
ECHO ������� Quit Options �������������������������������͹
ECHO �  5) Exit to DOS                                    �
ECHO �  6) Exit to Host OS                                �
ECHO ����������������������������������������[5m[1;33m by damson [0m[1;32m[42m�ͼ
ECHO [0m

choice /c123456 /s Select your option [1-6]: /n
if errorlevel 6 goto exit
if errorlevel 5 goto cmd
if errorlevel 4 goto restore
if errorlevel 3 goto save
if errorlevel 2 goto setup
if errorlevel 1 goto run

:save
IF EXIST .\backup\roster.dat goto savexist
IF NOT EXIST .\backup\roster.dat (
md backup
goto savey
)
:savexist
cls
choice /cyn /s [1;31mARE YOU SURE, THIS WILL OVERWRITE YOUR BACKUP ROSTER? [Y/N][0m /n
if errorlevel 2 goto saven
if errorlevel 1 goto savey
:saven
cls
ECHO [5m[1;31mROSTER NOT SAVED[0m
goto main
:savey
copy roster.dat .\backup
cls
ECHO [5m[1;31mROSTER SAVED[0m
goto main

:restore
IF EXIST .\backup\roster.dat goto filexist
IF NOT EXIST .\backup\roster.dat goto nofile
:filexist
cls
choice /cyn /s [1;31mARE YOU SURE, THIS WILL OVERWRITE YOUR CURRENT ROSTER? [Y/N][0m /n
if errorlevel 2 goto restoren
if errorlevel 1 goto restorey
:restoren
cls
ECHO [5m[1;32mROSTER NOT RESTORED[0m
goto main
:restorey
copy .\backup\roster.dat .
cls 
ECHO [5m[1;32mROSTER RESTORED[0m
goto main
:nofile
cls
ECHO [1;31mThere is no backup yet, make one first![0m
goto main

:exit
exit

:cmd
cls
goto end

:run
gs2000
goto main

:setup
setup
goto main

:end