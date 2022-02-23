# RenameandCreateFiles
PowerShell Script to take directories from a folder, create them in a new folder with rearranged names

## What can the script do?

Directories in the Source folder will be picked up, if they have an Underscore in their name, the first set of characters before the first underscore will be rearranged to the end and they will be created in target directory. 

If the folder is already present it will be skipped. 

If the folder does not have an underscore in its name, the folder will be skipped as well.