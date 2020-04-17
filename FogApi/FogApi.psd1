#
# Module manifest for module 'FogApi'
#
# Generated by: JJ Fullmer
#
# Generated on: 4/17/2020
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'FogApi.psm1'

# Version number of this module.
ModuleVersion = '2002.2.0.7'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '7aa922fa-bb4f-46a0-a478-684e9535c65d'

# Author of this module
Author = 'JJ Fullmer'

# Company or vendor of this module
CompanyName = 'FOG Project'

# Copyright statement for this module
Copyright = '(c) 2018 JJ Fullmer. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This module is used to easily run Fog API commands on your fogserver from a powershell console or script.
    This essentially gives you a crossplatform commandline interface for fog tasks and makes many things easier to automate.

    The documentation is hosted on readthedocs at https://fogapi.readthedocs.io/en/latest/

    To install this module you need at least powershell v3, was created with 5.1 and intended to be cross platform compatible with powershell v6
    To Install this module follow these steps
    * Easiest method: Install from PSGallery https://www.powershellgallery.com/packages/FogApi Install-Module -name fogApi

    * Manual Method:
    * download the zip of this repo and extract it
        * Or clone the repo using your favorite git tool, you just need the FogApi Folder this readme is in
    * Copy the FogApi folder this Readme file is in to...
        * For Windows Powershell v3-v5.1
            * C:\Program Files\WindowsPowershell\Modules
        * For Windows Powershell v6+
            * C:\Program Files\PowerShell\6-preview\Modules
                * 6-Preview may need to be replaced with whatever current version you have installed
        * For Linux Powershell v6+
            * /opt/microsoft/powershell/6.1.0-preview.2/Modules
                * 6.1.0-preview.2 may need to be replaced with whatever current version you have installed
        * For Mac Powershell v6+ (untested)
            * /usr/local/microsoft/powershell/6.x/Modules
                * 6.x should be replaced with whatever most current version you are using
                * I haven''''t tested this on a mac, the module folder may be somewhere else
                this is based on where it is in other powershell 6 installs
    * Open a powershell command prompt (I always run as admin, unsure if it''''s required)
    * Run Import-Module FogApi

    The module is now installed.
    You can use Set-fogserverSettings to set your fogserver hostname and api keys.
    The first time you try to run a command the settings.json file will automatically open
    in notepad on windows, nano on linux, or TextEdit on Mac
    You can also open the settings.json file and edit it manually before running your first command.
    The default settings are explanations of where to find the proper settings since json can''''t have comments

    Once the settings are set you can have a jolly good time utilzing the fog documentation
    found here https://news.fogproject.org/simplified-api-documentation/ that was used to model the parameters

    i.e.

    Get-FogObject has a type param that validates to object, objectactivetasktype, and search as those are the options given in the documentation.
    Each of those types validates (which means autocompletion) to the core types listed in the documentation.
    So if you typed in Get-FogObject -Type object -Object  h and then started hitting tab, it would loop through the possible core objects you can get from the api that start with ''''h'''' such as history, host, etc.

    Unless you filter a get with a json body it will return all the results into a powershell object. That object is easy to work with to create other commands. Note: Full Pipeline support will come at a later time
     i.e.

     hosts = Get-FogObject -Type Object -CoreObject Host # calls get on http://fog-server/fog/host to list all hosts
     Now you can search all your hosts for the one or ones you''''re looking for with powershell
     maybe you want to find all the hosts with ''''IT'''' in the name  (note ''''?'''' is an alias for Where-Object)
    ITHosts = hosts.hosts | ? name -match ''''IT'''';

    Now maybe you want to change the image all of these computers use to one named ''''IT-Image''''
    You can edit the object in powershell with a foreach-object (''''%'''' is an alias for foreach-object)
    updatedITHosts = ITHosts | % { _.imagename = ''''IT-image''''}

    Then you need to convert that object to json and pass each object into one api call at a time. Which sounds complicated, but it''''s not, it''''s as easy as
    
    updateITHosts | % {
        jsonData = _ | ConvertTo-Json;
        Update-FogObject -Type object -CoreObject host -objectID _.id -jsonData jsonData;
        #successful result of updated objects properties
        #or any error messages will output to screen for each object
    }
    

    This is just one small example of the limitless things you can do with the api and powershell objects.

    see also the fogforum thread for the module https://forums.fogproject.org/topic/12026/powershell-api-module/2
    '

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Add-FogHostMac', 'Approve-FogPendingMac', 'Deny-FogPendingMac', 
               'Get-FogActiveTasks', 'Get-FogAssociatedSnapins', 'Get-FogGroup', 
               'Get-FogHost', 'Get-FogHosts', 'Get-FogInventory', 'Get-FogLog', 
               'Get-FogObject', 'Get-FogServerSettings', 'Get-FogSnapins', 
               'Get-PendingMacsForHost', 'Install-FogService', 'Invoke-FogApi', 
               'New-FogObject', 'Remove-FogObject', 'Remove-UsbMac', 
               'Reset-HostEncryption', 'Set-FogInventory', 'Set-FogServerSettings', 
               'Set-FogSnapins', 'Start-FogSnapins', 'Update-FogObject'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
# CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Remove-FogMac', 'Add-FogSnapins', 'Set-FogObject'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    #Title of this module
    Title = 'FogApi'

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'fog','fogapi','imaging','provisioning','fogproject'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/FOGProject/fog-community-scripts/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/darksidemilk/FogApi'

        # A URL to an icon representing this module.
        IconUri = 'https://fogproject.org/images/favicon.ico'

        # ReleaseNotes of this module
        ReleaseNotes = '
# 2002.2.0.7

	Test build

# 2002.2.0.6

	Test build

# 2002.2.0.5

    Test build

# 2002.2.0.4
    
    Test build

# 1904.0.0.1
        
    CF-249 #comment fixed add-fogmac property within the function and incrementing the version to match release time

# 1903.0.0.23

    Added functions for reseting host encryption as well as adding, approving, and removing macs from hosts

# 1903.0.0.22

    Move from dev to production

# 1903.0.0.21

    update documentation

# 1903.0.0.20

    dont addition on random variable create a list

# 1903.0.0.19

    update get settings with same new paths silly

# 1903.0.0.18

    force the copy

# 1903.0.0.17

    change where settings file is stored to an appdata folder of the current user

# 1903.0.0.16

    CF-214 #comment updated remove-usbmac to utilize internal functions better and made it more universal, may want to later update it to remove all matching associations of the list, but would also need a function for getting the mac list of the host it is connected to when it is the primary which sounds cumbersome at the moment

# 1903.0.0.15

    Updated documentation for each function and moved the dynamic param functions to be private functions as they dont need to be visible in the user interface

# 1903.0.0.14

    CF-223 #comment use internal commands more

# 1903.0.0.13

    CF-223 #comment use internal commands more

# 1903.0.0.12

    dont try to add snapins that are already there

# 1903.0.0.11

    CF-223 #comment updated set-fogsnapins to use internal new-fogobject function and had it only attempt to set snapins that actually exist

# 1903.0.0.10

    CF-223 #comment updated set-fogsnapins to use internal new-fogobject function and had it only attempt to set snapins that actually exist

# 1903.0.0.9

    CF-223 #comment made setting list of fogsnapins more universal and not reference object it doesnt need to

# 1903.0.0.8

    CF-223 #comment made setting list of fogsnapins more universal and not reference object it doesnt need to

# 1903.0.0.7

    CF-223 #comment fix uuid get in getfoghost

# 1903.0.0.6

    CF-223 #comment fix uuid get and set for when uuid isnt correct in first spot

# 1903.0.0.5

    CF-129 #comment updated fogapi syntax issues fixes

# 1903.0.0.4

    CF-206 #comment quick syntax updates on fogapi dev module

# 1903.0.0.3

    CF-205 #comment updated fogapi dev module with functions for snapins

# 1903.0.0.2

    CF-204 #comment updated various functions to utilize new structure

# 1903.0.0.1

    CF-204 #comment updated fogapi module to new module structure

# 1902.0.0.3

    CF-218 #comment default invoke-api to use GET method

# 1902.0.0.2

    CF-218 #comment need to have published the dev fogapi module without dev prefix

# 1902.0.0.1

    CF-124 #comment added get-foglog function for easier opening of a dynamic fog log when debugging provisioning and imaging issues

# 1.8.1.6

    testing fix for update error looks like the wrong dynamic parameter was being referenced where the uri was being built

# 1.8.1.5

    CF-120 #comment adding fogapi dev module to repo

# 1.8.1.4

    fix possible exit

# 1.8.1.3

    use spacebar and use ea 0 on get-service check for install-fogservice

# 1.8.1.2

    finish end block on install-fogservice

# 1.8.1.1

    updated install-fogservice to try using the smart installer if the msi doesn	 work

# 1.8.0.5

    fixes to settings setter and remove double slashes

# 1.8.0.4

    fixes to settings setter and remove double slashes

# 1.8.0.3

    fixes to settings setter

# 1.8.0.2

    fixes to settings setter

# 1.8.0.1

    updated settings setter and getter to store settings json in fog service folder

# 1.7.1.1

    try catch block to attempt iwr when irm fails

# 1.7.0.5

    update update function to allow specifying uri path manually

# 1.7.0.4

    update update function to allow specifying uri path manually

# 1.7
    
    Fixed parantheses typo in get-fogobject and signing issue

# 1.5
    
    Added dynamic parameters and added get-fogserversettings and set-fogserversettings to allow for setting the api keys and server name in the shell
    One known issue with the dynamic parameters is that they currently are not working as expected with positions they have to be named. i.e. you have to say get-fogobject -type object -coreObject host not Get-FogObject object host like I wanted
    The auto complete works for positional parameters but the function doesn''''t seem to think there''''s a vaule for the parameter.

# 1.3

    added better description and links, fixed new-fogobject to not require id for all POST api calls as there is no id yet for new items.

# 1.2
    
    Initial Release, allow for easy manipulation of FOG server data with powershell objects
'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://fogapi.readthedocs.io/en/latest/'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

