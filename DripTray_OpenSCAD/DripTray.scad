//////////////////////////
// Customizer Settings: //
//////////////////////////
/* [Cubby] */
Section="all"; // ["all":All, "top":Top, "bottom":Bottom]
Shape="circle"; //["rectangle": Rectangle, "circle":Circle]
//Cubby Width (mm)
Width=100;
//Cubby Depth (mm). 
Depth=75;

/* [beams] */
//Spacing of beams (mm)
Spacing=10;
//Number of beams, overrides spacing
BeamsCount=0;
//Height of main beams (mm). Does NOT include feet, lips, or tails
Height=10; // /0.1
//Thickness of beams (mm)
Thickness=2;  // 0.1

/* [cross beams] */
//Height of cross beams (mm). Default if 0, Beam Height *3/4
CrossbeamHeight=0; 
//Thickness of all parts (mm). Default if 0, Beam Thickness
CrossbeamThickness=0;  
//CrossBeam position on beams, 0 start 1 end.
CrossbeamPositions = [0.2, 0.8]; //0-1 0.05

/* [tray] */
//thickness of drip tray
TrayThickness = 2;// 0.1
//Angle of drip tray (Will need to adjust based on depth)
TrayAngle = 2; // 0.1

/* [feet] */
//Do you want feet on the bottom? 
Feet="y"; // ["y":Yes, "n":No]
//Interval of feet on beams, feet are always on first and last beam? 
FeetInterval = 1;
//feet diameter default if 0 is height (mm)
FeetSize=0; // 0.1
//feet thickness, default if 0 is Beam Thickness (mm)
FeetThickness=0; // 0.1
//Feet position on beams, 0 start 1 end.
FeetPosition = [0.05, 0.95]; //0.05
/* [tail] */
//Do you want a tail sticking up on the rear? 
Tail="n"; // ["y":Yes, "n":No]
/* [lip] */
//Do you want a lip sticking up on the front? 
Lip="n"; // ["y":Yes, "n":No]    

//////////////////////
// Static Settings: //
//////////////////////
$fn=60;

_feetSize = FeetSize > 0 ? FeetSize : Height;
_feetThickness = FeetThickness >0 ? FeetThickness : Thickness;
_crossbeamHeight = CrossbeamHeight > 0 ? CrossbeamHeight : 3*Height/4;
_crossbeamThickness = CrossbeamThickness > 0 ? CrossbeamThickness : Thickness;
_trayThickness = TrayThickness > 0 ? TrayThickness : Thickness;


difference(){
  intersection(){
    union(){
      color ("darkblue")
      //Base beams
      if(Shape=="rectangle"){
        Base(
          Depth,  
          Height,
          Width,
          Thickness,
          Spacing,
          BeamsCount,
          Feet,
          _feetSize,
          _feetThickness,
          FeetInterval,
          FeetPosition,
          Lip,
          Tail);
      }
      if(Shape=="circle"){
        RoundBase(
          Depth,  
          Height,
          Width,
          Thickness,
          Spacing,
          BeamsCount,
          Feet,
          _feetSize,
          _feetThickness,
          FeetInterval,
          FeetPosition,
          Lip,
          Tail);
      }
      
      
      
      difference() {
        union() {
          for (i=[0:len(CrossbeamPositions)-1]) {
            pos = Height/2+ (Depth - Height-_crossbeamThickness)*CrossbeamPositions[i];
            translate([pos,0,Height/2-_crossbeamHeight]) 
              CrossBeam(Width, _crossbeamHeight, _crossbeamThickness);   
          }  
        }
      
        if (Section=="top") {
          // add gap under crossbeams, when adding a shelf to allow water to drain.
          DripTray(Height, _trayThickness+Thickness, Depth, Width, TrayAngle);
        }
      }

      
      if (Section=="bottom") {
        color ("green")
        intersection() {
          DripTray(Height, _trayThickness, Depth, Width, TrayAngle);
          Beam(Depth, Height, Width, "y", _feetSize, _feetThickness, FeetPosition, "y", "y"); 
        } 
      }
    };

    if (Section=="bottom") {
      color ("green")
      DripTrayCutaway(Height, _trayThickness, Depth, Width, TrayAngle);
    }
  }  
  if (Section=="top") 
  {
    DripTrayCutaway(Height, _trayThickness, Depth, Width, TrayAngle);
  }
}

module RoundBase(
  depth,  
  height,
  width,
  thickness,
  spacing,
  beamsCount,
  feet,
  feetSize,
  feetThickness,
  feetInterval,
  feetPosition,
  lip,
  tail,
  crossbeamHeight,
  crossbeamThickness,
){

  echo(width= width, thickness = thickness, beamsCount =beamsCount);
  for(n = [0 : 1 : beamsCount-1]) 
  {
    echo(count = count, n = n);
    //rotate(180/n*n)
    Beam(depth, height, thickness, feet, feetSize, feetThickness, feetPosition, lip, tail);
  }
}

module Base(
  depth,  
  height,
  width,
  thickness,
  spacing,
  beamsCount,
  feet,
  feetSize,
  feetThickness,
  feetInterval,
  feetPosition,
  lip,
  tail,
  crossbeamHeight,
  crossbeamThickness,
){
  indentation = beamsCount > 0 ? 0 : ((width-thickness)%spacing)/2;
  _spacing = beamsCount > 0 ? (Width - Thickness) / (BeamsCount - 1) : spacing;
  count = beamsCount > 0 ? beamsCount : ceil((width-thickness)/_spacing);
  echo(width= width, thickness = thickness, count =count, spacing = spacing, total = count*spacing, remainder = (width-thickness)%spacing);

  for(n = [0 : 1 : count -1]) 
  {
    _n = indentation + n * _spacing;
    _feet = (n==0 || n==count || n%feetInterval == 0) ? feet : "n";
    echo(count = count, n = n, _n = _n ,_feet);

    //base beams
    translate([0,_n,0]) 
      Beam(depth, height, thickness, _feet, feetSize, feetThickness, feetPosition, lip, tail);
  }
}

module Beam(
  depth,  
  height,
  thickness,
  feet,
  feetSize,
  feetThickness,
  feetPosition,
  lip,
  tail) 
{
  translate([height/2,0,0]) 
  union()
  {
    rotate([-90,0,0]) 
    hull(){
      translate([depth-height,0,0]) 
        cylinder(d=height,h=thickness);   
      cylinder(d=height,h=thickness);
    }
    if (feet=="y") {
      for (i=[0:len(feetPosition)-1]) {
        pos = feetSize/2+ (depth - feetSize-height)*feetPosition[i];
        echo(i = i, feetpos = feetPosition[i], pos = pos, depth=depth,feetSize=feetSize);
        translate([pos,(thickness-feetThickness)/2,-height/2])
          rotate([-90,0,0])
          cylinder(d=feetSize,h=feetThickness);
      }
    }
    
    if (lip=="y") {
      translate([depth-3*height/4,0,height/2])
        rotate([-90,0,0]) 
        cylinder(r=height/4,h=thickness);
      translate([depth-height,0,0]) 
        cube([height/2,thickness,height/2]);
    }
    
    if (tail=="y") { 
      translate([-height/4,0,3*height/4]) 
        rotate([-90,0,0]) 
        cylinder(r=height/4,h=thickness);    
      translate([-height/2,0,0]) 
        cube([height/2,thickness,3*height/4]);
    }
  }
}

module CrossBeam(
  width,  
  height,
  thickness) 
{
  cube([thickness,width,height]);
}

module DripTray(
  height,
  thickness,
  depth,
  width,
  angle)
{
    translate([height,0,0])
    rotate([0,angle,0]) 
    cube([depth,width,thickness]);    
}

module DripTrayCutaway(
  height,
  thickness,
  depth,
  width,
  angle)
{
  translate([height,0,0])
  rotate([0,angle,0]) 
  translate([0,0,-(height*2-thickness)])
  cube([depth,width,height*2]);    
}