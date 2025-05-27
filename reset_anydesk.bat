@echo off
REM Encerra o processo do AnyDesk para liberar os arquivos
echo Encerrando processos do AnyDesk...
taskkill /F /IM AnyDesk.exe /T
taskkill /F /IM ad.exe /T

REM Exclui a pasta AnyDesk em AppData\Roaming para todos os usuários
for /D %%u in (C:\Users\*) do (
    if exist "%%u\AppData\Roaming\AnyDesk" (
        echo Tomando posse dos arquivos para o usuário %%u...
        takeown /f "%%u\AppData\Roaming\AnyDesk" /r /d y
        icacls "%%u\AppData\Roaming\AnyDesk" /grant Administrators:F /t
        rd /s /q "%%u\AppData\Roaming\AnyDesk"
        echo Excluindo a pasta AnyDesk para o usuário %%u
    )
)

REM Exclui a pasta AnyDesk na pasta ProgramData, se existir
if exist "C:\ProgramData\AnyDesk" (
    echo Tomando posse dos arquivos em ProgramData...
    takeown /f "C:\ProgramData\AnyDesk" /r /d y
    icacls "C:\ProgramData\AnyDesk" /grant Administrators:F /t
    rd /s /q "C:\ProgramData\AnyDesk"
    echo Excluindo a pasta AnyDesk em ProgramData
)

REM Exclui as chaves de registro relacionadas ao AnyDesk
echo Excluindo chaves de registro do AnyDesk...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\AnyDesk" /f
reg delete "HKEY_CURRENT_USER\Software\AnyDesk" /f
reg delete "HKEY_USERS\.DEFAULT\Software\AnyDesk" /f

REM Tenta renovar a versão de avaliação
echo Renovando versão de avaliação do AnyDesk...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AnyDesk" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\AnyDesk" /f

echo Operação concluída.
pause
