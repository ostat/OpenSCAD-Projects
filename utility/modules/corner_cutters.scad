include <module_utility.scad>

corner_cutters_demo = false;

if(corner_cutters_demo  && $preview){
  $fn = 64;

  translate([0,50,0])
  chamfered_corner_cutter(
    chamferLength = 10,
    cornerRadius = 4,
    length=100,
    height=25,
    width = 20);

  rounded_corner_cutter(
    radius = 10,
    length = 100,
    height = 25);
    
  corner_styles = ["rounded", "chamfered"];
  angled_extensions = [true, false];
  for(corner_style = [0:1:len(corner_styles)-1])
  for(angled_extension = [0:1:len(angled_extensions)-1])
  echo(corner_style=corner_style)
  translate([(angled_extension+1)*150,corner_style*60,0])
  corner_cutter(
    corner_style = corner_styles[corner_style],
    corner_size = 10,
    length = 100,
    height = 25,
    width = 20,
    angled_extension = angled_extensions[angled_extension]
    );
}

      
module corner_cutter(
  corner_style = "rounded",
  corner_size = 10,
  chamfer_corner_radius,
  length,
  height,
  width,
  angled_extension
){
  if(corner_style == "rounded"){
    rounded_corner_cutter(
      radius = corner_size, //tapered_corner_size+cutout_clearance_border*2,
      length = length,
      height = height,
      width = width,
      angled_extension = angled_extension);
  }
  else if(corner_style == "chamfered"){
    chamfered_corner_cutter(
      chamferLength = corner_size, 
      cornerRadius = chamfer_corner_radius,
      length = length,
      height = height,
      width = width,
      angled_extension = angled_extension);
  }
}

//create a negative rouneded corner that subtracted from a shape
//radius = the radius of the corner
//length = the extrusion/length
//height = the distance past the corner.
module rounded_corner_cutter(
  radius = 10,
  length,
  height,
  width,
  angled_extension = false)
{
  assert(is_num(length), "length must be a number");
  assert(is_num(height), "height must be a number");
  assert(is_num(radius), "radius must be a number");
    
  corner_cutter_base(
    cornerRadius = radius,
    length = length,
    height = height,
    width = width,
    angled_extension = angled_extension)
    translate([-1,radius, radius])
      rotate([90, 0, 90])
      cylinder(h = length+2, r=radius);
}

//create a negative chamfer corner that subtracted from a shape
//chamferLength = the amount that will be subtracted from the
//cornerRadius = the radius of the corners
//length = the extrusion/length
//height = the distance past the corner
module chamfered_corner_cutter(
  chamferLength = 10,
  cornerRadius,
  length,
  height,
  width,
  angled_extension = false)
{
  assert(is_num(length), "length must be a number");
  assert(is_num(height), "height must be a number");
  assert(is_num(cornerRadius), "radius must be a number");
  
  cornerRadius = is_undef(cornerRadius) ? chamferLength/4 : cornerRadius;

  positions = [
    [-1,chamferLength, cornerRadius],
    [-1,cornerRadius, chamferLength],
    [-1,chamferLength, chamferLength]];
    
  corner_cutter_base(
    cornerRadius = chamferLength,
    length = length,
    height = height,
    width = width,
    angled_extension = angled_extension)
    hull(){
      for(i=[0:len(positions)-1])
        translate(positions[i])
          rotate([90, 0, 90])
          cylinder(h = length+2, r=cornerRadius);  
  }
}


//create a negative chamfer corner that subtracted from a shape
//chamferLength = the amount that will be subtracted from the
//cornerRadius = the radius of the corners
//length = the extrusion/length
//height = the distance past the corner
module corner_cutter_base(
  cornerRadius,
  length,
  height,
  width,
  angled_extension = false)
{
  fudgeFactor = 0.01;
  width = !is_undef(width) && width > 0 ? width : cornerRadius;
  
  cornerRadius = is_undef(cornerRadius) ? cornerRadius/4 : cornerRadius;
  
  difference(){
    union(){
      //main corner to be removed
      translate([0,-width, -width])
        cube([length, cornerRadius+width,  cornerRadius+width]);
      //corner extension in y
      translate([0,cornerRadius-fudgeFactor, -width])
        rotate_around_point(point=[0,0,width], rotation=angled_extension ? [-45,0,0] : [0,0,0])
        cube([length, height-cornerRadius, width]);
      //corner extension in x
      translate([0,-width, cornerRadius-fudgeFactor])
        rotate_around_point(point=[0,width,0], rotation=angled_extension ? [45,0,0] : [0,0,0])
        cube([length, width, height-cornerRadius]);
    }
    
    children();
  }
}
