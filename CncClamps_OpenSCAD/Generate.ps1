#version 2023-04-24
$Script:ForceRegeneration = $false

$script:SourceFolder = (Get-Item $MyInvocation.MyCommand.Source).Directory
$script:ScadScriptPath = Join-Path $SourceFolder 'CNCClamps.scad'
$script:ScadExePath = 'C:\Program Files\OpenSCAD\openscad.exe'

$VerbosePreference = 'SilentlyContinue'

$Script:BoltSize = 
@(
    @{Name = 'M4'; Size = 4.5;},
    @{Name = 'M5'; Size = 5.5;},
    @{Name = 'M6'; Size = 6.5;}
)

$Script:Lenghts= 
@(
    @{Length = 25;},
    @{Length = 50;},
    @{Length = 75;},
    @{Length = 100;},
    @{Length = 125;},
    @{Length = 150;},
    @{Length = 200;}
)

$Script:Heights= 
@(
    @{Height = 3;},
    @{Height = 6;},
    @{Height = 8;},
    @{Height = 12;},
    @{Height = 15;},
    @{Height = 20;},
    @{Height = 25;},
    @{Height = 30;},
    @{Height = 35;},
    @{Height = 40;},
    @{Height = 45;},
    @{Height = 50;},
    @{Height = 60;},
    @{Height = 70;},
    @{Height = 80;},
    @{Height = 90;},
    @{Height = 100;}
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

$Script:Lenghts | Sort-Object { Get-Random } | ForEach-Object {
    $_boltCutoutLength = $_.Length
    Write-Host "Length $($_boltCutoutLength)"
$Script:Heights | Sort-Object { Get-Random } | ForEach-Object {
    $_frontHeight = $_.Height
    Write-Host "Height $($_frontHeight)"
$Script:BoltSize | Sort-Object { Get-Random } | ForEach-Object {
    $_boltSize = $_
    $_boltCutoutDiameter = $_boltSize.Size

    Write-Verbose "Bolt $($_boltSize.Name)"

    $_boltClearance = 0
    $_wallThickness = 3
    $_baseThickness = 0
    $_baseRelief = 0

    $_frontRadius = 4
    $_frontLipLength = 3
    $_frontReliefAngle = 1
    $_frontWallThickness = 0

    $_backRadius = 0
    $_backLipLength = 0
    
    $folder = Join-Path $script:SourceFolder "generated\$($_boltSize.Name)"

    $filename = "Lenth$($_boltCutoutLength)mm-Height$($_frontHeight)mm-Bolt$($_boltSize.Name)"

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

    #$cmdArgs = AddArgs $cmdArgs $_diffuser.Name                   " -D `"DiffuserStyle=`"`"$($_diffuser.Name)`"`"`""
    $cmdArgs = AddArgs $cmdArgs $_boltCutoutLength               " -D `"Bolt_Cutout_Length=$($_boltCutoutLength)`""
    $cmdArgs = AddArgs $cmdArgs $_boltCutoutDiameter             " -D `"Bolt_Cutout_Diameter=$($_boltCutoutDiameter)`""
    $cmdArgs = AddArgs $cmdArgs $_boltClearance                  " -D `"Bolt_Clearance=$($_boltClearance)`""
    $cmdArgs = AddArgs $cmdArgs $_wallThickness                  " -D `"Wall_Thickness=$($_wallThickness)`""
    $cmdArgs = AddArgs $cmdArgs $_baseThickness                  " -D `"Base_Thickness=$($_baseThickness)`""
    $cmdArgs = AddArgs $cmdArgs $_baseRelief                     " -D `"Base_Relief=$($_baseRelief)`""

    $cmdArgs = AddArgs $cmdArgs $_frontRadius                    " -D `"Front_Radius=$($_frontRadius)`""
    $cmdArgs = AddArgs $cmdArgs $_frontLipLength                 " -D `"Front_Lip_Length=$($_frontLipLength)`""
    $cmdArgs = AddArgs $cmdArgs $_frontHeight                    " -D `"Front_Height=$($_frontHeight)`""
    $cmdArgs = AddArgs $cmdArgs $_frontReliefAngle               " -D `"Front_Relief_Angle=$($_frontReliefAngle)`""
    $cmdArgs = AddArgs $cmdArgs $_frontWallThickness             " -D `"Front_Wall_Thickness=$($_frontWallThickness)`""
    $cmdArgs = AddArgs $cmdArgs $_supportLength                  " -D `"Support_Length=$($_supportLength)`""
    $cmdArgs = AddArgs $cmdArgs $_supportHeight                  " -D `"Support_Height=$($_supportHeight)`""

    $cmdArgs = AddArgs $cmdArgs $_backRadius                     " -D `"Back_Radius=$($_backRadius)`""
    $cmdArgs = AddArgs $cmdArgs $_backLipLength                  " -D `"Back_Lip_Length=$($_backLipLength)`""

    $cmdArgs += " $($script:ScadScriptPath)"
    Write-Host  $cmdArgs
    $executionTime =  $cmdArgs | Measure-Command { Start-Process $script:ScadExePath -ArgumentList $_ -wait }
    
    Write-host "done $executionTime" 
}}}