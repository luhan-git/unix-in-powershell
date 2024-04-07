Param(
    [string]$FileName
)

$Path = Join-Path -Path $PWD.Path -ChildPath $FileName
if (-not (Test-Path -Path $Path)) {
    New-Item -Path $Path -ItemType File | Out-Null
}
else {
    (Get-ChildItem -Path $Path).LastWriteTime = Get-Date
}