@echo off
setlocal

echo Installing applications...

:: Download URLs
set "SKYPE_URL=https://go.skype.com/windows.desktop.download"
set "VSCODE_URL=https://update.code.visualstudio.com/latest/win32-x64-user/stable"
set "SUBLIME_URL=https://download.sublimetext.com/Sublime%20Text%20Build%204116%20Setup.exe"
set "CHROME_URL=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
set "ANYDESK_URL=https://download.anydesk.com/AnyDesk.exe"
set "MELD_URL=https://download.gnome.org/binaries/win32/meld/3.20.0/meld-3.20.0-win32.exe"
set "GIT_URL=https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/Git-2.41.0-64-bit.exe"
set "XAMPP_URL=https://www.apachefriends.org/xampp-files/8.2.0/xampp-windows-x64-8.2.0-0-VS16-installer.exe"
set "ANDROID_STUDIO_URL=https://redirector.gvt1.com/edgedl/android/studio/install/2022.3.1.17/android-studio-2022.3.1.17-windows.exe"
set "MONGODB_URL=https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-6.0.4-signed.msi"
set "NVM_URL=https://github.com/coreybutler/nvm-windows/releases/download/1.1.9/nvm-setup.exe"

:: Download locations
set "DOWNLOAD_DIR=%temp%\installers"
mkdir "%DOWNLOAD_DIR%"

:: Downloading files
echo Downloading Skype...
powershell -Command "Invoke-WebRequest -Uri %SKYPE_URL% -OutFile %DOWNLOAD_DIR%\SkypeSetup.exe"

echo Downloading VSCode...
powershell -Command "Invoke-WebRequest -Uri %VSCODE_URL% -OutFile %DOWNLOAD_DIR%\VSCodeSetup.exe"

echo Downloading Sublime Text...
powershell -Command "Invoke-WebRequest -Uri %SUBLIME_URL% -OutFile %DOWNLOAD_DIR%\SublimeTextSetup.exe"

echo Downloading Google Chrome...
powershell -Command "Invoke-WebRequest -Uri %CHROME_URL% -OutFile %DOWNLOAD_DIR%\ChromeSetup.exe"

echo Downloading AnyDesk...
powershell -Command "Invoke-WebRequest -Uri %ANYDESK_URL% -OutFile %DOWNLOAD_DIR%\AnyDeskSetup.exe"

echo Downloading Meld...
powershell -Command "Invoke-WebRequest -Uri %MELD_URL% -OutFile %DOWNLOAD_DIR%\MeldSetup.exe"

echo Downloading Git...
powershell -Command "Invoke-WebRequest -Uri %GIT_URL% -OutFile %DOWNLOAD_DIR%\GitSetup.exe"

echo Downloading XAMPP...
powershell -Command "Invoke-WebRequest -Uri %XAMPP_URL% -OutFile %DOWNLOAD_DIR%\XAMPPSetup.exe"

echo Downloading Android Studio...
powershell -Command "Invoke-WebRequest -Uri %ANDROID_STUDIO_URL% -OutFile %DOWNLOAD_DIR%\AndroidStudioSetup.exe"

echo Downloading MongoDB...
powershell -Command "Invoke-WebRequest -Uri %MONGODB_URL% -OutFile %DOWNLOAD_DIR%\MongoDBSetup.msi"

echo Downloading NVM...
powershell -Command "Invoke-WebRequest -Uri %NVM_URL% -OutFile %DOWNLOAD_DIR%\NVMSetup.exe"

:: Installing applications
echo Installing Skype...
start /wait "" "%DOWNLOAD_DIR%\SkypeSetup.exe" /quiet

echo Installing VSCode...
start /wait "" "%DOWNLOAD_DIR%\VSCodeSetup.exe" /silent /mergetasks=runcode

echo Installing Sublime Text...
start /wait "" "%DOWNLOAD_DIR%\SublimeTextSetup.exe" /verysilent

echo Installing Google Chrome...
start /wait "" "%DOWNLOAD_DIR%\ChromeSetup.exe" /silent /install

echo Installing AnyDesk...
start /wait "" "%DOWNLOAD_DIR%\AnyDeskSetup.exe" /silent

echo Installing Meld...
start /wait "" "%DOWNLOAD_DIR%\MeldSetup.exe" /verysilent

echo Installing Git...
start /wait "" "%DOWNLOAD_DIR%\GitSetup.exe" /verysilent

echo Installing XAMPP...
start /wait "" "%DOWNLOAD_DIR%\XAMPPSetup.exe" /verysilent

echo Installing Android Studio...
start /wait "" "%DOWNLOAD_DIR%\AndroidStudioSetup.exe" /silent

echo Installing MongoDB...
start /wait msiexec /i "%DOWNLOAD_DIR%\MongoDBSetup.msi" /quiet

echo Installing NVM...
start /wait "" "%DOWNLOAD_DIR%\NVMSetup.exe" /silent

echo Cleaning up...
rd /s /q "%DOWNLOAD_DIR%"

echo Installation complete.
endlocal
pause