PUSHD %~dp0
call scons

:: build data packs
del /F data\animations\*.dat
del /F data\animations\*.idx
del /F data\sounds\*.dat
del /F data\sounds\*.idx
del /F data\world\maps\base\map.rwm
del /F data\world\maps\campaign\AudioTest\map.rwm
call scons "data-convert"

:: build mod packs
call scons modBuild=1 modPath=mods/americas modName=americas data-convert
call scons modBuild=1 modPath=mods/british_isles modName=british_isles data-convert
call scons modBuild=1 modPath=mods/crusades modName=crusades data-convert
call scons modBuild=1 modPath=mods/teutonic modName=teutonic data-convert

call scons kingdomsSKU skuName=Kingdoms_Gold-EAFIGS skuNoPostBuild=1 retail-build 

::call MakeBuild.bat

pause