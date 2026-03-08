module rotate_around_point(point=[], rotation=[]){
  translate(point)
  rotate(rotation)
  translate(-point)
  children();
}

module tz(z) {
  translate([0, 0, z]) children();
}

module PartialCylinder(h, r, part) {
    rotate_extrude(angle = part)
        square([r, h]);
}

module cylinder_printable(h=10,r=1,d,center=false){
  r = is_num(d) ? d/2 : r;
  d=2*r;

  flat_top_width = d/2.5;
  flat_top_height = d/2+0.5;

  translate(center ? [0,0,0] : [0,0,h/2])
  hull(){
    //Printable Cylinder
    cylinder(h=h,d=d, center=true);
    translate([-flat_top_width/2,d/2-flat_top_height,-h/2])
      cube([flat_top_width,flat_top_height,h]);
  }
}
