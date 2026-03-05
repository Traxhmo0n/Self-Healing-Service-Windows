# Sistema de Auto-reparación (Self-Healing) de Servicios IT

Este proyecto consiste en un script automatizado desarrollado en **PowerShell** diseñado para monitorizar servicios críticos del sistema (en este caso, el Spooler de impresión) y restaurarlos automáticamente en caso de fallo, notificando al equipo de soporte en tiempo real.

## Problema y Solución
* **Problema:** Las caídas de servicios críticos generan interrupciones en la operatividad de la empresa y aumentan la carga de tickets simples para el equipo de IT.
* **Solución:** Un script que actúa como "primer nivel de soporte" automático, reduciendo el tiempo de inactividad de minutos/horas a solo segundos.

## Características Técnicas
* **Lenguaje:** PowerShell.
* **Monitoreo:** Verificación de estado mediante `Get-Service`.
* **Recuperación:** Reinicio forzado de servicios detenidos.
* **Notificación:** Integración con API de Discord mediante **Webhooks** para alertas instantáneas.
* **Seguridad:** Manejo de objetos JSON y codificación UTF-8 para garantizar la integridad de los datos enviados.

## Instalación y Configuración
1.  **Webhook:** Configurar un Webhook en un canal de Discord y copiar la URL en la variable `$WebhookUrl`.
2.  **Permisos:** El script debe ejecutarse con privilegios de Administrador para poder gestionar servicios del sistema.
3.  **Ejecución:** ```powershell
    .\MonitorSpooler.ps1
    ```

## Automatización (Task Scheduler)
Para una implementación profesional, el script se configura en el **Programador de Tareas de Windows** para ejecutarse cada 5 minutos con los siguientes argumentos:
* **Programa:** `powershell.exe`
* **Argumentos:** `-ExecutionPolicy Bypass -File "C:\Ruta\Tu\Script\MonitorSpooler.ps1"`

---
**Desarrollado como proyecto de demostración de capacidades en Automatización y Soporte IT.**
