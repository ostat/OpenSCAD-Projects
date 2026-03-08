include <../thirdparty/ub_sbogen.scad>
include <wallcutout.scad>
include <../module_wallplacard.scad>
include <../functions_general.scad>

bent_wall_demo = false;

if(bent_wall_demo && $preview){
  $fn = 64;

  translate([400,0,0])
  union(){
    for(i = [0,1,2]){
      translate([20*i,0,0])
      bentWall(
        separation=i==1? 10 : 0,
        label_size = i==2?10:0);

      translate([20*i,100,0])
      bentWall(
        separation=i==1? 10 : 0,
        label_size = i==2?10:0, top_radius = -2);


      translate([20*i,200,0])
      bentWall(
        separation=i==1? 10 : 0,
        label_size = i==2?10:0,
        thickness = [10,5]);

      translate([20*i,300,0])
      bentWall(
        separation=i==1? 10 : 0,
        label_size = i==2?10:0,
        thickness = [10,5], top_radius = -2);
    }
  }

  translate([0, 0, 0]) bentWall();
}

//Wall is centred on the middle of the start. Bend is not taken in to account
module bentWall(
  length=80,
  bendPosition=0,
  bendAngle=45,
  separation=20,
  lowerBendRadius=0,
  upperBendRadius=0,
  height=30,
  thickness=[10,10], //top thickness, bottom thickness
  wall_cutout_depth = 0,
  wall_cutout_width = 0,
  wall_cutout_radius = 0,
  top_radius = 0,
  label_size = 0,
  label_angle = 45,
  centred_x=true) {
  assert(is_num(thickness) || (is_list(thickness) && len(thickness) ==2), "thickness should be a list of len 2");
  fudgeFactor = 0.01;

  function get_related_value(user_value, base_value, default_value, max_value) =
  let(
      max_value = is_undef(max_value) ? base_value : max_value,
      default = is_undef(default_value) ? base_value : default_value,
      calculated = user_value == 0 ? default :
      user_value < 0 ? base_value/abs(user_value) : user_value)
      min(calculated, max_value);

  label_enabled = label_size > 0 && label_size*4 < length;
  thickness = is_num(thickness) ? [thickness,thickness] : thickness;
  thickness_bottom  = thickness.x;
  thickness_top = thickness.y;

  top_scale = thickness.y/thickness.x;

  top_radius = get_related_value(
    user_value = top_radius,
    base_value = thickness_top,
    max_value = thickness_top/2,
    default_value = 0);

  bendPosition = get_related_value(bendPosition, length, length/2);


  label_z_height = label_enabled ? cos(label_angle)* label_size + thickness_bottom/2 : 0;

  cutoutHeight = max(get_related_value(wall_cutout_depth, height, 0), label_z_height);
  cutoutRadius = label_enabled ? label_size/4 : get_related_value(wall_cutout_radius, cutoutHeight, cutoutHeight);

  label_length = length-cutoutRadius*6;
  cutoutLength = wall_cutout_width == 0 && label_enabled ? label_length : get_related_value(wall_cutout_width, length, length/2);

  //Thickness should match the wall thickness, for tapered walls find the right position
  label_thickness = thickness_bottom-(thickness_bottom-thickness_top)*((cutoutHeight-thickness_bottom/2)/(height-thickness_bottom/2))/2;


  //#render()
  difference()
  {
    if(separation != 0) {
      translate(centred_x ? [0,0,0] : [(thickness.x+separation)/2,0,0])
      translate([0,bendPosition,0])
      linear_extrude(height, scale = [top_scale,1], )
      SBogen(
        TwoD=thickness.x,
        dist=separation,
        //x0=true,
        grad=bendAngle,
        r1=lowerBendRadius <= 0 ? separation : lowerBendRadius,
        r2=upperBendRadius <= 0 ? separation : upperBendRadius,
        l1=bendPosition,
        l2=length-bendPosition);
    } else {
      translate(centred_x ? [-thickness.x/2,0,0] : [0,0,0])
      hull(){
        rotate([90,0,0])
        translate([(thickness_bottom-thickness_top)/2,0,-length])
        roundedCube(
          size =[thickness_top, height, length],
          sideRadius = top_radius);
        cube([thickness_bottom, length, thickness_bottom/2]);
      }
    }

    //wall cutout section
    if(cutoutHeight != 0){
      translate(centred_x ? [0,0,0] : [(separation+thickness)/2+fudgeFactor,0,0])
      translate([0,length/2,height])
      rotate([0,0,90])
      WallCutout(
        height = cutoutHeight,
        lowerWidth = cutoutLength,
        cornerRadius = cutoutRadius,
        thickness = (separation+thickness[0]+fudgeFactor*2),
        topHeight = 1);
    }
  }

  //wall label section
  if(label_enabled){
    label_z = height-cutoutHeight;
    label_length = cutoutLength-cutoutRadius;


    translate([label_thickness/2,length/2-label_length/2,0])
    hull()
    {
      translate([0,0,label_z])
      rotate([0,0,180])
      rotate([90,0,0])
      rotate_extrude(angle = 45)
      square([label_thickness,label_length]);
      //translate([0,0,label_z])
      //rotate([45,0,90])
      //cube([label_length,label_thickness,10]);
      translate([0,0,label_z])
      rotate([0,45,0])
      translate([-label_thickness,label_length,0])
      rotate([90,0,0])
      roundedCube(
          size =[label_thickness,label_size,label_length],
          sideRadius = top_radius);
    }

  }
}
