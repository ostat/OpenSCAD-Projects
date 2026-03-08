// light box
// by Ostat 
// Repo https://github.com/ostat/OpenSCAD-Projects
// Doco https://docs.ostat.com/docs/light_box

// Preset print bed sizes. I subtracted 5mm from each dimension to make it fit.
preset_printer = "custom"; //[prusa_mini,prusa_mks,prusa_core1,prusa_core1_l,prusa_xl, bambu_mini,bambu_a1,bambu_x1c,bambu_p1,bambu_p2,bambu_h2d,bambu_h2s,bambu_h2c]

// Size to use when custom is picked
custom_outer_size = [180,180,180];

// Thickenss of the wall
wall_thickness = 4;
// Radius of the floor, for negative numbers it uses min(x,y,z)/abs(number), -2 is half of the smalest x,y,z dimension
wall_radius = -4;
// Radius of the floor, for negative numbers it uses min(x,y,z)/abs(number), -4 is a quater of the smalest x,y,z dimension
floor_radius = -10;
// Roof of the floor, for negative numbers it uses min(x,y,z)/abs(number), -8 is a eight of the smalest x,y,z dimension
roof_radius = -8;
// add taper to reduce outer size whils still printable with out support
taper_floor_radius = true;
// makes the shape printable on its back without support
taper_back_radius = false;

/* [Sides to Open] */
// Open the x side
open_x = false;
// Open the y side
open_y = true;
// Open the top
open_z = true;
// Rounded style for when both X and Y are open
xy_rounded_style = "rounded"; //[rounded,chamfered]
// Radius of for when both X and Y are open. -1 = wall radius
xy_rounded_radius = -1;

/* [Top Cutout] */
// Enable the top cutout, handy if you want to sit a light, phone or tablet above the box
cutout_enabled = false; //
// Cutout size 
cutout_size = [-1.8,-1.8]; //0.1
// Cutout radius
cutout_radius = -4; //0.1
// Move the cutout from center
cutout_position = [0,0]; //0.1

/* [Top Lip] */
// Enable the top cutout, handy if you want to sit a light, phone or tablet above the box
lip_enabled = true; //
// Size of the top lip
lip_size = 5; //0.1
// Size of the top lip
lip_wall_height = 0; //0.1

/* [Slat Pattern] */
// Add pattern to wall to prevent warping
slats_enabled = "slat"; // [disabled, slat, brick]
// width of slats
slats_width = -0.5; //
// depth of pattern in mm
slats_depth = 0.5; // 0.1


/* [other] */
//Details of the model
$fn = 128;

/* [Hidden] */
module end_of_customizer_opts() {}
/*<!!end gridfinity_basic_cup!!>*/

fudge_factor = 0.01;


//baseline was reported sizes -5mm
selected_outer_size = 
  preset_printer == "bambu_mini" ? [178,178,178]
  : preset_printer == "bambu_a1" ? [250,250,250]
  : preset_printer == "bambu_x1c" ? [250,250,250]
  : preset_printer == "bambu_p1" ? [250,250,250]
  : preset_printer == "bambu_p2" ? [250,250,250]
  : preset_printer == "bambu_h2d" ? [320,315,320]
  : preset_printer == "bambu_h2s" ? [335,315,335]
  : preset_printer == "bambu_h2c" ? [320,315,320]
  
  : preset_printer == "prusa_mini" ? [175,175,175]
  : preset_printer == "prusa_mks" ? [245,205,205]
  : preset_printer == "prusa_core1" ? [245,215,265]
  : preset_printer == "prusa_core1_l" ? [295,295,325]
  : preset_printer == "prusa_xl" ? [355,355,355]
  
  : preset_printer == "custom" ? custom_outer_size 
  : custom_outer_size;

echo(mode = str(preset_printer, "_size_x", selected_outer_size.x, "_y", selected_outer_size.y, "_z", selected_outer_size.z));

translate([selected_outer_size.x,selected_outer_size.y,0])
rotate([0,0,180])
difference(){
  lip_enabled = lip_enabled && open_z;

  min_outer_dimension =  min(selected_outer_size);
  floor_radius_adjusted = get_related_value(floor_radius, min_outer_dimension, min_outer_dimension, min_outer_dimension);
  floor_radius_adjusted_outer = taper_floor_radius ? floor_radius_adjusted : 0.01;
  
  roof_radius_adjusted = get_related_value(roof_radius, min_outer_dimension, min_outer_dimension, min_outer_dimension);
  roof_radius_adjusted_inner = roof_radius_adjusted-wall_thickness;
  
  wall_radius_adjusted = let(rad = get_related_value(wall_radius, min_outer_dimension, min_outer_dimension, min_outer_dimension)) max(rad, floor_radius_adjusted, roof_radius_adjusted);
  
  xy_rounded_radius_adjusted = xy_rounded_radius >= 0 ? xy_rounded_radius : wall_radius_adjusted;
  
  outer_size_adjusted = [
    selected_outer_size.x + (open_x ? wall_radius_adjusted : 0),
    selected_outer_size.y + (open_y ? wall_radius_adjusted : 0),
    selected_outer_size.z + (open_z ? roof_radius_adjusted : 0)];
    
  lip_thickness_position = sqrt(roof_radius_adjusted_inner^2-(roof_radius_adjusted_inner-lip_size)^2);
  
  echo(floor_radius_adjusted=floor_radius_adjusted, roof_radius_adjusted=roof_radius_adjusted, wall_radius_adjusted=wall_radius_adjusted );
  
  inner_size_adjusted = [
    outer_size_adjusted.x-wall_thickness*2,
    outer_size_adjusted.y-wall_thickness*2,
    outer_size_adjusted.z-wall_thickness*2-( lip_enabled ? (lip_thickness_position+lip_wall_height+wall_thickness) : 0 )];

    echo(inner_size_adjusted=inner_size_adjusted);
  //outer body  
  rounded_cube(
    size=outer_size_adjusted,
    sideRadius = wall_radius_adjusted,
    topRadius = roof_radius_adjusted,
    bottomRadius = floor_radius_adjusted_outer,
    supportReduction_x = taper_back_radius ? [-1,-1] : [0,0],
    supportReduction_y = [0,0],
    supportReduction_z = taper_floor_radius ? [-1,0] : [0,0]);
  
  //inner body
  translate([wall_thickness,wall_thickness,wall_thickness])
  rounded_cube(
    size=inner_size_adjusted,
    sideRadius = max(0, wall_radius_adjusted-wall_thickness),
    topRadius = max(0, roof_radius_adjusted-wall_thickness),
    bottomRadius = max(0, floor_radius_adjusted-wall_thickness));
  
  if(open_x && open_y) {
    translate([-wall_radius_adjusted+fudge_factor*2,-wall_radius_adjusted+fudge_factor*2,-fudge_factor])
    translate([outer_size_adjusted.x+fudge_factor*2,outer_size_adjusted.y+fudge_factor*2,outer_size_adjusted.z+fudge_factor*2])
    rotate([0,0,180])
    rotate([0,90,0])
    corner_cutter(
      corner_style = xy_rounded_style,
      corner_size = xy_rounded_radius_adjusted,
      length=outer_size_adjusted.z+fudge_factor*2,
      height=outer_size_adjusted.x+fudge_factor*2,
      width=wall_radius_adjusted+fudge_factor*2);
  }
  else if(open_x) {
    translate([selected_outer_size.x,-fudge_factor,-fudge_factor])
    cube(size=[
      wall_radius_adjusted+fudge_factor*2,
      outer_size_adjusted.y+fudge_factor*2,
      outer_size_adjusted.z+fudge_factor*2]);
  }
  else if(open_y) {
    translate([-fudge_factor,selected_outer_size.y,-fudge_factor])
    cube(size=[
      outer_size_adjusted.x+fudge_factor*2,
      wall_radius_adjusted+fudge_factor*2,
      outer_size_adjusted.z+fudge_factor*2]);
  }
  
  if(open_z) 
  translate([-fudge_factor,-fudge_factor,selected_outer_size.z])
  cube(size=[
    outer_size_adjusted.x+fudge_factor*2,
    outer_size_adjusted.y+fudge_factor*2,
    roof_radius_adjusted+fudge_factor*2]);    
    
  if(cutout_enabled){
  translate([-fudge_factor,-fudge_factor,selected_outer_size.z-wall_thickness])
  cutout(
    cutoutSize = cutout_size,
    cutoutRadius = cutout_radius,
    cutoutPosition = cutout_position,
    top_size = [selected_outer_size.x,selected_outer_size.y],
    wall_thickness = wall_thickness+fudge_factor*2);
  }

  if(lip_enabled){
    translate([wall_thickness,wall_thickness,selected_outer_size.z-lip_wall_height+fudge_factor])
    rounded_cube(
      size=[inner_size_adjusted.x, inner_size_adjusted.y, lip_size+fudge_factor],
      sideRadius = max(0, wall_radius_adjusted-wall_thickness),
      topRadius = 0,
      bottomRadius = 0);
    translate([wall_thickness+lip_size,wall_thickness+lip_size,selected_outer_size.z-lip_size*2+fudge_factor])
    rounded_cube(
      size=[inner_size_adjusted.x-lip_size*2, inner_size_adjusted.y-lip_size*2, lip_size*2+fudge_factor],
      sideRadius = max(0, wall_radius_adjusted-wall_thickness-lip_size),
      topRadius = 0,
      bottomRadius = 0);
  }
  
  
  if(slats_enabled != "disabled"){
    slats_depth = get_related_value(slats_depth, wall_thickness, wall_thickness/2);
    slats_width = get_related_value(slats_width, wall_thickness, wall_thickness*2, 999);
    slats_border = slats_width*2;
    slats_outerwall_extention = fudge_factor+1;
    slats_height = 
        outer_size_adjusted.z-floor_radius_adjusted_outer-roof_radius_adjusted 
        - (open_z ? slats_border : 0)
        - (taper_floor_radius ? 0 : slats_border);
    slats_zpos = slats_height/2+floor_radius_adjusted_outer
          + (taper_floor_radius ? 0 : slats_border);
    
    positions = [
      [  //left (x=0)
        true,
        [90,0,180], //rotation 
        [outer_size_adjusted.x/2 - (open_x ? slats_border/2 : 0),-slats_outerwall_extention,slats_zpos], //Translate
        [outer_size_adjusted.x-wall_radius_adjusted*2 - (open_x ? slats_border : 0), slats_height]],//size
      
      [  //right (x=max)
        !open_y,
        [90,0,0], 
        [outer_size_adjusted.x/2- (open_x ? slats_border/2 : 0),outer_size_adjusted.y+slats_outerwall_extention,slats_zpos], 
        [outer_size_adjusted.x-wall_radius_adjusted*2 - (open_x ? slats_border : 0),slats_height]],
      
      [  //front (y=0)
        true,
        [90,0,90], 
        [-slats_outerwall_extention,outer_size_adjusted.y/2- (open_y ? slats_border/2 : 0),slats_zpos], 
        [outer_size_adjusted.y-wall_radius_adjusted*2 - (open_y ? slats_border : 0),slats_height]],
      
      [  //back (y=0)
        !open_x,
        [90,0,270], 
        [outer_size_adjusted.x+slats_outerwall_extention,outer_size_adjusted.y/2- (open_y ? slats_border/2 : 0),slats_zpos], 
        [outer_size_adjusted.y-wall_radius_adjusted*2 - (open_y ? slats_border : 0),slats_height]]
      ];
  
    for(pos = positions)
    if(pos[0])
      translate(pos[2])
      rotate(pos[1])
      if(slats_enabled == "slat"){
        slat_pattern(
          canvis_size=pos[3],
          thickness = slats_depth+slats_outerwall_extention,
          spacing = slats_width,
          border = 0,
          slat_width = slats_width,
          slat_chamfer = [slats_depth,0],
          center = true,
          rotateGrid = false)
            chamfered_cube(
              $brick_size,
              topChamfer = 0,
              bottomChamfer = slats_depth+slats_outerwall_extention);
      } else {
        brick_pattern(
          canvis_size=pos[3],
          thickness = slats_depth+slats_outerwall_extention,
          spacing = slats_width,
          border = 0,
          cell_size = [slats_width*5,slats_width],
          corner_radius = slats_width,
          center_weight = 3,
          offset_layers = true,
          center = true,
          rotateGrid = true)
            chamfered_cube(
              $brick_size,
              topChamfer = 0,
              bottomChamfer = slats_depth+slats_outerwall_extention);
      }
              
  }
}

function sum(list, c = 0, end) = 
  let(end = is_undef(end) ? len(list) : end)
  c < 0 || end < 0 ? 0 : 
  c < len(list) - 1 && c < end
    ? list[c] + sum(list, c + 1, end=end) 
    : list[c];

    
function get_related_value(user_value, base_value, default_value, max_value) = 
  let(
      max_value = is_undef(max_value) ? base_value : max_value,
      default = is_undef(default_value) ? base_value : default_value,
      calculated = user_value == 0 ? default :
      user_value < 0 ? base_value/abs(user_value) : user_value)
      min(calculated, max_value);

module cutout(
  cutoutSize = [0,0],
  cutoutRadius = 0,
  cutoutPosition = [0,0],
  top_size = [0,0],
  wall_thickness = 0
){
  fudge_factor = 0.01;

  if(cutoutSize.x != 0 && cutoutSize.y != 0){
    cSize = [
      get_related_value(cutoutSize.x, top_size.x, 0),
      get_related_value(cutoutSize.y, top_size.y, 0)
    ];

    minSize = min(cSize.x, cSize.y);
    cRadius = min(minSize/2, get_related_value(cutoutRadius, minSize,  0.01));

    positions = [
      [-cSize.x/2+cRadius, -cSize.y/2+cRadius],
      [-cSize.x/2+cRadius, cSize.y/2-cRadius],
      [cSize.x/2-cRadius, cSize.y/2-cRadius],
      [cSize.x/2-cRadius, -cSize.y/2+cRadius]
    ];

    translate([cutoutPosition.x,cutoutPosition.y,0])
    translate([
      top_size.x/2,
      top_size.y/2,
      -fudge_factor])
      hull(){
        for(i=[0:len(positions)-1]){
          translate([positions[i].x,positions[i].y,0])
          cylinder(r=cRadius, h=wall_thickness+fudge_factor*2);
        }
      }
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
module rounded_cube(
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

  supportReduction_z = is_num(supportReduction_z) ? [supportReduction_z, supportReduction_z] : supportReduction_z;
  supportReduction_x = is_num(supportReduction_x) ? [supportReduction_x, supportReduction_x] : supportReduction_x;
  supportReduction_y = is_num(supportReduction_y) ? [supportReduction_y, supportReduction_y] : supportReduction_y;

  assert(topRadius <= sideRadius, str("topRadius must be less than or equal to sideRadius. topRadius:", topRadius, " sideRadius:", sideRadius));
  assert(bottomRadius <= sideRadius, str("bottomRadius must be less than or equal to sideRadius. bottomRadius:", bottomRadius, " sideRadius:", sideRadius));

  //Support reduction should move in to roundedCylinder
  function auto_support_reduction(supportReduction, corner_radius, center_radius) =
    let(center_radius = is_num(center_radius) ? center_radius : corner_radius,
      sr = (supportReduction == -1 ? corner_radius/2 : supportReduction)+max(0,center_radius-corner_radius))
    min(sr, center_radius);

  //z needs to account for the side radius as the side radius can be greater than the top and bottom radius.
  supReduction_z = [auto_support_reduction(supportReduction_z[0], bottomRadius, sideRadius), auto_support_reduction(supportReduction_z[1], topRadius, sideRadius)];
  supReduction_x = [auto_support_reduction(supportReduction_x[0], sideRadius), auto_support_reduction(supportReduction_x[1], sideRadius)];
  supReduction_y = [auto_support_reduction(supportReduction_y[0], sideRadius), auto_support_reduction(supportReduction_y[1], sideRadius)];

  //x and y need and offset to account for the top and bottom radius
  supReduction_x_offset = [auto_support_reduction(supportReduction_x[0], bottomRadius), auto_support_reduction(supportReduction_x[1], topRadius)];
  supReduction_y_offset = [auto_support_reduction(supportReduction_y[0], bottomRadius), auto_support_reduction(supportReduction_y[1], topRadius)];

  positions=[
     [[sideRadius                         ,sideRadius]                        ,[0,0],[0,0,180]]
    ,[[max(size.x-sideRadius, sideRadius) ,sideRadius]                        ,[1,0],[0,0,270]]
    ,[[max(size.x-sideRadius, sideRadius) ,max(size.y-sideRadius, sideRadius)],[1,1],[0,0,0]]
    ,[[sideRadius                         ,max(size.y-sideRadius, sideRadius)],[0,1],[0,0,90]]
    ];

  translate(centerxy ? [-size.x/2,-size.y/2,0] : [0,0,0])
  hull()
  {
    for (i =[0:1:len(positions)-1])
    {
      translate(positions[i][0])
        union(){
        rotate(positions[i][2])
        roundedCylinder(
          h=size.z,
          r=sideRadius,
          roundedr2=topRadius,
          roundedr1=bottomRadius, 
          angle=90);
        if(supReduction_z[1] > 0)
          translate([0,0,size.z-topRadius])
          cylinder(h=topRadius, r=supReduction_z[1]);

        if(supReduction_z[0] > 0)
          cylinder(h=bottomRadius, r=supReduction_z[0]);

        if(supReduction_x[0] > 0 && positions[i][1].x ==0){
          if(topRadius ==0 && bottomRadius == 0)
          {
            translate([0,0,size.z/2])
            cube(size=[sideRadius*2,supReduction_x[0]*2,size.z],center=true);
          } else {
            //bottom
            translate([0,0,supReduction_x[0]+supReduction_x_offset[0]])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supReduction_x[0],center=true);
            //top
            translate([0,0,size.z-supReduction_x[0]-supReduction_x_offset[1]])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supReduction_x[0],center=true);
          }
        }

        if(supReduction_x[1] > 0 && positions[i][1].x ==1){
         if(topRadius == 0 && bottomRadius == 0)
         {
            translate([0,0,size.z/2])
            cube(size=[sideRadius*2,supReduction_x[1]*2,size.z],center=true);
          } else {
            //bottom
            translate([0,0,supReduction_x[1]+supReduction_x_offset[0]])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supReduction_x[1],center=true);
            //top
            translate([0,0,size.z-supReduction_x[1]-supReduction_x_offset[1]])
            rotate([0,90,0])
            cylinder(h=sideRadius*2, r=supReduction_x[1],center=true);
          }
        }

        if(supReduction_y[0] > 0 && positions[i][1].y == 0){
            //bottom
            translate([0,0,supReduction_y[0]+supReduction_y_offset[0]])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supReduction_y[0],center=true);
            //top
            translate([0,0,size.z-supReduction_y[0]-supReduction_y_offset[1]])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supReduction_y[0],center=true);
        }
        if(supReduction_y[1] > 0 && positions[i][1].y == 1){
            //bottom
            translate([0,0,supReduction_y[1]+supReduction_y_offset[0]])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supReduction_y[1], center=true);
            //top
            translate([0,0,size.z-supReduction_y[1]-supReduction_y_offset[1]])
            rotate([0,90,90])
            cylinder(h=sideRadius*2, r=supReduction_y[1], center=true);
        }
      }
    }
  }
}

module roundedCylinder(h,r,roundedr=0,roundedr1=0,roundedr2=0, angle=360)
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
        roundedDisk(r,roundedr1,half=-1,angle=angle);
      else
        cylinder(r=r,h=h-roundedr2);

      if(roundedr2 > 0)
        translate([0,0,h-roundedr2*2])
          roundedDisk(r,roundedr2,half=1,angle=angle);
      else
        translate([0,0,roundedr1])
          cylinder(r=r,h=h-roundedr1);
    }
  }
  else {
    cylinder(r=r,h=h);
  }
}

module roundedDisk(r,roundedr, half=0, angle=360){
 hull(){
    translate([0,0,roundedr])
    rotate_extrude(angle=angle, convexity=10)
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

module slat_pattern(
  canvis_size=[31,31],
  thickness = 1,
  spacing = 2,
  border = 0,
  slat_width = 5,
  slat_chamfer = [-2,-2],
  center = true,
  rotateGrid = false){
  
  assert(is_list(canvis_size) && len(canvis_size) == 2, "canvis_size must be a list of len 2");
  assert(is_num(thickness), "thickness must be a number");
  assert(is_num(spacing), "spacing must be a number");
  assert(is_num(border), "border must be a number");
  assert(is_num(slat_chamfer) || is_list(slat_chamfer), "slat_chamfer must be a number");
  assert(is_bool(center), "center must be a bool");
  assert(is_bool(rotateGrid), "rotateGrid must be a bool");

  chamfer = is_num(slat_chamfer) ? [0, slat_chamfer] : slat_chamfer;
  
  assert(is_list(chamfer), "chamfer must be list"); 

  working_canvis_size = 
    let (cs = rotateGrid ? [canvis_size.y,canvis_size.x] : canvis_size)
    border > 0 ? [cs.x-border*2,cs.y-border*2] : cs;
  
  nx = floor((working_canvis_size.x + spacing) / (slat_width + spacing));
    
  if(nx > 0)
  translate(center ? [0,0,0] : [canvis_size.x/2,canvis_size.y/2,0])
  rotate(rotateGrid?[0,0,90]:[0,0,0])
  translate([-working_canvis_size.x/2,-working_canvis_size.y/2])
  for(ix=[0:nx-1]){
    let(
      width = (working_canvis_size.x + spacing)/nx-spacing,
      size = [width, working_canvis_size.y, thickness])
    translate([(width+spacing)*ix,0])
      if($children > 0){
        $brick_size = size;
        children();
      } else {
        chamfered_cube(
          size,
          topChamfer = chamfer[1],
          bottomChamfer = chamfer[0]);
      }
  }
}

// Creates a slot with a small chamfer for easy insertertion
//#slotCutout(100,20,40);
//width = width of slot
//depth = depth of slot
//height = height of slot
//chamfer = chamfer size
module chamfered_cube(
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
    *rounded_cube(
      size=[size.x, size.y, size.z],
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


module brick_pattern(
  canvis_size=[31,31],
  thickness = 1,
  spacing = 1,
  border = 0,
  cell_size = [15,5],
  corner_radius = 3,
  center_weight = 3,
  offset_layers = false,
  center = true,
  rotateGrid = false){
  
  assert(is_list(canvis_size) && len(canvis_size) == 2, "canvis_size must be a list of len 2");
  assert(is_num(thickness), "thickness must be a number");
  assert(is_num(spacing), "spacing must be a number");
  assert(is_num(border), "border must be a number");
  assert(is_list(cell_size) && len(cell_size) == 2, "cell_size must be a list of len 2");
  assert(is_num(corner_radius), "corner_radius must be a number");
  assert(is_num(center_weight), "center_weight must be a number");
  assert(is_bool(offset_layers), "offset_layers must be a bool");
  assert(is_bool(center), "center must be a bool");
  assert(is_bool(rotateGrid), "rotateGrid must be a bool");

  corner_radius = min(corner_radius,cell_size.x/2, cell_size.y/2);
  
  working_canvis_size = 
    let (cs = rotateGrid ? [canvis_size.y,canvis_size.x] : canvis_size)
    border > 0 ? [cs.x-border*2,cs.y-border*2] : cs;
    
  ny = floor((working_canvis_size.y + spacing) / (cell_size.y + spacing));
  nx = floor((working_canvis_size.x + spacing) / (cell_size.x + spacing));

  function course(canvis_length, count, spacing, center_weight, half_offset=false) = 
    let(c = count - (half_offset ? 0 : 1),
    l = [for (i=[0:c]) 
    (((canvis_length+spacing)/(c) + cos((i)*360/(c))*-1*center_weight)/(half_offset && (i==0 || i==c) ? 2 : 1) - spacing)],
    suml = sum(l),
    comp = half_offset ? 1 : (canvis_length-(c)*spacing)/suml)
    [for (i=[0:c]) l[i]*comp];
    
  if(ny> 0 && nx > 0)
  translate(center ? [0,0,0] : [canvis_size.x/2,canvis_size.y/2,0])
  rotate(rotateGrid?[0,0,90]:[0,0,0])
  translate([-working_canvis_size.x/2,-working_canvis_size.y/2])
  for(iy=[0:ny-1]){
    let(h=(working_canvis_size.y + spacing)/ny-spacing)
    translate([0,(h+spacing)*iy])
    {
      bricks = course(canvis_length=working_canvis_size.x, count=nx, spacing=spacing, center_weight=center_weight, half_offset=offset_layers && iy%2==1);
      for(ix=[0:len(bricks)-1]) {
        pos = sum(bricks, end = ix-1) + spacing*ix;
        size = [bricks[ix], h, thickness];
        if(size.x > min(cell_size.x,cell_size.y)*0.5 && size.y > min(cell_size.x,cell_size.y)*0.5)
          translate([pos,0])
          if($children > 0){
            $brick_size = size;
            children();
            }
          else {
            rounded_cube(
              size = size, 
              sideRadius = corner_radius);
          }
      }
    }
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

module rotate_around_point(point=[], rotation=[]){
  translate(point)
  rotate(rotation)
  translate(-point)
  children();
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

