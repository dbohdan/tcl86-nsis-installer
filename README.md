This repository contains a script to build an [NSIS](https://en.wikipedia.org/wiki/Nullsoft_Scriptable_Install_System) installer for the programming language [Tcl](https://en.wikipedia.org/wiki/Tcl). Its intended use is to repackage the contents of [Ashok P. Nadkarni](https://tcl.wiki/9887)'s [Windows installer packages](https://bintray.com/apnadkarni/tcl-binaries/tcl-binaries-windows) for Tcl 8.6, which currently install on Windows 7 or later, in a form compatible with Windows XP and Vista.

Prebuilt installers are available for download from the Releases page.

Warning: This is a one-day project written primarily to learn PowerShell and to brush up on the Windows environment. Do not expect it to be maintained.

# Build process

The following process has been tested on Windows 10 Pro.

1. Install [NSIS 3.x](http://nsis.sourceforge.net/) to `C:\Program Files (x86)`.
2. Clone this repository.
3. Install the 32-bit version of APN's Tcl distribution then copy the resulting folder (e.g, `C:\Tcl86`) to `<this repository>\Tcl86`.
4. Run `build.ps1` with PowerShell.

# Installation

Run the installer as a regular user to install Tcl just for yourself (in the `%LOCALAPPDATA%` folder by default). Administrators are given the choice to install Tcl just for themselves or for all users (in `C:\Tcl86` by default).
