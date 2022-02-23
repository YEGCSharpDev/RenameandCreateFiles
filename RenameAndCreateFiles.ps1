#Add the folder from which directories will be taken
$SourceFolder = 'D:\EXAMPLE\Folder1'

#Add the folder to which directories will be created
$TargetFolder = 'D:\EXAMPLE\Folder3'



############################################################################################
#                         No Changes neccesary under this line                             #
############################################################################################

$FileList = Get-ChildItem $SourceFolder -Name -Directory

$NewFile = @()

Clear-Host

Write-Host $FileList.Count "Files will be queued for creation in " $TargetFolder -ForegroundColor Green -BackgroundColor Black

Write-Host "------------------------------------------------------------" -ForegroundColor White -BackgroundColor Black

write-host "`n"

for ($i = 0; $i -lt $FileList.Count; $i++) {
    
    $NewFileList = @()

    $NewFile = $FileList[$i] -split '_', 2

    Write-Host File Name Being Processed $NewFile -ForegroundColor Red -BackgroundColor Black

    Write-Host "------------------------------------------------------------" -ForegroundColor White -BackgroundColor Black

    $First, $rest = $NewFile

    $NewFileList += $rest | Sort-Object 

    for ($j = 0; $j -lt $NewFileList.Count; $j++) {

        $path = $TargetFolder + '\' + $NewFileList[$j] + '_' + $First

        If (!(test-path $path)) {
            Write-Host Folder being Created [$path] -ForegroundColor Cyan -BackgroundColor Black
            write-host "`n"
            New-Item -ItemType Directory -Force -Path $path
        }

        else {

            Write-Host Folder [$path] already present, item skipped -ForegroundColor DarkCyan -BackgroundColor Black
            write-host "`n"
            
        }

        
    }
    

}
