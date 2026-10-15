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
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S dsx_amr_*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA equipments - armor.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S dsx_wpn_*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA equipments - weapons.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S dsx_spl_*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA equipments - spells.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S dsx_set_*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA equipments - set items.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
:: vanilla equipments
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /S /xf dsx_*.gas
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - Vanilla equipments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

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
