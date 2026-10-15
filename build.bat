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

:: build resource file - enchantments
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb" "%tmp%\Bits\world\contentdb" /S pcontent-loa.gas
pushd "%tmp%\Bits\world\contentdb"
ren pcontent-loa.gas pcontent.gas
popd
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs% - LoA enchantments.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: build resource files - equipments
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
