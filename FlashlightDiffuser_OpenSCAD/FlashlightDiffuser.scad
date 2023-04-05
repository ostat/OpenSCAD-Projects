// flashlight diffuser
// version 2023-02-19

/* [flashlight] */
TorchDiameter = 15; //0.01
//Section of diffuser that fits on the torch
TorchOverlap= 0; //0.01
//taper on the torch overlap, helps get a good fit. mm along the overlap.
TorchTaper= 0; //0.01

/* [Diffuser] */
DiffuserStyle = "ShortRound"; // [ShortRound: Short Rounded, ShortFlat: Short Flat, WandRound: Wand Rounded, WandFlat: Wand flat, Globe: Light globe Shaped, GlobeFlat: Flat Light globe Shaped, WandThinRound: Thin Rounded Wand, WandThinFlat: Thin Flat Wand,custom: Custom settings, TestFit: Minimal print for fit test]

//Thickness of the funnel walls
WallThickness = 1.5; // 0.1

/* [Custom Diffuser] */
//Length of the diffuser, Default is the difference of opening and tip, to give 45deg walls.
DiffuserLength = 0;
//Length of the diffuser, Default is the difference double the Flashlight diameter.
DiffuserEndDiameter = 0;

//Thickness of diffuser end, Default is wall thickness.
DiffuserEndThickness = 0;
//Thickness of diffuser end, Default is wall thickness.
DiffuserEndShape = "flat"; // [flat: Flat, rounded: Rounded]

/* [Internal stop] */
//Length of internal stop, default is wall thickness
StopLength = 1;
//Thickness of the stop, default is wall thickness
StopThickness = 0;

/* [Hidden] */
fudgeFactor = 0.015;
//Detail
$fn=120;

module end_of_customizer_opts() {}

diffuserEndDiameter = (DiffuserStyle == "ShortRound" || DiffuserStyle == "ShortFlat") ? TorchDiameter *1.25
                    : (DiffuserStyle == "WandRound" || DiffuserStyle == "WandFlat") ? TorchDiameter
                    : (DiffuserStyle == "WandThinRound" || DiffuserStyle == "WandThinFlat" ) ? TorchDiameter / 2
                    : (DiffuserStyle == "Globe" || DiffuserStyle == "GlobeFlat") ? TorchDiameter *2
                    : DiffuserEndDiameter > 0 ? DiffuserEndDiameter : TorchDiameter *2;

diffuserLength = (DiffuserStyle == "ShortRound" || DiffuserStyle == "ShortFlat") ? (diffuserEndDiameter-TorchDiameter)*1.5
               : (DiffuserStyle == "WandRound" || DiffuserStyle == "WandFlat" || DiffuserStyle == "WandThinRound" || DiffuserStyle == "WandThinFlat" ) ? TorchDiameter * 2
               : (DiffuserStyle == "Globe" || DiffuserStyle == "GlobeFlat") ? TorchDiameter
               : DiffuserLength > 0 ? DiffuserLength : (diffuserEndDiameter-TorchDiameter)/1.5;

diffuserEndShape  = (DiffuserStyle == "ShortRound" || DiffuserStyle == "WandRound" ||  DiffuserStyle == "WandThinRound" || DiffuserStyle == "Globe") ? "rounded"
                  : (DiffuserStyle == "ShortFlat" || DiffuserStyle == "WandFlat" || DiffuserStyle == "WandThinFlat" || DiffuserStyle == "GlobeFlat") ? "flat"
                  : DiffuserEndShape;

//Apply defaults
connector1Length = TorchOverlap > 0 ? TorchOverlap : TorchDiameter / 3;
endCapThickness = DiffuserEndThickness > 0 ? DiffuserEndThickness : WallThickness;
stopThickness = StopThickness > 0 ? StopThickness: WallThickness/2;

FlashlightDiffuser(
  connectorMeasurement = "inner",
  connectorDiameter = TorchDiameter,
  connectorWallThickness = WallThickness,
  connectorLength = connector1Length,
  connectorTaper= TorchTaper*-1,
  connectorStopThickness = stopThickness,
  connectorStopLength = StopLength,
  connectorStopSymmetrical = 1,

  diffuserLength = diffuserLength,
  
  diffuserCapMeasurement = "inner",
  diffuserCapDiameter = diffuserEndDiameter,
  diffuserCapThickness = endCapThickness,
  diffuserWallThickness = WallThickness,
  diffuserCapShape = diffuserEndShape,
  fitTest = DiffuserStyle == "TestFit");
  
 
 
module FlashlightDiffuser(
    connectorWallThickness = 2,
    connectorMeasurement= "inner",
    connectorDiameter = 0,
    connectorLength = 0,
    connectorTaper = 0,
    connectorStopThickness = 0,
    connectorStopLength = 0,
    connectorStopSymmetrical = 0,
   
    diffuserLength = 0,
    
    diffuserWallThickness = 2,
    diffuserCapMeasurement = "inner",
    diffuserCapDiameter = 0,
    diffuserCapThickness = 0,     
    diffuserCapShape = "flat",
    fitTest = false  
){
    end1InnerDiameter = connectorMeasurement == "inner" ? connectorDiameter : connectorDiameter - connectorWallThickness * 2;
    end2InnerDiameter = diffuserCapMeasurement == "inner" ? diffuserCapDiameter : diffuserCapDiameter - diffuserWallThickness * 2;
 
    //Apply taper, from small to big
    end1InnerStartDiameter = end1InnerDiameter - connectorTaper / 2;
    end1OuterStartDiameter = end1InnerStartDiameter + connectorWallThickness*2;
    end1InnerEndDiameter = end1InnerDiameter + connectorTaper / 2;
    end1OuterEndDiameter = end1InnerEndDiameter + connectorWallThickness*2;
    
    //Apply taper, from big to small
    end2OuterDiameter = end2InnerDiameter + connectorWallThickness*2;
  
  echo(end1InnerStartDiameter = end1InnerStartDiameter, end1OuterStartDiameter = end1OuterStartDiameter, end1InnerEndDiameter = end1InnerEndDiameter, end1OuterEndDiameter= end1OuterEndDiameter);
  
    color("LightPink") 
    //Create the start connector
    HoseConnector(
      innerStartDiameter = end1InnerStartDiameter,
      innerEndDiameter = end1InnerEndDiameter,
      connectorMeasurement = connectorMeasurement,
      length = connectorLength,
      wallThickness = connectorWallThickness,
      stopLength = connectorStopLength,
      stopWidth = connectorStopThickness,
      stopSymmetrical = connectorStopSymmetrical,
      endCapDiameter = 0,
      endCapThickness = 0
    );

    if(!fitTest)
    {
      //Total length of connector 1
      connectorTotalLength = connectorLength + connectorStopLength;
     
      // transitionLength is not wanted for sweep
      _transitionLength = diffuserLength == 0? abs(end1OuterEndDiameter - end2OuterStartDiameter)/2 : diffuserLength;

      hoseSpacer = diffuserWallThickness;
      //Tapered section position to the end of the bent pipe
      color("SpringGreen")
      translate([0, 0, connectorTotalLength])
      Pipe(
        diameter1 = end1InnerEndDiameter, 
        diameter2 = end2InnerDiameter, 
        length = _transitionLength, 
        wallThickness1 = connectorWallThickness, 
        wallThickness2 = connectorWallThickness);   

      color("SkyBlue") 
        translate([0,0,_transitionLength+connectorTotalLength])
        union(){
          if(diffuserEndShape == "flat")
          {
          translate([0,0,diffuserWallThickness])
            mirror ([0,0,1])
            HoseConnector(
              innerStartDiameter = end2InnerDiameter,
              innerEndDiameter = end2InnerDiameter,
              connectorMeasurement = diffuserCapMeasurement,
              length = diffuserCapThickness,
              wallThickness = diffuserWallThickness,
              endCapDiameter = 0,
              endCapThickness = diffuserCapThickness
            );      
          }
          
          if(diffuserEndShape == "rounded")
          {
              difference(){
              sphere(d = end2OuterDiameter);
              sphere(d = end2InnerDiameter);
              translate([0,0,-end2OuterDiameter/2])
              cube(end2OuterDiameter,true);
          }
        }
      }
    }
  }

//diameter1: Inner start diameter.
//diameter2: Inner end diameter.
//length: pipe length
//wallThickness1 Thickness of the walls at the start
//wallThickness2 Thickness of the walls at the end
//zPosition: Start Z position.
module Pipe(
    diameter1, 
    diameter2, 
    length, 
    wallThickness1, 
    wallThickness2, 
    zPosition = 0,
    xOffset = 0,
    yOffset = 0)
{
  difference () 
  {
    //outer cylinder
    translate([0,0,zPosition])
    hull()
    {
      cylinder(fudgeFactor, d=diameter1+2*wallThickness1);
      translate([xOffset,yOffset,length-fudgeFactor])
        cylinder(fudgeFactor, d=diameter2+2*wallThickness2);
    }
        
    //Inner cylinder to remove
    translate([0,0,zPosition-fudgeFactor])
    hull()
    {
      cylinder(fudgeFactor, d=diameter1);
      translate([xOffset,yOffset,length+2*fudgeFactor])
        cylinder(fudgeFactor, d=diameter2);
    }
  }
}

 
module HoseConnector(
    innerStartDiameter,
    innerEndDiameter,
    connectorMeasurement,
    length,
    wallThickness,
    stopLength = 0,
    stopWidth = 0,
    stopSymmetrical = 0,
    endCapDiameter = 0,
    endCapThickness = 0,
)
{
    union() {
      difference () 
      {
        union() {
          //outer cylinder
          translate([0,0,0])
          hull()
          {
            cylinder(fudgeFactor, d=innerStartDiameter+2*wallThickness);
            translate([0,0,length-fudgeFactor])
              cylinder(fudgeFactor, d=innerEndDiameter+2*wallThickness);
          }
        }    
        //Inner cylinder to remove
        translate([0,0,0-fudgeFactor])
        hull()
        {
          cylinder(fudgeFactor, d=innerStartDiameter);
          translate([0,0,length+2*fudgeFactor])
            cylinder(fudgeFactor, d=innerEndDiameter);
        }
      }
   
      // Create the end cap
    if(endCapThickness > 0)
    {
      difference () 
      {
        cylinder(endCapThickness, d=innerEndDiameter + wallThickness/2);
        translate([0,0,-fudgeFactor])
          cylinder(endCapThickness + fudgeFactor * 2, d=endCapDiameter);
      }
    }
      
    // Create the hose stop
    if(stopWidth > 0)
    {
          Stopper(
            diameter = innerEndDiameter,
            outer = connectorMeasurement == "outer",
            totalLength = stopLength,
            taper1 = stopSymmetrical == 0 ? 0.5 : 0.4,
            taper2 = stopSymmetrical == 0? 0 : 0.4,
            wallThickness = wallThickness,
            stopThickness = stopWidth,
            zPosition = length);
    }
  }
}

module StraightPipe(
  diameter, 
  length, 
  wallThickness, 
  zPosition = 0)
{
    Pipe (
        diameter1 = diameter,
        diameter2 = diameter,
        length = length,
        wallThickness1 = wallThickness,
        wallThickness2 = wallThickness,
        zPosition = zPosition);
}

module Stopper(
    diameter,
    outer,
    totalLength,
    taper1,
    taper2,
    wallThickness,
    stopThickness,
    zPosition = 0
)
{
  intersection()
  {
    flat = totalLength * (1 - taper1 - taper2);
    StraightPipe (
      diameter = outer ? diameter : diameter-stopThickness*2,
      length = totalLength,
      wallThickness = wallThickness + stopThickness,
      zPosition = zPosition);
      
      _diameter = outer ? diameter : diameter + wallThickness*2;
  
      //Bottom taper
      if(taper1 > 0)
      {
        taperLength1 = totalLength * taper1;
        zoffset1 = wallThickness*taperLength1/stopThickness;
        length1= (zoffset1 + totalLength);
        width1 = length1 * stopThickness / taperLength1;
        diameterstart1 = _diameter;
        diameterend1 = outer ? _diameter :_diameter - width1*2;
        Pipe (
          diameter1 = diameterstart1,
          diameter2 = diameterend1,
          length = length1,
          wallThickness1 = 0,
          wallThickness2 = width1,
          zPosition = zPosition-zoffset1);
      }
      
      //Top taper
      if(taper2 > 0)
      {
        taperLength2 = totalLength * taper2;
        zoffset2 = wallThickness * taperLength2 / stopThickness;
        length2 = (zoffset2 + totalLength);
        width2 = length2 * stopThickness / taperLength2;
        diameterstart2 = outer ? _diameter :_diameter - width2*2;
        diameterend2 = _diameter;
        Pipe (
          diameter1 = diameterstart2,
          diameter2 = diameterend2,
          length = length2,
          wallThickness1 = width2,
          wallThickness2 = 0,
          zPosition = zPosition);
        
      }
   }
}
