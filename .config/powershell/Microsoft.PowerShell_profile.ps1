$_MINECRAFT_SERVER_DIR = $env:MINECRAFT_SERVER_DIR ?? "."

sal ll ls
function sli { New-Item -ItemType SymbolicLink -Path $args[1] -Target $args[0] }

"start","stop","log","rcon" | ForEach-Object {
    $p = "$_MINECRAFT_SERVER_DIR/$_.ps1"
    if (Test-Path $p) { Set-Alias "mc-$_" $p }
    Remove-Variable p
}
Remove-Variable _MINECRAFT_SERVER_DIR
