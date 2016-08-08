This repository contains a script to repackage the contents of [Ashok P. Nadkarni](https://tcl.wiki/9887)'s new [Windows installer packages](https://bintray.com/apnadkarni/tcl-binaries/tcl-binaries-windows) for Tcl 8.6, which currently install on Windows 7 or later, in an NSIS installer that works on Windows XP and Vista.

# Build process

The following has been tested on Windows 10 Pro.

1. Install [NSIS 3.x](http://nsis.sourceforge.net/) to `C:\Program Files (x86)`.
2. Clone this repostiory.
3. Install APN's Tcl distribution then copy the resulting directory (e.g, `C:\Tcl86`) to `<this repository>\Tcl86`.
4. Run `build.ps1` with PowerShell.
