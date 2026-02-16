$_MINECRAFT_SERVER_DIR = $env:MINECRAFT_SERVER_DIR ?? "."

sal ll ls

if ($null -ne (Get-Command zoxide -ErrorAction SilentlyContinue)) {
    zoxide init powershell | Out-String | Invoke-Expression
}

"start","stop","log","rcon" | ForEach-Object {
    $p = "$_MINECRAFT_SERVER_DIR/$_.ps1"
    if (Test-Path $p) { Set-Alias "mc-$_" $p }
    Remove-Variable p
}
Remove-Variable _MINECRAFT_SERVER_DIR
