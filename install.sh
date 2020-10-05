printf "Start of Script File \n" > DotfilesLog.txt

printf "PWD= $PWD \n" >> DotfilesLog.txt

printf "$DOGVAR \n">> DotfilesLog.txt

printf "Local Workspace = $localWorkspaceFolder \n" >> DotfilesLog.txt
printf "Container Workspace = $containerWorkspaceFolder \n" >> DotfilesLog.txt


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

pwsh ~/dotfiles/powerlineinstaller.ps1

mkdir -p /root/.config/powershell/ && cp ~/dotfiles/mypwshprofile.ps1 /root/.config/powershell/Microsoft.Powershell_profile.ps1 '
&& cp ~/dotfiles/mypwshprofile.ps1 /root/.config/powershell/profile.ps1

printf "End of Script File \n" >> DotfilesLog.txt
