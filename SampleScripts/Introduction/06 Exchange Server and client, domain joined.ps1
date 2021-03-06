#The is almost the same like '05 SQL Server and client, domain joined.ps1' but installs an Exchange 2013 server instead
#of a SQL Server.

New-LabDefinition -Name 'Lab1' -DefaultVirtualizationEngine HyperV

$labSources = Get-LabSourcesLocation
Add-LabIsoImageDefinition -Name SQLServer2014 -Path $labSources\ISOs\en_sql_server_2014_standard_edition_x64_dvd_3932034.iso

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'contoso.com'
    'Add-LabMachineDefinition:Memory' = 1GB
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2012 R2 SERVERDATACENTER'
}

Add-LabMachineDefinition -Name Lab1DC1 -Roles RootDC

Add-LabMachineDefinition -Name Lab1EX1 -Roles Exchange2013 -Memory 4GB

Add-LabMachineDefinition -Name Lab1Client1 -OperatingSystem 'Windows 10 Pro'

Install-Lab

Show-LabInstallationTime