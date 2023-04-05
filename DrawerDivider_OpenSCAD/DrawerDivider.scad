
height = 25;
length = 50;
wallThickness = 2;
dividerThickness = 10;


fillTop = 1;
fillBottom = 0;
fillBack = 1;
fudge = 0.02;

layout = length * 2.5;
translate([0,0,0])
Corner(height, length, wallThickness, dividerThickness, fillTop, fillBottom, fillBack);

translate([layout, 0,0])
Tjunction(height, length, wallThickness, dividerThickness, fillTop, fillBottom, fillBack);

translate([layout*2,0,0])
Xjunction(height, length, wallThickness, dividerThickness, fillTop, fillBottom, fillBack);

translate([layout*3,0,0])
Yjunction(height, length, wallThickness, dividerThickness, fillTop, fillBottom, fillBack);

translate([layout*4,0,0])
bend(height, length, wallThickness, dividerThickness, fillTop, fillBottom, fillBack);


translate([0,layout,0])
Corner(height, length, wallThickness, dividerThickness, 0, fillBottom, 1);

translate([layout,layout,0])
Tjunction(height, length, wallThickness, dividerThickness, 0, fillBottom, 1);

translate([layout*2,layout,0])
Xjunction(height, length, wallThickness, dividerThickness, 0, fillBottom, 1);

translate([layout*3,layout,0])
Yjunction(height, length, wallThickness, dividerThickness, 0, fillBottom, 1);

translate([layout*4,layout,0])
bend(height, length, wallThickness, dividerThickness, 0, fillBottom, 1);

module bend(
  height,
  length,
  wallThickness,
  dividerThickness,
  fillTop = 1,
  fillBottom = 1,
  fillBack = 0,
)
{
  sides = [
    [0,fillTop,fillBottom,fillBack],
    [135,fillTop,fillBottom,fillBack*2]];
  connector(
    height = height,
    length = length,
    wallThickness = wallThickness,
    dividerThickness = dividerThickness, 
    sides = sides
  );
}


module Yjunction(
  height,
  length,
  wallThickness,
  dividerThickness,
  fillTop = 1,
  fillBottom = 1,
  fillBack = 0,
)
{
  sides = [
    [0,fillTop,fillBottom,fillBack],
    [45,fillTop,fillBottom,fillBack*2],
    [180,fillTop,fillBottom,fillBack]];
  connector(
    height = height,
    length = length,
    wallThickness = wallThickness,
    dividerThickness = dividerThickness, 
    sides = sides
  );
}

module Tjunction(
  height,
  length,
  wallThickness,
  dividerThickness,
  fillTop = 1,
  fillBottom = 1,
  fillBack = 0,
)
{
  sides = [
    [0,fillTop,fillBottom,fillBack],
    [90,fillTop,fillBottom,fillBack],
    [180,fillTop,fillBottom,fillBack]];
  connector(
    height = height,
    length = length,
    wallThickness = wallThickness,
    dividerThickness = dividerThickness, 
    sides = sides
  );
}

module Xjunction(
  height,
  length,
  wallThickness,
  dividerThickness,
  fillTop = 1,
  fillBottom = 1,
  fillBack = 0,
)
{
  sides = [
    [0,fillTop,fillBottom,fillBack],
    [90,fillTop,fillBottom,fillBack],
    [180,fillTop,fillBottom,fillBack],
    [270,fillTop,fillBottom,fillBack]];
  connector(
    height = height,
    length = length,
    wallThickness = wallThickness,
    dividerThickness = dividerThickness, 
    sides = sides
  );
}

module Corner(
  height,
  length,
  wallThickness,
  dividerThickness,
  fillTop = 1,
  fillBottom = 1,
  fillBack = 0,
)
{
  sides = [[0,fillTop,fillBottom,fillBack],[90,fillTop,fillBottom,fillBack]];
  connector(
    height = height,
    length = length,
    wallThickness = wallThickness,
    dividerThickness = dividerThickness, 
    sides = sides
  );
}


module connector(
  height,
  length,
  wallThickness,
  dividerThickness,
  sides
) {
  thickness = dividerThickness + wallThickness*2;
  
  difference() {
    union(){

      translate([-thickness/2,-thickness/2,0])
      cube([thickness, thickness, height]);
  
      for (i = [ 0 : len(sides) - 1 ]) 
      {
        side=sides[i];
        angle = side[0];
        rotate(angle)
        translate([0,-thickness/2,0])
        cube([length, thickness, height]);
      }
    }
  
    for (i = [ 0 : len(sides) - 1 ]) 
    {
      side=sides[i];
      fillTop = side[1];
      fillBottom = side[2];
      fillBack = side[3];
      
      bottom = fillBottom * wallThickness + (fillBottom > 0 ? fudge : 0);
      top = fillTop * wallThickness + + (fillBottom > 0 ? fudge : 0);
      back = fillBack * dividerThickness;
      dividerHeight = height + fudge*4 - bottom - top;
      angle = side[0];
      rotate(angle)
      translate([0,-thickness/2,-fudge])
      translate([back,wallThickness,bottom])
      cube([length+back+fudge*2, dividerThickness ,dividerHeight +fudge]);
    }
  }
}