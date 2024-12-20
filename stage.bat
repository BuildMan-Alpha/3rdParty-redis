@echo off

if "%A5_REDISCLIENT%" == "" goto nothing
set A53RDPARTYBUILD_REDIS=%A5BLDROOT%\%A5COMPILERVERSION%\3rdParty\Redis\
xcopy "%A5_REDISCLIENT%" "%A53RDPARTYBUILD_REDIS%" /s /y
cd %A53RDPARTYBUILD_REDIS%
\dev\a5v12\src\BuildTools\fart -s "%A53RDPARTYBUILD_REDIS%*.vcxproj" "<RuntimeLibrary>MultiThreaded</RuntimeLibrary>" "<RuntimeLibrary>MultiThreadedDLL</RuntimeLibrary><DebugInformationFormat>ProgramDatabase</DebugInformationFormat>"
\dev\a5v12\src\BuildTools\fart -s "%A53RDPARTYBUILD_REDIS%*.vcxproj" "<RuntimeLibrary>MultiThreadedDebug</RuntimeLibrary>" "<RuntimeLibrary>MultiThreadedDebugDLL</RuntimeLibrary><DebugInformationFormat>ProgramDatabase</DebugInformationFormat>"
\dev\a5v12\src\BuildTools\fart -s "%A53RDPARTYBUILD_REDIS%*.vcxproj" "<DebugInformationFormat>EditAndContinue</DebugInformationFormat>" "<DebugInformationFormat>ProgramDatabase</DebugInformationFormat>"
echo "%A5_REDISCLIENT% source files have been staged to build location" 
goto done
:nothing
echo "A5_REDISCLIENT needs to be defined"
:done
echo stage.bat complete