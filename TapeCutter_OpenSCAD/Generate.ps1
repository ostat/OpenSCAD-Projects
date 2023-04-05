#version 2022-11-26
$Script:ForceRegeneration = $false

$script:SourceFolder = (Get-Item $MyInvocation.MyCommand.Source).Directory
$script:ScadScriptPath = Join-Path $SourceFolder 'TapeCutter_OpenSCAD.scad'
$script:ScadExePath = 'C:\Program Files\OpenSCAD\openscad.exe'

$VerbosePreference = 'SilentlyContinue'

$script:inchmm = 25.4

$Script:RoleInnerDiameter = (40, 80)
$Script:TapeWidth = @(
    @{System = 'imperial';   Name = '0.5in';          Diameter = 0.5       },
    @{System = 'imperial';   Name = '1in';            Diameter = 1       },
    @{System = 'imperial';   Name = '1.25in';         Diameter = 1.25    },
    @{System = 'imperial';   Name = '1.5in';          Diameter = 1.5     },
    @{System = 'imperial';   Name = '2in';            Diameter = 2       },
    @{System = 'imperial';   Name = '2.5in';          Diameter = 2.5     }
    )
$Script:RoleThickness = ( 10,15,20,25,30)
$Script:TeethStyle= ('teeth', 'edge', 'hybrid', 'blade')
$Script:TeethAngle = (0, 45)
$Script:SharpenTeeth= ('Down')


function CreateFolderIfNeeded([string] $path) {

    if(!(Test-Path -LiteralPath $path))
    {
        New-Item $path -ItemType Directory
    }
}

Function IIF{
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline)]
    [bool]$If,
    $Right, 
    $Wrong)
    if ($If) { return $Right } else { return $Wrong }
}

Function AppendIf{
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline)]
    [string]$string = '', 
    [string]$value, 
    [string]$seperater = '_')

    if([string]::IsNullOrEmpty($string)){
        return $value
    }
    if (![string]::IsNullOrEmpty($value)) { 
        return "$string$seperater$value"
    }
    return $string
}

Function AddArgs($cmdArgs, $value, $argValue) {
    if (![string]::IsNullOrEmpty($value)) { 
        $cmdArgs += $argValue
    }
    return $cmdArgs
}

$Script:RoleInnerDiameter | Sort-Object { Get-Random } | ForEach-Object {
    $_roleInnerDiameter = $_
    Write-Host "RoleInnerDiameter $($_roleInnerDiameter)"
$Script:TapeWidth | Sort-Object { Get-Random } | ForEach-Object {
    $_tapeWidth = $_
    Write-Verbose "TapeWidth $($_tapeWidth.Name)"
$Script:RoleThickness | Sort-Object { Get-Random } | ForEach-Object {
    $_roleThickness = $_
    Write-Verbose "RoleThickness $($_roleThickness)"
$Script:TeethStyle | Sort-Object { Get-Random } | ForEach-Object {
    $_teethStyle = $_
    Write-Verbose "TeethStyle $($_teethStyle)"
$Script:SharpenTeeth | Sort-Object { Get-Random } | ForEach-Object {
    $_sharpenTeeth = $_
    Write-Verbose "SharpenTeeth $($_sharpenTeeth)"
$Script:TeethAngle | Sort-Object { Get-Random } | ForEach-Object {
    $_teethAngle = $_
    Write-Verbose "TeethAngle $($_teethAngle)"
    if ($_TeethStyle -eq 'blade' -and $_teethAngle -eq 0){
        return
    }

    $_teethBaseLength = IIF ($_TeethStyle -eq 'blade') 4 0;
    if ($_TeethStyle -eq 'blade' -and $_teethAngle -eq 0){
        return
    }

    if($_tapeWidth['System'] -ieq 'imperial')
    {
        $_width = $_tapeWidth['Diameter'] * $script:inchmm
        $_display = "$($_width)mm($($_tapeWidth['Name']))"
    }
    else
    {
        $_width = $_tapeWidth['Diameter']
        $_display = "$($_width)mm"
    }

    $folder = Join-Path $script:SourceFolder "generated\diameter$($_roleInnerDiameter)_wide$($_display)"
    $filename = "d$($_roleInnerDiameter)_w$($_display)_t$($_roleThickness)-$($_teethStyle)-$($_teethAngle)deg"

    CreateFolderIfNeeded $folder
   
    $target = Join-Path $folder "$($filename).stl"
    if((Test-Path $target) -and !$Script:ForceRegeneration)
    {
        Write-Verbose "Skipping exising file $($filename)"
        return 
    }

    Write-Host "Generating $($_adapter.Scenario) adapter $($target)"

    #invoke openscad
    $cmdArgs = ""
    $cmdArgs = "-o `"$($target)`""

    $cmdArgs = AddArgs $cmdArgs $_roleInnerDiameter     " -D `"RoleInnerDiameter=$($_roleInnerDiameter)`""
    $cmdArgs = AddArgs $cmdArgs $_tapeWidth             " -D `"TapeWidth=$($_width)`""
    $cmdArgs = AddArgs $cmdArgs $_roleThickness         " -D `"RoleThickness=$($_roleThickness)`""
    $cmdArgs = AddArgs $cmdArgs $_teethBaseLength       " -D `"TeethBaseLength=$($_teethBaseLength)`""
    $cmdArgs = AddArgs $cmdArgs $_teethAngle            " -D `"TeethAngle=$($_teethAngle)`""
    $cmdArgs = AddArgs $cmdArgs $_teethStyle            " -D `"TeethStyle=`"`"$($_teethStyle)`"`"`""
    $cmdArgs = AddArgs $cmdArgs $_sharpenTeeth          " -D `"SharpenTeeth=`"`"$($_sharpenTeeth.ToLower())`"`"`""

    $cmdArgs += " $($script:ScadScriptPath)"
    Write-Host  $cmdArgs
    $executionTime =  $cmdArgs | Measure-Command { Start-Process $script:ScadExePath -ArgumentList $_ -wait }
    
    Write-host "done $executionTime" 
}}}}}}