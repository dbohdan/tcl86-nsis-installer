Function Make-PrefixedList([string]$prefix, [string[]]$list)
{
    "  $prefix """ + [system.String]::Join("""`n  $prefix """, $list) + """"
}

$files = Get-ChildItem Tcl86 -Recurse -File | Resolve-Path -Relative | % { "$_" }
$file_list = Make-PrefixedList "File" $files
$delete_list = Make-PrefixedList "Delete" $files
(Get-Content installer.nsi.in).Replace('FILE_LIST', $file_list).Replace('DELETE_LIST', $delete_list) | Set-Content installer.nsi
& 'C:\Program Files (x86)\NSIS\Bin\makensis.exe' installer.nsi