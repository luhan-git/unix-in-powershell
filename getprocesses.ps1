param(
    [string]$ProcessNamePatern = "task"
)

while ($true) {
    Clear-Host

    # Obtener procesos cuyos nombres coincidan parcialmente con el patrón especificado
    $processes = Get-Process | Where-Object { $_.ProcessName -like "*$ProcessNamePatern*" }

    if ($processes) {
        # Mostrar detalles de los procesos encontrados
        $processes | Select-Object Id, ProcessName, CPU, @{Name = "Memory (MB)"; Expression = { [Math]::Round($_.PrivateMemorySize / 1MB, 2) } } | Format-Table -AutoSize
    }
    else {
        Write-Host "No se encontraron procesos que coincidan con el patrón '$ProcessNamePatern'."
    }
    Start-Sleep -Seconds 2
}
