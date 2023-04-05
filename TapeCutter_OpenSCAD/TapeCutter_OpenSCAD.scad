// tape-cutter 
// ostat - 2023-03-01

/* [Common settings] */
// The width of the tape (Role Height)
TapeWidth = 100;

// The thicness if the role
RoleThickness = 50;

// The role inner Diameter
RoleInnerDiameter = 80;

//Thickness of the cutter walls
Wallthickness = 2;

/* [Teeth] */
// The style of the teeth
TeethStyle = "teeth"; //[teeth: All teeth, hybrid: Teeth with smooth edge, edge: Smooth edge, blade: Blade insert]

//Size of the teath. Default is Wallthickness*2
TeethSize = 0;

// Raise the teeth 
TeethBaseLength = 0; 

// Sharpen the teeth
SharpenTeeth = "up"; //[no, down, up]

// Raise the at an angle
TeethAngle = 30;

// Thickness of the blade
BladeThickness = 0.5;

// Thickness of the teeth. Default is wallthickness
TeethThickness = 0;


/* [Extra settings] */
//How rounded the corners should be. Default is Wallthickness.
FilletRadius = 0;

//Size of the opening to insert the role. Default is RoleThickness*2/3.
Opening = 0;

//Show much of the tape should the cutter cover, in deg. Default, aims for an inside length fo 25mm.
SliceAngle = 0;

//Amount of clearance applied to TapeWidth and RoleThickness.
Clearance = 1;

/* [Hidden] */
fudgeFactor = 0.015;
rotatefudgeFactor = 1;
targetLength = 15;
$fn=120;

//Apply Clearance
_tapeWidth = TapeWidth + Clearance;
_roleThickness = RoleThickness + Clearance;

//Apply defaults
_opening = Opening > 0 ? Opening : _roleThickness*1/2;
_filletRadius = FilletRadius > 0 ? FilletRadius : Wallthickness/2;
_teethSize = TeethSize > 0 ? TeethSize : Wallthickness*2;
_teethBaseLength = TeethAngle > 0 && TeethBaseLength < 2 ? 2 : TeethBaseLength;
_sliceAngle = SliceAngle > 0 ? SliceAngle : acos((targetLength^2-2*((RoleInnerDiameter/2)^2))/(-2*(RoleInnerDiameter/2)^2));
_teethThickness = TeethThickness > 0 ? TeethThickness : TeethStyle == "blade" ? Wallthickness * 1.5 : Wallthickness;
  
difference(){
  union(){
    //outer sized
    extrude(RoleInnerDiameter/2, _sliceAngle)
    translate([_filletRadius,0,0])
    RoundedSquare(_tapeWidth+Wallthickness*2, _roleThickness+Wallthickness*2, _filletRadius+Wallthickness);
    
    translate([RoleInnerDiameter/2+_roleThickness,0,0])
    Teeth(
      teethSize = _teethSize, 
      style = TeethStyle, 
      baseLength = _teethBaseLength,
      angle = TeethAngle,
      sharpen = SharpenTeeth,
      wallthickness = _teethThickness,
      tapeWidth = _tapeWidth,
      filletRadius = _filletRadius,
      bladeThickness = BladeThickness);
  }

  //cutout spape
  rotate([0,0,-rotatefudgeFactor/2])
  extrude(RoleInnerDiameter/2, _sliceAngle+rotatefudgeFactor)
  translate([_filletRadius,0,0])
  union(){
    RoundedSquare(_tapeWidth, _roleThickness, _filletRadius);
    translate([(_roleThickness-_opening)/2-_filletRadius,-Wallthickness*2,0])
    RoundedSquare(Wallthickness*2, _opening, 0);
  }
}

module Teeth(
  teethSize, 
  style, 
  baseLength,
  angle,
  sharpen,
  wallthickness,
  tapeWidth,
  filletRadius,
  bladeThickness)
{
  teethDiag = teethSize*sqrt(2);
  flatHeight = (tapeWidth-filletRadius*2);
  teethCount = floor(flatHeight/teethDiag);
  teethSpacing = ((flatHeight-teethDiag)/(teethCount));
  echo (flatHeight = flatHeight, teetDiag = teethSize*sqrt(2), teethCount=teethCount, teethSpacing = teethSpacing);
  bladeThickness = 0.5;
  bladeDepth = baseLength;
  
  rotate([0, 0,angle])
  translate([0,-baseLength,0])
  difference(){
    union(){
      for(i=[0:teethCount])
      {
        echo(i=i, pos = i*teethSpacing, end=i*teethSpacing+teethDiag);
        translate([0,0,i*teethSpacing])
        union(){
          rotate([45,0,0])
          cube([wallthickness,teethSize,teethSize]); 
          cube([wallthickness,baseLength*2,teethDiag]); 
        }
      }
      
      if(TeethStyle == "hybrid"){
        translate([0,-teethDiag/2,teethSpacing+teethDiag/2])
        cube([wallthickness,teethSize,teethSpacing*(teethCount-2)]); 
      }
      if(TeethStyle == "edge" || TeethStyle == "blade"){
        translate([0,-teethDiag/2,teethDiag/2])
        cube([wallthickness,teethSize,teethSpacing*(teethCount)]); 
      }
    }
   
    if(TeethStyle == "blade"){
      translate([(wallthickness-bladeThickness)/2,-(baseLength+1),-fudgeFactor])
      cube([bladeThickness, baseLength*2, flatHeight+fudgeFactor*2]); 
    }

    if(sharpen == "down" || TeethStyle == "blade"){
      teethAng = atan(wallthickness/(teethDiag/2));
      translate([wallthickness,0,0])
      rotate([0,0,-(90+teethAng)])
      cube([teethSize*2,teethSize,tapeWidth]); 
    }
    if(sharpen == "up" || TeethStyle == "blade"){
      teethAng = atan((teethDiag/2)/wallthickness);
      rotate([0,0,-(90+teethAng)])
      cube([teethSize*2,teethSize,tapeWidth]); 
    }
    
    if(angle == 0){
      translate([0,baseLength,0])
      cube([wallthickness*2,teethSize,tapeWidth]);    
    }
   }
}

module RoundedSquare(height, width, filletRadius){
  if(filletRadius == 0 )
  {
    square([width,height]);
  }
  else
  {
    _filletRadius = min(height/2, width/2,  filletRadius);
    circlepositionx = width - _filletRadius*2;
    circlepositiony = height - _filletRadius*2;

    circlepositions = 
      [[ circlepositionx, circlepositiony ],
      [ 0, circlepositiony ],
      [ circlepositionx, 0],
      [ 0,  0]];
    
    hull() for (i= [ 0 : len(circlepositions) - 1 ])
    {
      translate([circlepositions[i][0], circlepositions[i][1], 0])
        circle(r=_filletRadius);
    }
  }
}

module extrude(extrusiongRadius, extrusionAngle) {
  rotate_extrude(angle=extrusionAngle, convexity=10)
  translate([extrusiongRadius, 0, 0])
  children();   
}
// rotate as per a, v, but around point pt
module rotate_about_pt(z, y, pt) {
    translate(pt)
      rotate([0, y, z]) // CHANGE HERE
        translate(-pt)
          children();   
}