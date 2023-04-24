/* [CNC hold down] */
// Length of bolt cutout (mm)
Bolt_Cutout_Length = 40;
// Diameter Length of bolt cutout (mm)
Bolt_Cutout_Diameter = 6;
// Clearance around the bolt head (mm), default = Bolt_Cutout_Diamater
Bolt_Clearance = 0;
// Thickness of the front and side walls (mm)
Wall_Thickness = 3;
//Thickness of the base(mm), Default = Wall_Thickness*2
Base_Thickness = 0;
// Back relief on base (mm), default = Wall_Thickness/2
Base_Relief = 0;

/* [Front Lip] */
// Radius of front lip (mm), default = Wall_Thickness
Front_Radius = 0;
// Length of front lip (mm), default = Front_Radius
Front_Lip_Length = 0;
// Height of front lip (mm), default = Front_Radius
Front_Height = 0;
// Relief on front (deg)
Front_Relief_Angle = 1;
//Front wall thickness (mm), default = Wall_Thickness
Front_Wall_Thickness = 0;
// The full height length (mm), default = half length
Support_Length = 0;
// The full Length height (mm) , default = quater height
Support_Height = 0;

/* [Back Lip] */
// Radius of back lip, default = Base_Thickness*3/4
Back_Radius = 0;
// Extend length of back lip
Back_Lip_Length = 0;

/* [Hidden] */
fudge = 0.01;
$fn = 60;

boltCutoutLength = Bolt_Cutout_Length;
boltCutoutDiameter = Bolt_Cutout_Diameter;
boltClearance = Bolt_Clearance;
wallThickness = Wall_Thickness;
frontWallThickness = Front_Wall_Thickness == 0 ? wallThickness : Front_Wall_Thickness;

boltReliefDiameter = boltClearance == 0 ? boltCutoutDiameter*3 : boltClearance*2 + boltCutoutDiameter;
baseLength = boltCutoutLength + boltReliefDiameter + frontWallThickness;
baseThickness = Base_Thickness ==0 ? wallThickness*2 : Base_Thickness;
baseRelief = Base_Relief == 0 ? baseThickness/4 : Base_Relief;
width = boltReliefDiameter + wallThickness * 2;

frontRadius = Front_Radius == 0 ? wallThickness : Front_Radius;
frontLipLength = Front_Lip_Length == 0 ? frontRadius : Front_Lip_Length;
frontReliefAngle = Front_Relief_Angle;
frontHeight = Front_Height < baseThickness/2 ? baseThickness/ 2 : Front_Height;
supportLength = Support_Length == 0 ? baseLength/2 :
                Support_Length > baseLength ? baseLength : Support_Length;
supportHeight = Support_Height == 0 ? frontHeight /4 :
                Support_Height > frontHeight ? frontHeight : Support_Height;

backRadius = Back_Radius == 0 ? baseThickness*3/4 : Back_Radius;
backLipLength = Back_Lip_Length;

difference() {
  union () {
    //base
    cube([width,  baseLength, baseThickness]);

    //Back lip
    intersection() {
      translate([fudge, -(backRadius+backLipLength), 0])
        cube([width + fudge * 2, backRadius+backLipLength, baseThickness ]);
      
      union () {
        translate([0, -backLipLength, baseThickness - backRadius])
          cube([width + fudge * 2, backLipLength, backRadius]);
         translate([0, -backLipLength, baseThickness - backRadius])
            rotate([0,90])
            cylinder(width,r = backRadius);
      }
    }
    
    //Front lip
    intersection() {
      translate([fudge, 0, 0])
        cube([width + fudge * 2, baseLength+Front_Lip_Length+frontRadius, frontHeight+frontRadius]);
      union(){
        hull() {
          //front lip
          translate([0, baseLength+Front_Lip_Length, frontHeight])
            rotate([0,90])
            cylinder(width,r = frontRadius);

          translate([0, baseLength, frontHeight])
            rotate([0,90])
            cylinder(width,r = frontRadius);
          
          // back height sholder 
          translate([0, baseLength - frontRadius - frontWallThickness, frontHeight-(frontRadius*1.1)])
            rotate([0,90])
            cylinder(width,r = frontRadius*2);
          
          translate([0, baseLength, baseThickness/2])
            rotate([0,90])
            cylinder(width,d = baseThickness);
          
          translate([0, baseLength - supportLength, baseThickness/2])
            rotate([0,90])
            cylinder(width,d = baseThickness);
        }
        
        hull() {
          // back length sholder 
          translate([0, baseLength - frontRadius*2, supportHeight])
            rotate([0,90])
            cylinder(width,r = frontRadius*2);
                  
          translate([0, 0, baseThickness/2])
            rotate([0,90])
            cylinder(width,d = baseThickness);
          
          translate([0, baseLength, baseThickness/2])
            rotate([0,90])
            cylinder(width,d = baseThickness);
        }
      }
    }
  }
  
  //Bolt cutout 
  translate([width/2, boltReliefDiameter/2, -fudge])
  hull(){
    cylinder(baseThickness*2 + fudge*2,d = boltCutoutDiameter);
    
    translate([0, boltCutoutLength, 0])
      cylinder(baseThickness*2 + fudge*2,d = boltCutoutDiameter);
  }
  
  //Bolt Clearance relief
  union(){
   translate([width/2, boltCutoutLength+boltReliefDiameter/2, baseThickness])
     cylinder(baseThickness+frontHeight,d = boltReliefDiameter);
    
    translate([wallThickness, 0, baseThickness])
      cube([boltReliefDiameter, boltCutoutLength+boltReliefDiameter/2, baseThickness+frontHeight]);
  }
  
  /*
  //base relief
  *rotate([1,0])
     translate([-fudge, 0, -baseThickness])
     cube([width + fudge*2, length+frontRadius+Front_Lip_Length, baseThickness]);
  */
  
  //base relief
  translate([-fudge, 0, 0])
    rotate([0,90])
    linear_extrude(width + fudge*2) {
      //Consider making this a more complex shape
      polygon([
        [0,0],
        [fudge,fudge],
        [fudge,baseLength+frontRadius+Front_Lip_Length],
        [-baseRelief,baseLength+frontRadius+Front_Lip_Length]]);
   }


  //front relief
  translate([-fudge, baseLength, -baseThickness])
    rotate_about_pt([frontReliefAngle*-1,0],[0,0,frontHeight+baseThickness])
     cube([width + fudge*2, baseLength, frontHeight+baseThickness]);

  /*
  //front relief
  *translate([-fudge, length, baseThickness+frontHeight-fudge])
    rotate([0,90])
    linear_extrude(width + fudge*2) {
      //Consider making this a more complex shape
      polygon([
        [0,0],
        [0,frontRadius+Front_Lip_Length],
        [frontHeight+fudge,frontRadius+Front_Lip_Length],
        [frontHeight+fudge,-frontRelief],
        ]);
     }
  */
  
  //back relief 
  translate([-fudge, -(backRadius+backLipLength+fudge), -fudge])
    cube([width + fudge*2, backRadius+backLipLength+fudge, baseThickness - backRadius+fudge]);
}

module Log(width, diameter) {
  rotate([0,90])
    cylinder(width,d = diameter);
}

module translate_yz(y, z) {
  translate([0,y,z])
    children();
}

// rotate as per a, v, but around point pt
module rotate_about_pt(r, pt) {
    translate(pt)
        rotate(r) // CHANGE HERE
            translate(-pt)
                children();
}