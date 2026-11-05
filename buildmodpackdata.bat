@echo off
echo -----------------------------
echo Converting data
echo -----------------------------
call scons modBuild=1 modPath=mods/americas modName=americas data-convert
call scons modBuild=1 modPath=mods/british_isles modName=british_isles data-convert
call scons modBuild=1 modPath=mods/crusades modName=crusades data-convert
call scons modBuild=1 modPath=mods/teutonic modName=teutonic data-convert

if not errorlevel 1 goto end
pause
:end
