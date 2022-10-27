# vmparser

Quick bash script to convert copy/paste of ASC VM Legacy Properties page to useful output for case notes.

## How to Use

1. Login to ASC 
2. Copy/Paste the content from the VM Properties page into a text file in your fav distro.
3. Run the following command:

``` 
parser.sh <file_name> 
```

## Notes

* Data Conversion Failure
  * You may have a case where data conversion fails. This could be due to extra charactors from the copy paste, specific versions of Streamline Editor(sed) no reading `\t` as Tab, or some other unknown error. 
  * You have 3 options lined out below to resolve this issue:

1. Streamline Editor, if in Linux
   * ` sed -i 's/\t/,/g' <name_of_file>`
2. Notepad ++
   1. Select View
   2. Show Symbols
   3. Show Characters 
   4. Highlight(Select) a Red Arrow
   5. Select Find and Replace (Ctl+f)
   6. In replace field enter a comma `,`
   7. Save file as a CSV
3. Microsoft Excel
   1. Create a new Blank Work Book
   2. Paste the ASC VM Proerties content into Excel
   3. Export the file (File -> Export -> Change File Type)
   4. Select Comma Seperated Values (`.csv`)
   5. Save the file with chosen file name. 

If anyone has any questions or comments, please reach out.

## TODO
- [x] Create Bash script
- [x] Create Readme
- [ ] Create Python Script
- [ ] Create Powershell Script 
