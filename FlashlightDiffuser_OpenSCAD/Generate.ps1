#version 2022-11-26
$Script:ForceRegeneration = $true

$script:SourceFolder = (Get-Item $MyInvocation.MyCommand.Source).Directory
$script:ScadScriptPath = Join-Path $SourceFolder 'FlashlightDiffuser.scad'
$script:ScadExePath = 'C:\Program Files\OpenSCAD\openscad.exe'


$script:PrintAdjustment = 0.3

$VerbosePreference = 'SilentlyContinue'

$Script:Flashlight = 
@(
    @{Name = 'Lumintop_FW3A';       TorchDiameterTop = 25.5;   TorchDiameterLower = 0;   TorchOverlap = 5; Measurement = 'inner';},
    @{Name = 'Emisar_D4V2_Ti';      TorchDiameterTop = 28;     TorchDiameterLower = 0;   TorchOverlap = 6; Measurement = 'inner';},
    @{Name = 'Emisar_DW4';          TorchDiameterTop = 23;     TorchDiameterLower = 0;   TorchOverlap = 3; Measurement = 'outer';},
    @{Name = 'Noctigon_KR1_Copper'; TorchDiameterTop = 34;     TorchDiameterLower = 35;  TorchOverlap = 7; Measurement = 'inner';},
    @{Name = 'Noctigon_DM1_12';     TorchDiameterTop = 62.5;   TorchDiameterLower = 0;   TorchOverlap = 6; Measurement = 'inner';},
    @{Name = 'Convoy_S12';          TorchDiameterTop = 34.6;   TorchDiameterLower = 0;   TorchOverlap = 6; Measurement = 'inner';},
    @{Name = 'BlueFire_XML-L2';     TorchDiameterTop = 38.4;   TorchDiameterLower = 0;   TorchOverlap = 6; Measurement = 'inner';}
)

$Script:Diffuser= 
@(
    @{Name = 'ShortRound';},
    @{Name = 'ShortFlat';},
    @{Name = 'WandShortRound';},
    @{Name = 'WandShortFlat';},
    @{Name = 'WandLongRound';},
    @{Name = 'WandLongFlat';},
    @{Name = 'Globe';},
    @{Name = 'GlobeFlat';},
    @{Name = 'WandThinRound';},
    @{Name = 'WandThinFlat';},
    @{Name = 'TestFit';}
)

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

$Script:Flashlight | Sort-Object { Get-Random } | ForEach-Object {
    $_flashlight = $_
    Write-Host "Flashlight $($_flashlight.Name)"
$Script:Diffuser | Sort-Object { Get-Random } | ForEach-Object {
    $_diffuser = $_
    Write-Verbose "Diffuser $($_diffuser.Name)"

    $folder = Join-Path $script:SourceFolder "generated\$($_flashlight.Name)"

    $filename = "$($_flashlight.Name)-$($_diffuser.Name)"

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

    $cmdArgs = AddArgs $cmdArgs $_flashlight.TorchDiameterTop     " -D `"TorchDiameterTop=$($_flashlight.TorchDiameterTop)`""
    $cmdArgs = AddArgs $cmdArgs $_flashlight.TorchDiameterLower   " -D `"TorchDiameterLower=$($_flashlight.TorchDiameterLower)`""
    $cmdArgs = AddArgs $cmdArgs $_flashlight.TorchOverlap         " -D `"TorchOverlap=$($_flashlight.TorchOverlap)`""
    $cmdArgs = AddArgs $cmdArgs $_flashlight.Measurement          " -D `"Measurement=`"`"$($_flashlight.Measurement)`"`"`""
    $cmdArgs = AddArgs $cmdArgs $_diffuser.Name                   " -D `"DiffuserStyle=`"`"$($_diffuser.Name)`"`"`""

    $cmdArgs += " $($script:ScadScriptPath)"
    Write-Host  $cmdArgs
    $executionTime =  $cmdArgs | Measure-Command { Start-Process $script:ScadExePath -ArgumentList $_ -wait }
    
    Write-host "done $executionTime" 
}}