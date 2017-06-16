$TargetVHD = "D:\Client.vhdx"
$VHDPassword = Read-Host "Please input the VHD Password" -AsSecureString

Mount-DiskImage -ImagePath $TargetVHD -StorageType VHDX
$DriverLetter = ((Get-DiskImage $TargetVHD | Get-Disk | Get-Partition) | where PartitionNumber -eq 2).DriveLetter
Unlock-BitLocker -MountPoint ${DriverLetter} -Password $VHDPassword
