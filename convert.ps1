#Credits : Paul MURITH
#Last update 19/11/18

Import-Module 'C:\Program Files\Microsoft Virtual Machine Converter\MvmcCmdlet.psd1'
$VMWareDiskPath = "\\Select\Orginal\Folder\Path"
$PathtoVmwareDisk = (Get-ChildItem -Path $VMWareDiskPath -Filter "*.vmdk" -Recurse -Force -ErrorAction SilentlyContinue | Select-Object FullName)
$ExternalStorage = "C:\ClusteurStorage\Volume1" 

foreach ($data in $PathtoVmwareDisk)
{
    $DiskNameAndPath = $data.FullName
    ConvertTo-MvmcVirtualHardDisk -SourceLiteralPath $DiskNameAndPath -VhdType DynamicHardDisk -VhdFormat vhdx -destination $ExternalStorage
}
