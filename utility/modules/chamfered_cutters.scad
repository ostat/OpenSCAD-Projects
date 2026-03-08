include <rounded_shapes.scad>

//Chamfer (additive)

chamfered_shapes_demo = false;

if (chamfered_shapes_demo && $preview) {
  $fn=64;
  // Example: basic chamfered cube
  translate([0,0,0])
    chamfered_cube_cutter(
      size=[20,20,10], chamfer=2, cornerRadius=2, centerxy=true);

  // Example: chamfered cube with different top/bottom chamfers and radii
  translate([0,30,0])
    chamfered_cube_cutter(
      size=[20,20,10], topChamfer=3, bottomChamfer=1, cornerRadius=3, topRadius=2, bottomRadius=1, centerxy=true);

  // Example: chamfered half cylinder
  translate([40,0,0])
    chamfered_half_cylinder_cutter(h=20, r=10, circleFn=64, chamfer=3);

  // Example: chamfered cylinder with top and bottom chamfers
  translate([80,0,0])
    chamfered_cylinder_cutter(h=20, r=8, circleFn=64, chamfer=2);

      // Example: chamfered cylinder with top and bottom chamfers
  translate([120,0,0])
    fillet_cylinder_cutter(h=20, r=8, chamfer=2);

  translate([160,0,0])
  fillet_cube_cutter();

  translate([160,40,0])
  fillet_cube_cutter(
    top_enabled = false
  );
  
  translate([160,80,0])
  fillet_cube_cutter(
    size = [6.03, 20.1, 6.251],
    r = 0,
    top_enabled = false
  );
   
  
  translate([200,0,0])
  donut();
  
  translate([200,40,0])
  donut(
    ends_radius = 3,
    top_enabled = false);  

  translate([200,80,0])
  donut(
    inside_size = [6.03, 20.1, 6.251], 
    r = 0,
    ends_radius = 3, 
    top_enabled = false, 
    bottom_enabled = true);  
 }


module fillet_cube_cutter(
  size = [30,20,20],
  r = 3,
  fillet = 3,
  top_enabled = true,
  bottom_enabled = true,
  centerxy = false
) {
  // Creates a rectangular cutter that leaves a filleted (rounded) edge around a rounded-rectangle cutout.
  assert(is_list(size) && len(size) == 3, "size should be a list of length 3");
  assert(is_num(r), "r (side radius) should be a number");
  assert(is_num(fillet), "fillet should be a number");

  fudgeFactor = 0.01;

  // Clamp radii to sensible values
  r = min([size.x/2, size.y/2, r]);
  fillet = min([size.x/2, size.y/2, size.z/2, fillet]);

  translate(centerxy ? [-size.x/2, -size.y/2, 0] : [0,0,0])
  difference() {
    // Rounded-rectangle prism (outer shape) built from 4 hulled corner cylinders
    hull() {
      translate([r,           r,            0]) cylinder(h=size.z, r=r+fillet);
      translate([size.x-r,    r,            0]) cylinder(h=size.z, r=r+fillet);
      translate([r,           size.y-r,     0]) cylinder(h=size.z, r=r+fillet);
      translate([size.x-r,    size.y-r,     0]) cylinder(h=size.z, r=r+fillet);
    }
    
    donut(
      inside_size = size,
      r = r,
      ends_radius = fillet,
      top_enabled = top_enabled,
      bottom_enabled = bottom_enabled,
    );
  }
}


module donut(
  inside_size = [30,20,20],
  r = 3,
  ends_radius = 3,
  top_enabled = true,
  bottom_enabled = true,
){
  fudge_factor = 0.01;
  fillet = ends_radius;
  
  echo("donut", inside_size=inside_size, r=r, ends_radius=ends_radius, top_enabled=top_enabled, bottom_enabled=bottom_enabled);
  
  corner_positions = [
    [[inside_size.x-r,inside_size.y-r,fillet],inside_size.y-r*2],
    [[r,inside_size.y-r,fillet],inside_size.x-r*2],
    [[r,r,fillet],inside_size.y-r*2],
    [[inside_size.x-r,r,fillet],inside_size.x-r*2]
    ];

  for(i=[0:1:len(corner_positions)-1]){
    translate(corner_positions[i][0])
      rotate([0,0,i*90])
      rotate_extrude(angle=90)
      translate([r+fillet, 0, 0])
      donut_slice(
        height = inside_size.z,
        fillet = fillet,
        top_enabled = top_enabled,
        bottom_enabled = bottom_enabled);

    translate(corner_positions[i][0])
      rotate([0,0,i*90])
      rotate([90,0,0])
      linear_extrude(height=corner_positions[i][1])
      translate([r+fillet, 0, 0])
      donut_slice(
        height = inside_size.z,
        fillet = fillet,
        top_enabled = top_enabled,
        bottom_enabled = bottom_enabled);
  }
}

module donut_slice(
height,
fillet,
top_enabled,
bottom_enabled
){
  hull() {
    fudge_factor = 0.01;
    translate([0, height - fillet*2])
    if(bottom_enabled) {
      circle(r=fillet);
    } else {
      translate([0,-fillet])
      square(size=[fillet*2,fudge_factor*2], center = true);
    }
    
    if(top_enabled) {
      circle(r=fillet);
    } else {
      translate([0,-fillet])
      square(size=[fillet*2,fudge_factor*2], center = true);
    }
  }
}

module fillet_cylinder_cutter(h,r,chamfer)
{
  echo("negativeRoundedCylinder", h=h,r=r,chamfer=chamfer);
  difference(){
    cylinder(h=h,r=r+chamfer);

    if(chamfer>0)
    {
      translate([0,0,chamfer])
        rotate_extrude()
        translate([r+chamfer,0,0])
        hull(){
          circle(r=chamfer);
          translate([0,h-chamfer*2,0])
          circle(r=chamfer);
        }
    }
  }
}

// Creates a slot with a small chamfer for easy insertertion
//#slotCutout(100,20,40);
//width = width of slot
//depth = depth of slot
//height = height of slot
//chamfer = chamfer size

module chamfered_cube_cutter(
  size = [10,10,10],
  chamfer=0, topChamfer = 0, bottomChamfer = 0,
  cornerRadius = 0, topRadius=0, bottomRadius=0,
  centerxy = false)
{
  assert(is_list(size) && len(size) == 3, "size should be a list of length 3");
  assert(is_num(chamfer), "chamfer should be a number");
  assert(is_num(topChamfer), "topChamfer should be a number");
  assert(is_num(bottomChamfer), "bottomChamfer should be a number");

  topChamfer = min(size.z, chamfer > 0 ? chamfer : topChamfer);
  bottomChamfer = min(size.z, chamfer > 0 ? chamfer : bottomChamfer);

  bottomRadius = min(bottomRadius, cornerRadius);
  topRadius = min(topRadius, cornerRadius);
  // echo("chamfered_cube", size=size, topChamfer=topChamfer, bottomChamfer=bottomChamfer);

  fudgeFactor = 0.01;
  chamfer = min(size.z, chamfer);
  translate(centerxy ? [-size.x/2, -size.y/2, 0] : [0,0,0])
  union(){
    rounded_cube(
      size=size,
      topRadius = topRadius,
      bottomRadius = bottomRadius,
      sideRadius = cornerRadius);

    if(topChamfer > 0)
       translate([0,0,size.z+fudgeFactor-topChamfer-cornerRadius])
       chamferedRectangleTop(size=size, chamfer=topChamfer, cornerRadius=cornerRadius);

    if(bottomChamfer > 0)
       translate([0,0,bottomChamfer])
       mirror([0,0,1])
       chamferedRectangleTop(size=size, chamfer=bottomChamfer, cornerRadius=cornerRadius);
  }
}

module chamferedRectangleTop(size, chamfer, cornerRadius){
  fudgeFactor = 0.01;

  chamferFn = cornerRadius > 0 ? $fn : 4;

  //champherExtention caused errors in slat wall, Need to find the scenario it was needed to debug. For now disabled.
  //when the chamferFn value is 4 we need to change the formula as the radius is corner to corner not edge to edge.
  champherExtention = 0;// cornerRadius > 0 ? 0 : (min(size.x,size.y,size.z)-chamfer)/4;

  conesizeTop = chamfer+cornerRadius+champherExtention;
  conesizeBottom = conesizeTop>size.z ? conesizeTop-size.z: 0;

  //echo("chamferedRectangleTop", size=size, chamfer=chamfer, cornerRadius=cornerRadius, champherExtention=champherExtention, conesizeTop=conesizeTop, conesizeBottom=conesizeBottom);

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

module chamfered_half_cylinder_cutter(h, r, circleFn, chamfer=0.5) {
  fudgeFactor = 0.01;

  chamfer = min(h, chamfer);
  translate([0,-h/2,r])
  union(){
    rotate([-90,0,0])
    difference(){
      cylinder(h=h, r=r, $fn = circleFn);
      translate([-r-fudgeFactor,-r,-fudgeFactor])
      cube([(r+fudgeFactor)*2,r,h+fudgeFactor*2]);
    }

    if(r>0)
      translate([-r, 0, -chamfer+fudgeFactor])
      chamferedRectangleTop(size=[r*2,h,r], chamfer=chamfer, cornerRadius=0);
  }
}

module chamfered_cylinder_cutter(
    h,
    r,
    circleFn,
    chamfer=0,
    topChamfer = 0,
    bottomChamfer = 0) {
  topChamfer = min(h, chamfer > 0 ? chamfer : topChamfer);
  bottomChamfer = min(h, chamfer > 0 ? chamfer : bottomChamfer);

  union(){
    cylinder(h=h, r=r, $fn = circleFn);

    if(topChamfer >0)
      translate([0, 0, h-topChamfer])
      cylinder(h=topChamfer, r1=r, r2=r+topChamfer,$fn = circleFn);

    if(bottomChamfer >0)
      cylinder(h=bottomChamfer, r1=r+bottomChamfer, r2=r,$fn = circleFn);
  }
}
