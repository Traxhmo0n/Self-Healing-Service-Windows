# 1. Configuración
$ServiceName = "Spooler"
$WebhookUrl = "Tu URL de WebHook"

# 2. Verificar el estado del servicio
$Service = Get-Service -Name $ServiceName

if ($Service.Status -ne 'Running') {
    Write-Host "El servicio $ServiceName está detenido. Reiniciando..." -ForegroundColor Red
    
    # 3. Intentar reiniciar
    Start-Service -Name $ServiceName
    Start-Sleep -Seconds 5
    
    $CurrentStatus = (Get-Service -Name $ServiceName).Status
    
    # 4. Crear el mensaje para Discord
    $Payload = [PSCustomObject]@{
        content = " **Alerta de Soporte IT**`n**Equipo:** $($env:COMPUTERNAME)`n**Servicio:** $ServiceName`n**Estado:** Reiniciado exitosamente "
    }
    
    $JSON = $Payload | ConvertTo-Json
    
    # 5. Enviar notificación
    Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $JSON -ContentType "application/json; charset=utf-8"
    
    Write-Host "Notificación enviada a Discord." -ForegroundColor Cyan
} 
else {
    Write-Host "El servicio $ServiceName funciona correctamente." -ForegroundColor Green
}