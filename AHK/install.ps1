# download the latest VirtualDesktopAccessor
$repo = "Ciantic/VirtualDesktopAccessor"
$dllName = "VirtualDesktopAccessor.dll"
$latest = (Invoke-WebRequest "https://api.github.com/repos/$repo/releases" | ConvertFrom-Json)[0].tag_name
Invoke-WebRequest "https://github.com/$repo/releases/download/$latest/$dllName" -Out $dllName

# install AHK
winget install --no-upgrade --scope machine -s winget -l "$env:ProgramFiles\AutoHotkey" -e AutoHotkey.AutoHotkey # requires install location for some reason

# add scripts to autostart
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "vd.ahk" -Value (Get-ChildItem -Path .\vd.ahk).FullName -PropertyType String

# run scripts
.\vd.ahk
