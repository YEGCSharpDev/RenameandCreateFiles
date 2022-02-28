#Add the folder to which directories will be created
$TargetFolder = 'D:\BulkRenamer'

$FolderList = Get-ChildItem $TargetFolder -Name

$SubFolders = @('XRD','SEM','EDX','GDOES','IV');

function CreateSubDirectory {
    param ($pathSuffix)

    $path = $TargetFolder +'\' + $FolderList[$i] +'\'+ $pathSuffix;

    If (!(test-path $path)) 
    {
        New-Item -ItemType Directory -Force -Path $path
    }
}

for ($i = 0; $i -lt $FolderList.Count; $i++) {

    for ($j = 0; $j -lt $SubFolders.Count; $j++) {

        CreateSubDirectory $SubFolders[$j];
        
    }
    
}