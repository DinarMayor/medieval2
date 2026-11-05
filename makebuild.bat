@echo off
:: Manually generate a build from the precompiled bits
:: note : all of the build commands must be run prior to this
:: eg scons kingdomsSKU skuName=Kingdoms_Gold-EAFIGS retail-build 

set PUBLISHED_BUILD=.\PublishedBuild

echo Collecting build data into %PUBLISHED_BUILD%
if exist %PUBLISHED_BUILD%\. ( 
	echo "Please Delete %PUBLISHED_BUILD% Folder" 
	exit /B

	)

	
rd /s /q artifacts
:: build the code	
call scons
	
	
:: create output directory
md %PUBLISHED_BUILD%

:: ----------------------------------------------------------------------
:: copy Data

md %PUBLISHED_BUILD%\data

:: copy animations
md %PUBLISHED_BUILD%\data\Animations
xcopy Data\Animations\*.dat %PUBLISHED_BUILD%\data\Animations
xcopy Data\Animations\*.idx %PUBLISHED_BUILD%\data\Animations

:: SJS TODO 
:: copy sounds
md %PUBLISHED_BUILD%\Data\Sounds
:: SJS TODO these will be localised xcopy Data\Sounds\*.dat %PUBLISHED_BUILD%\Data\Sounds
:: SJS TODO these will be localised xcopy Data\Sounds\*.idx %PUBLISHED_BUILD%\Data\Sounds

:: copy Packs
md %PUBLISHED_BUILD%\packs
xcopy Packs\*.* %PUBLISHED_BUILD%\packs /s /e 

:: copy FMV
md %PUBLISHED_BUILD%\data\fmv
xcopy data\fmv\*.* %PUBLISHED_BUILD%\data\fmv /s /e 

:: copy world
md %PUBLISHED_BUILD%\data\world
xcopy data\world\*.* %PUBLISHED_BUILD%\data\world /s /e 

:: copy cursors
md %PUBLISHED_BUILD%\data\cursors
xcopy data\cursors\*.* %PUBLISHED_BUILD%\data\cursors /s /e 


:: ----------------------------------------------------------------------
:: copy dlls

md %PUBLISHED_BUILD%\miles
xcopy bin\miles\*.* %PUBLISHED_BUILD%\miles /s /e 
xcopy bin\granny2.dll %PUBLISHED_BUILD%
xcopy bin\binkw32.dll %PUBLISHED_BUILD%
xcopy bin\mss32.dll %PUBLISHED_BUILD%
xcopy bin\IDV.dll %PUBLISHED_BUILD%
xcopy bin\cine.dll %PUBLISHED_BUILD%
xcopy steam_api.dll %PUBLISHED_BUILD%
xcopy installers\game\msvc*.* %PUBLISHED_BUILD%
xcopy installers\game\mf*.* %PUBLISHED_BUILD%

:: ----------------------------------------------------------------------
:: copy installers & install scripts

xcopy installscript.vdf %PUBLISHED_BUILD%




md %PUBLISHED_BUILD%\dxsetup
xcopy Installers\game\DirectX9small\*.* %PUBLISHED_BUILD%\dxsetup

:: ----------------------------------------------------------------------
:: copy executables



:: copy main executable
copy bin\kingdoms.exe %PUBLISHED_BUILD%\medieval2.exe




:: ----------------------------------------------------------------------
:: copy mods
:: ----------------------------------------------------------------------

md %PUBLISHED_BUILD%\mods
md %PUBLISHED_BUILD%\mods\americas
md %PUBLISHED_BUILD%\mods\british_isles
md %PUBLISHED_BUILD%\mods\crusades
md %PUBLISHED_BUILD%\mods\teutonic


:: ----------------------------------------------------------------------
:: americas
:: ----------------------------------------------------------------------

md %PUBLISHED_BUILD%\mods\americas\data\animations
md %PUBLISHED_BUILD%\mods\americas\data\sounds
md %PUBLISHED_BUILD%\mods\americas\data\world
md %PUBLISHED_BUILD%\mods\americas\data\fmv
md %PUBLISHED_BUILD%\mods\americas\packs


xcopy mods\americas\data\animations\*.dat %PUBLISHED_BUILD%\mods\americas\data\animations
xcopy mods\americas\data\animations\*.idx %PUBLISHED_BUILD%\mods\americas\data\animations
xcopy mods\americas\data\sounds\*.dat %PUBLISHED_BUILD%\mods\americas\data\sounds
xcopy mods\americas\data\sounds\*.idx %PUBLISHED_BUILD%\mods\americas\data\sounds
xcopy mods\americas\data\world\*.* %PUBLISHED_BUILD%\mods\americas\data\world /s /e
xcopy mods\americas\data\fmv\*.* %PUBLISHED_BUILD%\mods\americas\data\fmv /s /e
xcopy mods\americas\packs\*.* %PUBLISHED_BUILD%\mods\americas\packs /s /e


:: ----------------------------------------------------------------------
:: british_isles
:: ----------------------------------------------------------------------

md %PUBLISHED_BUILD%\mods\british_isles\data\animations
md %PUBLISHED_BUILD%\mods\british_isles\data\sounds
md %PUBLISHED_BUILD%\mods\british_isles\data\world
md %PUBLISHED_BUILD%\mods\british_isles\data\fmv
md %PUBLISHED_BUILD%\mods\british_isles\packs

xcopy mods\british_isles\data\animations\*.dat %PUBLISHED_BUILD%\mods\british_isles\data\animations
xcopy mods\british_isles\data\animations\*.idx %PUBLISHED_BUILD%\mods\british_isles\data\animations
xcopy mods\british_isles\data\sounds\*.dat %PUBLISHED_BUILD%\mods\british_isles\data\sounds
xcopy mods\british_isles\data\sounds\*.idx %PUBLISHED_BUILD%\mods\british_isles\data\sounds
xcopy mods\british_isles\data\world\*.* %PUBLISHED_BUILD%\mods\british_isles\data\world /s /e
xcopy mods\british_isles\data\fmv\*.* %PUBLISHED_BUILD%\mods\british_isles\data\fmv /s /e
xcopy mods\british_isles\packs\*.* %PUBLISHED_BUILD%\mods\british_isles\packs /s /e


:: ----------------------------------------------------------------------
:: crusades
:: ----------------------------------------------------------------------

md %PUBLISHED_BUILD%\mods\crusades\data\animations
md %PUBLISHED_BUILD%\mods\crusades\data\sounds
md %PUBLISHED_BUILD%\mods\crusades\data\world
md %PUBLISHED_BUILD%\mods\crusades\data\fmv
md %PUBLISHED_BUILD%\mods\crusades\packs

xcopy mods\crusades\data\animations\*.dat %PUBLISHED_BUILD%\mods\crusades\data\animations
xcopy mods\crusades\data\animations\*.idx %PUBLISHED_BUILD%\mods\crusades\data\animations
xcopy mods\crusades\data\sounds\*.dat %PUBLISHED_BUILD%\mods\crusades\data\sounds
xcopy mods\crusades\data\sounds\*.idx %PUBLISHED_BUILD%\mods\crusades\data\sounds
xcopy mods\crusades\data\world\*.* %PUBLISHED_BUILD%\mods\crusades\data\world /s /e
xcopy mods\crusades\data\fmv\*.* %PUBLISHED_BUILD%\mods\crusades\data\fmv /s /e
xcopy mods\crusades\packs\*.* %PUBLISHED_BUILD%\mods\crusades\packs /s /e


:: ----------------------------------------------------------------------
:: teutonic
:: ----------------------------------------------------------------------

md %PUBLISHED_BUILD%\mods\teutonic\data\animations
md %PUBLISHED_BUILD%\mods\teutonic\data\sounds
md %PUBLISHED_BUILD%\mods\teutonic\data\world
md %PUBLISHED_BUILD%\mods\teutonic\data\fmv
md %PUBLISHED_BUILD%\mods\teutonic\packs

xcopy mods\teutonic\data\animations\*.dat %PUBLISHED_BUILD%\mods\teutonic\data\animations
xcopy mods\teutonic\data\animations\*.idx %PUBLISHED_BUILD%\mods\teutonic\data\animations
xcopy mods\teutonic\data\sounds\*.dat %PUBLISHED_BUILD%\mods\teutonic\data\sounds
xcopy mods\teutonic\data\sounds\*.idx %PUBLISHED_BUILD%\mods\teutonic\data\sounds
xcopy mods\teutonic\data\world\*.* %PUBLISHED_BUILD%\mods\teutonic\data\world /s /e
xcopy mods\teutonic\data\fmv\*.* %PUBLISHED_BUILD%\mods\teutonic\data\fmv /s /e
xcopy mods\teutonic\packs\*.* %PUBLISHED_BUILD%\mods\teutonic\packs /s /e



:: SJS todo :  copy the localised assets, work out how these get overlayed
md %PUBLISHED_BUILD%\localised_assets
xcopy localised_assets\*.* %PUBLISHED_BUILD%\localised_assets /s /e


md %PUBLISHED_BUILD%\localised_assets\French\data\fmv
xcopy localization\French\data\fmv\*.* %PUBLISHED_BUILD%\localised_assets\French\data\fmv /s /e

md %PUBLISHED_BUILD%\localised_assets\Italian\data\fmv
xcopy localization\Italian\data\fmv\*.* %PUBLISHED_BUILD%\localised_assets\Italian\data\fmv /s /e

md %PUBLISHED_BUILD%\localised_assets\German\data\fmv
xcopy localization\German\data\fmv\*.* %PUBLISHED_BUILD%\localised_assets\German\data\fmv /s /e

md %PUBLISHED_BUILD%\localised_assets\Spanish\data\fmv
xcopy localization\Spanish\data\fmv\*.* %PUBLISHED_BUILD%\localised_assets\Spanish\data\fmv /s /e



:: copy packer tools
md %PUBLISHED_BUILD%\tools
md %PUBLISHED_BUILD%\tools\unpacker
xcopy src\tools\unpacker\unpack*.bat %PUBLISHED_BUILD%\tools\unpacker /Y
xcopy src\tools\unpacker\unpack*.bat %PUBLISHED_BUILD%\tools\unpacker /Y
xcopy artifacts\binaries\unpacker.exe %PUBLISHED_BUILD%\tools\unpacker /Y


:: fix music
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\English /E /Y
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\American /E /Y
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\French /E /Y
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\German /E /Y
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\Italian /E /Y
xcopy builld_extras\*.* %PUBLISHED_BUILD%\localised_assets\Spanish /E /Y


