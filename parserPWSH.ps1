<#PSScriptInfo

.VERSION 1.0

.AUTHOR v-kclayson

.COMPANYNAME Microsoft 

#>

param(
    [Parameter (Mandatory = $True, Position=0)] [String]$FilePath
)

$fileData = Get-Content -Path $filePath

$data = @()

$templateSwitch = Read-Host "Would you like just the VM (P)roperties or  a full (T)emplate? [P/t] (Properties Only Defaut)"
# If they want Template, build out data object
If ($templateSwitch -ilike 't*') {

    $SRNum= Read-Host "What is the SR Number?"
    $data += "SR NUMBER: $SRNum `n`n"

    $timeZone = Read-Host "What is the time zone of Customer?"
    $data += "TIMEZONE: $timeZone `n`n"

    $contactMethod = Read-Host "What is the prefered contact method?"
    $data += "PREFERED CONTACT METHOD `n"
    
    if ( $contactMethod -ilike "E*" ) {
        $emailAdd = Read-Host "What's the contact email address?"
        $data += "EMAIL: $emailAdd `n`n"
    }
    elseif ( $contactMethod -ilike "P*") { 

        $phoneNum = Read-Host "What's the Cx's phone number?"
        $data += "PHONE: $phoneNum  `n`n"
    }

    $issue = Read-Host "What is the Cx's issue?"
    $data += "ISSUE: `n`n $issue  `n`n"
    
    $problemStatement = Read-Host "What is the Problem Statement"
    $data += "PROBLEM STATEMENT: `n`n $issue `n`n"

    $data += "ENVIRONMENT: `n`n "
}

# Pull from text File
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


# Continue building the Template"
if ($templateSwitch -ilike 't*') {
    
    $busImpact = Read-Host "What is the business impact?"
    $data += "`n`n`n BUSINESS IMPACT `n`n $busImpact`n`n" 

    $curState = Read-Host "What is the current state of the case?" 
    $data += "CURRENT STATE: `n`n $curState`n`n"

    $data += "HISTORY`n`n"
    $data += "ACTION PLAN`n`n"
    $data += "Next Steps for Micorosft`n`n"
    $data += "Next Steps for Customer`n`n"
}


Clear-Host
$data
