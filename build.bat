:: name of mod, case-sensitive
set mod_cs=Remove PContent

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

set year=2026
set copyright=CC-BY-SA %year%
set author=Johannes Förstner
set title=%mod_cs%

:: param
set mode=%1
echo %mode%

:: build resource files - enchantments
:: standard
call :build_enchantments loa LoA
:: release
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  call :build_enchantments loa LoA
  call :build_enchantments vanilla Vanilla
  call :build_enchantments all All
)
endlocal

:: build resource files - equipments
:: loa equipments
call :build_equipments_loa "amr" "armor"
call :build_equipments_loa "wpn" "weapons"
call :build_equipments_loa "spl" "spells"
call :build_equipments_loa "set" "set items"
:: vanilla equipments
call :build_equipments_vanilla "amr" "armor"
call :build_equipments_vanilla "wpn" "weapons"
call :build_equipments_vanilla "spl" "spells"
call :build_equipments_vanilla "trs" "misc"

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

exit /b %errorlevel%


:: Subroutines

:: build enchantments file
:build_enchantments
  set infix=%~1
  set name=%~2
  echo build_enchantments %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /S pcontent-%infix%.gas
  pushd "%tmp%\Bits\world\contentdb"
  ren pcontent-%infix%.gas pcontent.gas
  popd
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - %name% enchantments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build loa equipments file
:build_equipments_loa
  set infix=%~1
  set name=%~2
  echo build_equipments_loa %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S "dsx_%infix%_*.gas"
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA equipments - %name%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build vanilla equipments file
:build_equipments_vanilla
  set infix=%~1
  set name=%~2
  echo build_equipments_vanilla %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S "%infix%_*.gas" /xf dsx_*.gas
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - Vanilla equipments - %name%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0
