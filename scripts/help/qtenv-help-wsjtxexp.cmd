﻿@ECHO off
CLS
ECHO. -----------------------------------------------------------------
ECHO.  Help Build WSJTX EXP Branch
ECHO. -----------------------------------------------------------------
ECHO.
ECHO   Usage: build-wsjtxexp ^( target ^)
ECHO.
ECHO   The WSJTX Exp brach is an experimental branch for adding new modes
ECHO   and testing new features. Not all functins or features may be
ECHO   fully functional or even included in any of the final releases.
ECHO.
ECHO   There are several targets available for WSJTX EXP, the main being
ECHO   [ rinstall ] or [ dinstall]. After checkout-wsjtxexp, use one of
ECHO   the following:
ECHO.
ECHO   RELEASE TARGETS
ECHO    rconfig ...: Configure Release Tree
ECHO    rinstall ..: Build Release Insatall
ECHO    package ...: Build Win32 Installer
ECHO.
ECHO   DEBUG TARGETS
ECHO    dconfig ...: Configure Debug Tree
ECHO    dinstall ..: Build Debug Insatall
ECHO. 
ECHO.  NOTES
ECHO   [1] Debug targets ^*do not^* have a package targets
ECHO.
ECHO   ^* Relist Help-Menu, type .....: help-qtenv
ECHO   ^* Return to Main-Menu, type ..: main-menu 
GOTO EOF

:EOF
EXIT /B 0
