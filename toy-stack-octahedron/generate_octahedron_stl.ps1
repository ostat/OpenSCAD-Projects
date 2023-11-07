$workingFolder = (Split-Path -Parent $PSCommandPath)
$outputFolder = Join-Path $workingFolder 'generated\render'
$script:ScadExePath = 'C:\Program Files\OpenSCAD\openscad.exe'
  
Function AddArgs($cmdArgs, $value, $argValue) {
    if (![string]::IsNullOrEmpty($value)) { 
        $cmdArgs += $argValue
    }
    return $cmdArgs
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

Function AppendIfTrue{
[CmdletBinding()]
Param(
    [Parameter(ValueFromPipeline)]
    [string]$string = '', 
    [bool]$condition = $true,
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

function CreateFolderIfNeeded([string] $path) {

    if(!(Test-Path -LiteralPath $path))
    {
        New-Item $path -ItemType Directory
    }
}


function Create-Octahedron(
    [string]$ScadScriptPath,
    [string]$outputFolder,
    [bool]$SetFilePath = $true
    ){
    $Scenarios = @(
        @{size=1;hollow=$true},
        @{size=1;hollow=$false},
        @{size=2;hollow=$false},
        @{size=3;hollow=$false},
        @{size=4;hollow=$false},
        @{size=5;hollow=$false},
        @{size=6;hollow=$false},
        @{size=7;hollow=$false},
        @{size=8;hollow=$false},
        @{size=9;hollow=$false})
    
    CreateFolderIfNeeded $outputFolder
 
    $options = @('stl');
    $Scenarios | ForEach-Object {
        $size = $_.size
        $hollow = $_.hollow
        
        #invoke openscad
        $cmdArgs = "" 
        
        $target = Join-Path $outputFolder "octahedron_$($size)$((IIF -If $hollow  -Right '_hollow' -Wrong '')).stl"
        if($SetFilePath)
        {
            $cmdArgs = "-o `"$($target)`""
        }

        $cmdArgs = $cmdArgs += " -D `"Size=$($size)`""
        $cmdArgs = $cmdArgs += " -D `"Draw_Shape=true`""
        $cmdArgs = $cmdArgs += " -D `"Hollow=$($hollow.ToString().tolower())`""
        
        $cmdArgs += " $($scadScriptPath)"
        Write-Host  $cmdArgs
        $executionTime =  $cmdArgs | Measure-Command { Start-Process $script:ScadExePath -ArgumentList $_ -wait }
    }
}

Create-Octahedron -ScadScriptPath  (Join-Path $workingFolder 'toy_stack_octahedron.scad') -outputFolder $outputFolder -SetFilePath $true