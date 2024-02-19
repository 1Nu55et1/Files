@echo off

rem Define la ruta de la carpeta autoload de Neovim
set "nvimAutoloadPath=%LOCALAPPDATA%\nvim\autoload"

rem Verifica si la carpeta autoload existe, si no, créala
if not exist "%nvimAutoloadPath%" (
    mkdir "%nvimAutoloadPath%"
)

rem Define la ruta del archivo plug.vim de Vim-plug
set "vimPlugPath=%nvimAutoloadPath%\plug.vim"

rem Verifica si Vim-plug ya está instalado
if not exist "%vimPlugPath%" (
    rem Descarga plug.vim desde GitHub
    bitsadmin.exe /transfer "DescargaVimPlug" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim "%vimPlugPath%"

    rem Verifica si la descarga fue exitosa
    if %errorlevel% equ 0 (
        echo Vim-plug instalado correctamente en %vimPlugPath%
    ) else (
        echo Error al descargar Vim-plug. Por favor, instálalo manualmente desde https://github.com/junegunn/vim-plug
    )
) else (
    echo Vim-plug ya está instalado en %vimPlugPath%
)

pause
