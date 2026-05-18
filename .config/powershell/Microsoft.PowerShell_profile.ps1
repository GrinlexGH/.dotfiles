sal ll ls

if ($null -ne (Get-Command zoxide -ErrorAction SilentlyContinue)) {
    zoxide init powershell | Out-String | Invoke-Expression
}
