$workingFolder = (Split-Path -Parent $PSCommandPath)
$outputFolder = Join-Path $workingFolder 'generated\images'
$script:ScadExePath = 'C:\Program Files\OpenSCAD\openscad.exe'
$script:ImageMagickPath = 'C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe'
  
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


Class Scenario{
    [string]$ScenarioName
    [string]$ScenarioNameFriendly
    [int]$Count
}


function Create-ImageForDemo(
    [string]$ScadScriptPath,
    [string]$outputFolder,
    [bool]$SetFilePath = $true
    ){
    $Scenarios = New-Object System.Collections.ArrayList

    $scriptFile =  Get-Item -LiteralPath $scadScriptPath
    
    $demoName = $scriptFile.BaseName.Replace('_demo','')

    foreach($line in Get-Content $scadScriptPath) {
        if($line -match 'scenario\s?==\s?"(?<secenario>.*?)"\s?\?\s?\[\["(?<secenariofriendly>.*?)"'){
        
            $scenario = New-Object Scenario
            $scenario.ScenarioName = $Matches['secenario']
            $scenario.ScenarioNameFriendly = $Matches['secenariofriendly']
            $scenario.Count = 1

            $Scenarios.Add($scenario) | Out-Null
        }
    }

    $options = @('png','text');
    $Scenarios | ForEach-Object {
      $scenario = $_
      $options | ForEach-Object {
        $option = $_
        $showtext = ($option -eq 'text')
        $scenarioName =  "$($scenario.ScenarioName)_$($option)"
        $scenarioOutputFolder = Join-Path $outputFolder "$($option)"
        
        CreateFolderIfNeeded $scenarioOutputFolder

        #invoke openscad
        $cmdArgs = "" 
        
        $target = Join-Path $scenarioOutputFolder "$($scenario.ScenarioName).$((IIF -If ($option -eq 'stl')  -Right 'stl' -Wrong 'png'))"
        if($SetFilePath)
        {
            $cmdArgs = "-o `"$($target)`""
            #--camera=translatex,y,z,rotx,y,z,dist
        }

        $cmdArgs = $cmdArgs += " -D `"scenario=`"`"$($scenario.ScenarioName)`"`"`""
        $cmdArgs = $cmdArgs += " -D `"showtext=$($showtext.ToString().tolower())`""
        $cmdArgs = $cmdArgs += " --colorscheme Tomorrow"
        $cmdArgs = $cmdArgs += " --imgsize 4096,3072"#" --imgsize 1024,768"4096,3072
        
        $cmdArgs += " $($scadScriptPath)"
        Write-Host  $cmdArgs
        $executionTime =  $cmdArgs | Measure-Command { Start-Process $script:ScadExePath -ArgumentList $_ -wait }
      }
    }
}

Create-ImageForDemo -ScadScriptPath  (Join-Path $workingFolder 'toy_stack_octahedron_demo.scad') -outputFolder $outputFolder -SetFilePath $true