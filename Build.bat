REM @echo off

cd \dev\a5v12\src
call SetBuildEnvironment.bat
cd \dev\3rdparty\redis
echo Calling stage.bat
call stage.bat
echo A53RDPARTYBUILD_REDIS=%A53RDPARTYBUILD_REDIS%
SET MSBUILDDISABLENODEREUSE=1
start /B /WAIT devenv %A53RDPARTYBUILD_REDIS%msvs\RedisServer.sln /upgrade
start /B /WAIT MSbuild.exe /m /nr:false /p:UseEnv=true;Configuration="Release";Platform=x86 %A53RDPARTYBUILD_REDIS%msvs\RedisServer.sln
start /B /WAIT MSbuild.exe /m /nr:false /p:UseEnv=true;Configuration="Debug";Platform=x86 %A53RDPARTYBUILD_REDIS%msvs\RedisServer.sln
cd \dev\3rdParty\redis
echo Calling updatebin.bat
call updatebin.bat

REM Sign the executables
REM \dev\BuildScripts\SignExecutable.bat c:\dev\3rdParty\redis\3.0\bin\x64\Release\redis-cli.exe
REM \dev\BuildScripts\SignExecutable.bat c:\dev\3rdParty\redis\3.0\bin\x64\Release\redis-server.exe
