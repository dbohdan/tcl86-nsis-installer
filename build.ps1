Function Join-Lines
{
    [system.String]::Join("`n", @($input))
}

Function Reverse
{
    $arr = @($input)
    [array]::Reverse($arr)
    $arr
}

Function Make-RelativeToInstDir
{
    @($input) | Resolve-Path -Relative | % { "$_".Replace(".\", "`$INSTDIR\") }
}

Set-Location Tcl86/
$dirs = Get-ChildItem . -Recurse -Directory | Make-RelativeToInstDir
$files = Get-ChildItem . -Recurse -File | Make-RelativeToInstDir
Set-Location ../

$dir_commands = $dirs | % { "  CreateDirectory ""$_""" } | Join-Lines
$file_commands = `
    $files `
    | % { "  File ""/oname=$_"" ""$($_.Replace("`$INSTDIR", "Tcl86"))""" } `
    | Join-Lines
$delete_commands = $files | % { "  Delete ""$_""" } | Join-Lines
$rmdir_commands = $dirs | Reverse | % { "  RMDir ""$_""" } | Join-Lines

(Get-Content installer.nsi.in).`
    Replace('CREATE_LIST', $dir_commands + "`n" + $file_commands).`
    Replace('DELETE_LIST', $delete_commands + "`n" + $rmdir_commands) `
| Set-Content installer.nsi

& 'C:\Program Files (x86)\NSIS\Bin\makensis.exe' installer.nsi
