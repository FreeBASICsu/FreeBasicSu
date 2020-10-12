rem %1 dir
rem %2 archive
rem %3 file
pushd %1
"%ProgramFiles%\7-Zip\7z.exe" a %2 %3 -mx9
popd