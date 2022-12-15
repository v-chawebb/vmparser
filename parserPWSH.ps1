function Parse-Properties { 
param(
    [Parameter (Mandatory = $True, Position=0)] [String]$FilePath
)

$fileData = Get-Content -Path $filePath

$data = @()


ForEach($line in $fileData) {


    if ($line -ilike "*Resource Uri*") { 
        $data += $Line                
        $URI = $line.Split('/')
        $data += "Subscription "+$URI[2]
        $data += "Resource Group "+$URI[4]
        $data += "VM Name "+$URI[8]
        }
    if ($line -ilike "*Deployment Model*") { $data += $line}
    if ($line -ilike "State*") { $data += $line}
    if ($line -ilike "*Power State") { $data += $line}
    if ($line -ilike "*Region*") { $data += $line}
    if ($line -match "OS`t") { $data += $line}
    if ($line -ilike "*OS Created From*") { $data += $line}
    if ($line -ilike "*Size*") { $data += $line}
    if ($line -ilike "*Guest Agent Status*") { $data += $line}
    if ($line -ilike "*Guest Agent Message*") { $data += $line}
    if ($line -ilike "*Guest Agent Version*") { $data += $line}


}

$data

}

$data = $null
$URI = $null
Parse-Properties ./props.txt