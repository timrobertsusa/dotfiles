printf "Start of Script File \n" > DotfilesLog.txt

printf "PWD= " {$PWD} "\n" >> DotfilesLog.txt


## copy git files to Codespace Project Home directory
##  cp ~/dotfiles/.gitignore $PWD
##  cp ~/dotfiles/.gitconfig $PWD


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

printf "End of Script File \n" >> DotfilesLog.txt
