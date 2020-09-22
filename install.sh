printf "Start of Script File \n" > DotfilesLog.txt

printf $"$PWD =  {$PWD} \n" >> DotfilesLog.txt
## copy git files to Codespace Project Home directory

cp ~/dotfiles/.gitignore $PWD
cp ~/dotfiles/.gitconfig $PWD

printf "End of Script File \n" >> DotfilesLog.txt
