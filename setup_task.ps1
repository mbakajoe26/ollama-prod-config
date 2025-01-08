# Tell Windows to run start_services.ps1 when you log in
$scriptPath = "C:\Users\USER\.cloudflared\start_services.ps1"

# Create improved action with full PowerShell path
$action = New-ScheduledTaskAction `
    -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" `
    -Argument "-NoLogo -NonInteractive -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptPath`"" `
    -WorkingDirectory "C:\Users\USER\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

# Create trigger for logon
$trigger = New-ScheduledTaskTrigger -AtLogon

# Set principal with highest privileges
$principal = New-ScheduledTaskPrincipal `
    -UserId $env:USERNAME `
    -LogonType Interactive `
    -RunLevel Highest

# Create settings
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable

# Register the task with all components
Register-ScheduledTask `
    -TaskName "Start Ollama and Tunnel" `
    -Action $action `
    -Trigger $trigger `
    -Principal $principal `
    -Settings $settings `
    -Force

Write-Host "Task scheduled successfully!" 