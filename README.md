# Ollama Production Setup Documentation

## Configuration Files
1. **update_paths.ps1**: Updates service paths for Ollama and Cloudflared
2. **setup_task.ps1**: Creates Windows scheduled task for auto-start
3. **config.yml**: Cloudflare tunnel configuration
4. **Modelfile**: Ollama model optimization settings
5. **joelmbaka.site.txt**: DNS configuration

## Paths
- Ollama: C:\Users\USER\AppData\Local\Programs\Ollama\ollama.exe
- Cloudflared: C:\Program Files (x86)\cloudflared\cloudflared.exe

## Model Details
- Name: llama-prod
- Base: llama3.2:1b-instruct-fp16
- Quantization: Q4_K_M
- Size: 807MB
- Parameters:
  - num_ctx: 768
  - num_thread: 4
  - temperature: 0.8
  - top_k: 40
  - top_p: 0.9
  - repeat_penalty: 1.2

## API Endpoint
https://ollama.joelmbaka.site

## Startup Configuration
- Windows Task: "Start Ollama and Tunnel"
- Runs at logon
- Starts both services automatically

## Backup Location
C:\Users\USER\.cloudflared\config_backup_20250108

Created: 2025-01-08 13:02:57
