# vmparser
Quick bash script to convert copy/paste of ASC VM Properties page to useful output for case notes.

Login to ASC >> Copy/Paste the content from the VM Properties page into a text file in your fav distro.

The command is as follows

parser.sh <file_name>

******* If data conversion fails for some reason or you get wierd output, please refer to the instructions below on manual adjustment

Once the data is in place, run the following command to convert the data into a useable format

sed -i 's/\t/,/g' <name_of_file>

********** If you want to use the old method of data conversion please use the data below, otherwise use the information above ***********

Login to ASC >> Copy/Paste the content from the VM Properties page into Excel or Notepad++

To convert the web content into a usable format for the script do either of the following.

Notepad++

Select View >> Show Symbols >> Show All Characters
Select the red arrows (the hidden tabs that show when you set the option above)
CTRL+F
Select the replace tab at the top and set the replace with field to , (comma) and replace all.
Save file as <filename.csv>

The file would be ready.


Excel
New Blank Workbook
Paste the ASC VM Properties content into Excel
File >> Export >> Change File Type
Select .csv
Set filename to desired filename.

To use the script, place the formatted file into the home directory of the user being used to run with.

An example of how you might call the script via Ubuntu WSL2

./parser.sh <filename.csv>

If anyone has any questions or comments, please reach out.
