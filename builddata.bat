@echo off
echo -----------------------------
echo Deleting pack files
echo -----------------------------
del /F data\animations\*.dat
del /F data\animations\*.idx
del /F data\sounds\*.dat
del /F data\sounds\*.idx
del /F data\world\maps\base\map.rwm
del /F data\world\maps\campaign\AudioTest\map.rwm

echo -----------------------------
echo Converting data
echo -----------------------------
call scons "data-convert"

if not errorlevel 1 goto end
pause
:end
