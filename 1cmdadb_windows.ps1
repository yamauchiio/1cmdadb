if (Test-Path "C:\platform-tools") {
    Remove-Item -Path "C:\platform-tools" -Recurse
}

Start-BitsTransfer -Source "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
Start-BitsTransfer -Source "https://dl.google.com/android/repository/latest_usb_driver_windows.zip"

Expand-Archive -Path "./platform-tools-latest-windows.zip" -DestinationPath "C:\"
Expand-Archive -Path "./latest_usb_driver_windows.zip" -DestinationPath "./"

pnputil /add-driver "./usb_driver/android_winusb.inf"

Remove-Item -Path "./platform-tools-latest-windows.zip" -Recurse
Remove-Item -Path "./latest_usb_driver_windows.zip" -Recurse
Remove-Item -Path "./usb_driver" -Recurse

if ([Environment]::GetEnvironmentVariable("Path", "Machine") -split ";" -notcontains "C:\platform-tools") {
    [Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", "Machine") + ";C:\platform-tools", "Machine")
}

Write-Host "Press any key to exit..."
$null = Read-Host
