set yoobi_path="c:\dev\www\yoobi"
set commandbox_path="C:\dev\www\box\box"

echo off
echo 'Start cf-linting'

cd /d %yoobi_path%

::echo 'custom' && %commandbox_path% cflint pattern="handlers\new.cfc" reportlevel="error" && PAUSE
echo 'interceptors/'
%commandbox_path% cflint pattern="interceptors\*" reportlevel="error"
echo 'yoobi_v2/'
%commandbox_path% cflint pattern="yoobi_v2\handlers\*" reportlevel="error"
echo 'handlers/'
%commandbox_path% cflint pattern="handlers\*" reportlevel="error"
echo 'model/'
%commandbox_path% cflint pattern="model\*" reportlevel="error"

echo 'Finished cf-linting'
PAUSE