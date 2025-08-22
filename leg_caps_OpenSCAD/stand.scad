
hole_size = [21,31, 15];
open_back = false;
top_wall_thickness = 2;
bottom_wall_thickness = 15;
bottom_base_thickness = 30;

base_size = [hole_size.x+bottom_wall_thickness*2,hole_size.y+bottom_wall_thickness*(open_back ? 1 : 2),bottom_wall_thickness];
top_size = [hole_size.x+top_wall_thickness*2,hole_size.y+top_wall_thickness*(open_back ? 1 : 2),hole_size.z];

$fn=128;
ff=  0.001;
difference(){
  hull(){
    translate([0,open_back ? -top_wall_thickness/2 : 0,base_size.x])
    roundedCube(
      size=top_size, 
      topRadius=top_wall_thickness/4, 
      sideRadius=top_wall_thickness/4, 
      centerxy=true);

    translate([0, open_back ? -bottom_wall_thickness/2 : 0, 0])
    roundedCube(
      size=base_size, 
      topRadius=top_wall_thickness/4, 
      sideRadius=top_wall_thickness/4, 
      centerxy=true);
  }
 
  translate([-hole_size.x/2,-hole_size.y/2,base_size.x])
  chamfered_cube(
    size=open_back ? [hole_size.x,hole_size.y+top_wall_thickness*2,hole_size.z] : hole_size, 
    chamfer=top_wall_thickness/4,
    cornerRadius=top_wall_thickness/4);
}

// Creates a slot with a small champer for easy insertertion
//#slotCutout(100,20,40);
//width = width of slot
//depth = depth of slot
//height = height of slot
//chamfer = chamfer size
module chamfered_cube(size, chamfer = 1, cornerRadius = 0)
{
  assert(is_list(size) && len(size) == 3, "size should be a list of length 3");

  fudgeFactor = 0.01;
  chamfer = min(size.z, chamfer);
  union(){
    if(cornerRadius > 0){
        hull(){
          translate([cornerRadius,cornerRadius,0])
          cylinder(h = size.z, r=cornerRadius);
          translate([size.x-cornerRadius,cornerRadius,0])
          cylinder(h = size.z, r=cornerRadius);
          translate([cornerRadius,size.y-cornerRadius,0])
          cylinder(h = size.z, r=cornerRadius);
          translate([size.x-cornerRadius,size.y-cornerRadius,0])
          cylinder(h = size.z, r=cornerRadius);
        }
    } else {
      translate([0,0,0])
        cube([size.x, size.y, size.z]);
    }
    
    if(chamfer > 0)
       translate([0,0,size.z+fudgeFactor-chamfer-cornerRadius])
       chamferedRectangleTop(size=size, chamfer=chamfer, cornerRadius=cornerRadius);
  }
}

module chamferedRectangleTop(size, chamfer, cornerRadius=1){
  fudgeFactor = 0.01;
  
  chamferFn = cornerRadius > 0 ? $fn : 4;

  champherExtention = cornerRadius > 0 ? 0 
    : (min(size.x,size.y,size.z)-chamfer)/4;
    
  //when the chamferFn value is 4 we need to chan the formula as the radius is corner to corner not edge to edge.
  conesizeTop = chamfer+cornerRadius+champherExtention;
  conesizeBottom = conesizeTop>size.z ? conesizeTop-size.z: 0;
  

  //if cornerRadius = 0, we can further increase the height of the 'cone' so we can extend inside the shape
  hull(){
    translate([cornerRadius+champherExtention/2,cornerRadius+champherExtention/2,conesizeBottom-champherExtention])
      rotate([0,0,45])
      cylinder(h=conesizeTop-conesizeBottom,r2=conesizeTop,r1=conesizeBottom,$fn=chamferFn);
    translate([size.x-cornerRadius-champherExtention/2,cornerRadius+champherExtention/2,conesizeBottom-champherExtention])
    rotate([0,0,45])
      cylinder(h=conesizeTop-conesizeBottom,r2=conesizeTop,r1=conesizeBottom,$fn=chamferFn);
    translate([cornerRadius+champherExtention/2,size.y-cornerRadius-champherExtention/2,conesizeBottom-champherExtention])
    rotate([0,0,45])
      cylinder(h=conesizeTop-conesizeBottom,r2=conesizeTop,r1=conesizeBottom,$fn=chamferFn);
    translate([size.x-cornerRadius-champherExtention/2,size.y-cornerRadius-champherExtention/2,conesizeBottom-champherExtention])
    rotate([0,0,45])
      cylinder(h=conesizeTop-conesizeBottom,r2=conesizeTop,r1=conesizeBottom,$fn=chamferFn);          
  }
}

//Creates a rounded cube
//x=width in mm
//y=length in mm
//z=height in mm
//cornerRadius = the radius of the cube corners
//topRadius = the radius of the top of the cube
//bottomRadius = the radius of the top of the cube
//sideRadius = the radius of the sides. This must be over 0.
module roundedCube(
  x,
  y,
  z,
  size=[],
  cornerRadius = 0,
  topRadius = 0,
  bottomRadius = 0,
  sideRadius = 0 ,
  centerxy = false,
  supportReduction_x = [0,0],
  supportReduction_y = [0,0],
  supportReduction_z = [0,0])
{
  minSideRadius = 0.01;
  assert(is_list(size), "size must be a list");
  size = len(size) == 3 ? size : [x,y,z];
  
  topRadius = topRadius > 0 ? topRadius : cornerRadius;
  bottomRadius = bottomRadius > 0 ? bottomRadius : cornerRadius;
  sideRadius = max(minSideRadius, sideRadius > 0 ? sideRadius : cornerRadius);
  
  assert(topRadius <= sideRadius, str("topRadius must be less than or equal to sideRadius. topRadius:", topRadius, " sideRadius:", sideRadius));
  assert(bottomRadius <= sideRadius, str("bottomRadius must be less than or equal to sideRadius. bottomRadius:", bottomRadius, " sideRadius:", sideRadius));

  //Support reduction should move in to roundedCylinder
  function auto_support_reduction(supportReduction, radius) = 
    supportReduction == -1 ? radius/2 : supportReduction;

  supportReduction_z = 
    let(srz_temp = is_num(supportReduction_z) ? [supportReduction_z,supportReduction_z] : supportReduction_z,
        srz = [auto_support_reduction(srz_temp[0], bottomRadius), auto_support_reduction(srz_temp[1], topRadius)]) 
      [min(srz[0], sideRadius),min(srz[1], sideRadius)];
  supportReduction_x = 
    let(srx_temp = is_num(supportReduction_x) ? [supportReduction_x,supportReduction_x] : supportReduction_x,
        srx = [auto_support_reduction(srx_temp[0], sideRadius), auto_support_reduction(srx_temp[1], sideRadius)])  
      [min(srx[0], sideRadius),min(srx[1], sideRadius)];
  supportReduction_y = 
    let(sry_temp = is_num(supportReduction_y) ? [supportReduction_y,supportReduction_y] : supportReduction_y,
        sry = [auto_support_reduction(sry_temp[0], sideRadius), auto_support_reduction(sry_temp[1], sideRadius)])   
      [min(sry[0], sideRadius),min(sry[1], sideRadius)];
      
  positions=[
     [[sideRadius                         ,sideRadius],                        [0,0]]
    ,[[max(size.x-sideRadius, sideRadius) ,sideRadius]                        ,[1,0]]
    ,[[max(size.x-sideRadius, sideRadius) ,max(size.y-sideRadius, sideRadius)],[1,1]]
    ,[[sideRadius                         ,max(size.y-sideRadius, sideRadius)],[0,1]]
    ];
    
  translate(centerxy ? [-size.x/2,-size.y/2,0] : [0,0,0])
  hull(){
    for (i =[0:1:len(positions)-1])
    {
      translate(positions[i][0]) 
        union(){
        roundedCylinder(h=size.z,r=sideRadius,roundedr2=topRadius,roundedr1=bottomRadius);
        if(supportReduction_z[1] > 0)
          translate([0,0,size.z-topRadius])
          cylinder(h=topRadius, r=supportReduction_z[1]);

        if(supportReduction_z[0] > 0)
          cylinder(h=bottomRadius, r=supportReduction_z[0]);
        
        if(supportReduction_x[0] > 0 && positions[i][1].x ==0){
          if(topRadius ==0 && bottomRadius == 0)
          {
            translate([0,0,size.z/2])
            cube(size=[sideRadius*2,supportReduction_x[0]*2,size.z],center=true);
          } else {
            translate([0,0,sideRadius])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supportReduction_x[0],center=true);
            translate([0,0,size.z-sideRadius])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supportReduction_x[0],center=true);
          }
        }
        
        if(supportReduction_x[1] > 0 && positions[i][1].x ==1){
         if(topRadius ==0 && bottomRadius == 0)
         {
            translate([0,0,size.z/2])
            cube(size=[sideRadius*2,supportReduction_x[1]*2,size.z],center=true);
          } else {
            translate([0,0,sideRadius])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supportReduction_x[1],center=true);
            translate([0,0,size.z-sideRadius])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supportReduction_x[1],center=true);
          }
        }
        
        if(supportReduction_y[0] > 0 && positions[i][1].y == 0){
            translate([0,0,sideRadius])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supportReduction_y[0],center=true);
            translate([0,0,size.z-sideRadius])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supportReduction_y[0],center=true);
        }
        if(supportReduction_y[1] > 0 && positions[i][1].y == 1){
            translate([0,0,sideRadius])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supportReduction_y[1], center=true);
            translate([0,0,size.z-sideRadius])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supportReduction_y[1], center=true);
        }
      }
    }
  }
}

module roundedCylinder(h,r,roundedr=0,roundedr1=0,roundedr2=0)
{
  assert(is_num(h), "h must have a value");
  assert(is_num(r), "r must have a value");
  roundedr1 = roundedr1 > 0 ? roundedr1 : roundedr;
  roundedr2 = roundedr2 > 0 ? roundedr2 : roundedr;
  
  assert(is_num(roundedr1), "roundedr1 or roundedr must have a value");
  assert(is_num(roundedr2), "roundedr2 or roundedr must have a value");
  
  if(roundedr1 > 0 || roundedr2 > 0){
    hull(){
      if(roundedr1 > 0)
        roundedDisk(r,roundedr1,half=-1);
      else
        cylinder(r=r,h=h-roundedr2);
        
      if(roundedr2 > 0)
        translate([0,0,h-roundedr2*2]) 
          roundedDisk(r,roundedr2,half=1);
      else
        translate([0,0,roundedr1]) 
          cylinder(r=r,h=h-roundedr1);
    }
  }
  else {
    cylinder(r=r,h=h);
  }
}

module roundedDisk(r,roundedr, half=0){
 hull(){
    translate([0,0,roundedr]) 
    rotate_extrude() 
    translate([r-roundedr,0,0])
    difference(){
      circle(roundedr);
      //Remove inner half so we dont get error when r<roundedr*2
      translate([-roundedr*2,-roundedr,0])
      square(roundedr*2);
      
      if(half<0){
        //Remove top half
        translate([-roundedr,0,0])
        square(roundedr*2);   
      }
      if(half>0){
        //Remove bottom half
        translate([-roundedr,-roundedr*2,0])
        square(roundedr*2);   
      }
    }
  }
}