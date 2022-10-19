#combineer alle .sql in 1 file
New-Item merged.sql -Force
#transactie = kopie van redgate compare
Add-Content -Path .\merged.sql -Value "SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION merged"
#kopieer alle .sql files in map en submap
$files = Get-ChildItem "*.sql" -Recurse -Exclude "merged.sql"
foreach($file in $files) {
    #show filename
    echo $file | Resolve-Path -Relative
    #kopie van inhoud
	$content = Get-Content $file
    #kopie aanpassen
    foreach($line in $content) {
        if($line -match '^ALTER'){
            echo "-- $($line)"
        }
    }
    if($content -match '.*USE \[sqlYoobiLive\].*'){ 
        echo '-- "USE [sqlYoobiLive]" niet gekopieerd naar merged.sql!!!!!'
        $content = $content.replace('USE [sqlYoobiLive]','')
    }
    #spacer zichtbaar in editor met filename
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------  $($file | Resolve-Path -Relative)"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "------------------------------------"
    Add-Content -Path .\merged.sql -Value "GO"
    Add-Content -Path .\merged.sql -Value "PRINT N'$($file | Resolve-Path -Relative)'"
    Add-Content -Path .\merged.sql -Value "GO"
    #kopie opslaan
    Add-Content -Path .\merged.sql -Value $content 
    #GO zodat scriptjes in batches na elkaar gezet kunnen worden
    Add-Content -Path .\merged.sql -Value "GO"
    #transactie error-check = kopie van redgate compare
    Add-Content -Path .\merged.sql -Value "IF @@ERROR <> 0 SET NOEXEC ON"
    Add-Content -Path .\merged.sql -Value "GO"
}
#transactie eind = kopie van redgate compare
Add-Content -Path .\merged.sql -Value "COMMIT TRANSACTION merged
    GO
    DECLARE @Success AS BIT
        SET @Success = 1
        SET NOEXEC OFF
        IF (@Success = 1) PRINT 'The database update succeeded'
        ELSE BEGIN
	        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION merged
	        PRINT 'The database update failed'
        END"
PAUSE