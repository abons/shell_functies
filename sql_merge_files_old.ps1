#voeg nieuwe regel met GO toe zodat scriptjes in batches na elkaar gezet kunnen worden
Add-content *\*.sql -Value `r`nGO`r`n
#kopieer alle .sql files inhoud naar 1 sql file
Get-Content *\*.sql | Set-Content merged.sql