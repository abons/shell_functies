#automatisch committen en pushen van sql backup
#vereist yoobi-repo genaamd YoobiSql
cd .\YoobiSql
git pull
cd .\model\_db
.\_gitready.ps1
git add .
git commit -am "sql export"
git push