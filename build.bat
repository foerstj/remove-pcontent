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
:: loa enchantments
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /S pcontent-loa.gas
pushd "%tmp%\Bits\world\contentdb"
ren pcontent-loa.gas pcontent.gas
popd
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA enchantments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause
:: vanilla enchantments
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /S pcontent-vanilla.gas
  pushd "%tmp%\Bits\world\contentdb"
  ren pcontent-vanilla.gas pcontent.gas
  popd
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - Vanilla enchantments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if !errorlevel! neq 0 pause
)
endlocal
:: all enchantments
setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /S pcontent-all.gas
  pushd "%tmp%\Bits\world\contentdb"
  ren pcontent-all.gas pcontent.gas
  popd
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - All enchantments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if !errorlevel! neq 0 pause
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
