<#
.SYNOPSIS
    Agents of SigNoz Hackathon - Synthetic Telemetry Generator
.DESCRIPTION
    Generates a 15-span deep OpenTelemetry trace hierarchy and streams it to a local 
    self-hosted SigNoz OTLP receiver on Windows using Docker and Foundry.
#>

Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host " Starting OpenTelemetry Deep Trace Generator (15 Spans)  " -ForegroundColor Cyan
Write-Host "=========================================================" -ForegroundColor Cyan
Write-Host "Target Endpoint : host.docker.internal:4317" -ForegroundColor Yellow
Write-Host "Rate            : 5 ops/s" -ForegroundColor Yellow
Write-Host "Duration        : 300 seconds" -ForegroundColor Yellow

docker run --rm `
  --add-host host.docker.internal:host-gateway `
  ghcr.io/open-telemetry/opentelemetry-collector-contrib/telemetrygen:latest `
  traces `
  --otlp-endpoint host.docker.internal:4317 `
  --otlp-insecure `
  --rate 5 `
  --duration 300s `
  --child-spans 15

Write-Host "`n[+] Telemetry stream completed successfully!" -ForegroundColor Green
Write-Host "[+] View your live waterfall traces at: http://localhost:8383" -ForegroundColor Green