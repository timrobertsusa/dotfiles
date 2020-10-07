printf "Start of Script File \n" > ~/dotfiles/DotfilesLog.txt 

printf "PWD= $PWD \n" >> ~/dotfiles/DotfilesLog.txt 

printf "DOGVAR= $DOGVAR \n">> ~/dotfiles/DotfilesLog.txt 

printf "\n Local Workspace = $localWorkspaceFolder \n" >> ~/dotfiles/DotfilesLog.txt 
printf "\n Container Workspace = $containerWorkspaceFolder \n" >> ~/dotfiles/DotfilesLog.txt 


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

pwsh powerlineinstaller.ps1

mkdir -p /root/.config/powershell/ && cp ~/dotfiles/mypwshprofile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1

printf "\n pwsh powerline complete \n" >> ~/dotfiles/DotfilesLog.txt 
