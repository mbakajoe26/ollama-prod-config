# Script to update service paths
@'
# Start Ollama
Start-Process -FilePath "C:\Users\USER\AppData\Local\Programs\Ollama\ollama.exe" -ArgumentList "serve" -WindowStyle Hidden

# Wait 10 seconds
Start-Sleep -Seconds 10

# Start Cloudflare Tunnel
Start-Process -FilePath "C:\Program Files (x86)\cloudflared\cloudflared.exe" -ArgumentList "tunnel", "run", "9ce489d0-b87b-4ccd-b051-da10aafb5ee3" -WindowStyle Hidden
'@ | Out-File "C:\Users\USER\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\start_services.ps1" -Force

Write-Host "Updated start_services.ps1 with correct paths" 