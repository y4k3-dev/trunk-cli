@echo off

set "SCRIPT_DIR=%~dp0"
lua "%SCRIPT_DIR%main.lua" %*
