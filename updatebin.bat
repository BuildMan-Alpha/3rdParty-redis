REM @echo off

if "%A5_REDISCLIENT%" == "" goto nothing

set A53RDPARTYBUILD_REDIS=%A5BLDROOT%\%A5COMPILERVERSION%\3rdParty\Redis\
echo starting updatebin.bat
echo =======================
echo A53RDPARTYBUILD_REDIS=%A53RDPARTYBUILD_REDIS%
xcopy %A53RDPARTYBUILD_REDIS%msvs\jemalloc\vc2013\x86\libjemalloc_x86_Release.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Release\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Release\hiredis.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Release\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Release\lua.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Release\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Release\Win32_Interop.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Release\
xcopy %A53RDPARTYBUILD_REDIS%msvs\jemalloc\vc2013\x86\libjemalloc_x86_Debug.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Debug\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Debug\hiredis.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Debug\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Debug\lua.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Debug\
xcopy %A53RDPARTYBUILD_REDIS%msvs\Win32\Debug\Win32_Interop.lib %A5_REDISCLIENT%\lib\win32\%A5COMPILERVERSION%\Debug\

goto done
:nothing
echo "A5_REDISCLIENT needs to be defined"
:done
echo updatebin.bat complete
echo ======================