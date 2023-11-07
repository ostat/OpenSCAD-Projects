//Render a single block
Draw_Shape = false;

// Block size
Size = 1; //[1:10]
//Should the small size be hollow, prevent choking
Hollow = false;

//Render  all bocks
Draw_Side = false;

//Render Block stack
Draw_Stack = false;

//Set to size colour
Set_Colour = true;

/* [ block setting ] */
// base unit size for the octahedron
Unit_Size = 25;
// space to add for each block size to allow a clean fit
Tolerance = 0.25;
//This will be clipped of top and bottom.
Verticle_Tolerance = 1.5; //0.1
//Radius of the corners
Corner_Radius = 1.5;

Hollow_Wall_Radius = 3;

$fn=32;

module johnsonSquarePyramid(length, r = 1)
{
  xyz = [[ length/2-r, length/2 -r, 0],
    [ -length/2+r, length/2-r, 0],
    [ length/2-r, -length/2+r, 0],
    [ -length/2+r, -length/2+r, 0],
    [ 0, 0 , length/sqrt(2)-r]
  ];
  
  hull(){
    for(position = xyz){
      translate(position)
      sphere(r=r);
    }
  }
}

module octahedron(length, r = 1, wr = 0){
  //corner positions on an octahedron
  dihedral = 109.47122; //Angle between two faces tan(a/2)=sqrt(2)
  angleBetweenPointFaces = 180-dihedral;

  C=r/sin(angleBetweenPointFaces/2); //Hyp
  cornerSetBack = sqrt(C*C/2);
  len = (length-cornerSetBack*2)/sqrt(2);
  xyz = [
    [ len, 0, 0],
    [ -len, 0, 0],
    [ 0, len, 0],
    [ 0, -len, 0],
    [ 0, 0, len],
    [ 0, 0, -len]
  ];
  rotate([0,0,45])
  intersection(){
    //Main octahedron
    hull(){
      for(position = xyz){
        translate(position)
        sphere(r=r);
      }
    }

    //build frame to create a hollow object.   
    if(wr > 0) {
      union(){
        for(a=[0:1:len(xyz) - 1]){
          for(b=[a+1:1:len(xyz) - 1]){
            if(xyz[a] != -xyz[b]) {
              hull(){
                translate(xyz[a])
                sphere(r=wr);
                
                translate(xyz[b])
                sphere(r=wr);
              }
            }
          }
        }
      }
    }
  }
}

module SideY(length, baseSize){
  hull(){
  octahedron(baseSize, r=Corner_Radius);
  translate([0,length-baseSize,0])
  octahedron(baseSize, r=Corner_Radius);
  }
}

module SideX(length, baseSize){
  hull(){
  octahedron(baseSize, r=Corner_Radius);
  translate([length-baseSize,0,0])
  octahedron(baseSize, r=Corner_Radius);
  }
}

module Shape(size, hollow = true, setcolour=true, tolerance=Tolerance, verticleTolerance=Verticle_Tolerance, cornerRadius=Corner_Radius)
{
  _size = Unit_Size*size;
  echo("Shape", size=size, Unit_Size=Unit_Size, Tolerance=Tolerance, _size=_size, hollow=hollow);
  color(setcolour ? setColour(size) : [0,0,0])
  if(size == 1) {
    octahedron(Unit_Size-tolerance, r=cornerRadius, wr = hollow ? Hollow_Wall_Radius : 0);
  }
  else {
    intersection(){
      cube([_size,_size,((Unit_Size-tolerance)/sqrt(2)-verticleTolerance)*2],center=true);
      
      translate([-(_size-(Unit_Size-tolerance))/2,-(_size-(Unit_Size-tolerance))/2,0])
      union(){
        SideY(_size, Unit_Size-tolerance);
        translate([_size-(Unit_Size-tolerance),0,0])
        SideY(_size, Unit_Size-tolerance);

        SideX(_size, Unit_Size-tolerance);
        translate([0,_size-(Unit_Size-tolerance),0])
        SideX(_size, Unit_Size-tolerance); 
      }
    }
  }
}

function factorial(n) = n == 0 ? 0 : n + factorial(n - 1);
function setColour(n) = 
  n == 1 ? "white"
  : n == 2 ? "yellow" 
  : n == 3 ? "red" 
  : n == 4 ? "green"
  : n == 5 ? "blue"
  : n == 6 ? "aqua" 
  : n == 7 ? "orange" 
  : n == 8 ? "pink"
  : n == 9 ? "purple"
  : str("#",n,n,n);

module drawSide(){
  translate([0,Unit_Size,0])
  Shape(1, true);
  
  for (i =[1:9])
  {
    xshift = (factorial(i)-1)*Unit_Size+factorial(i-1)*Tolerance;
    translate([xshift,0,0])
    Shape(i, setcolour=Set_Colour);
  }
 }

module drawStack(){
  maxi = 9;
  for (i = [1:maxi])
  {
    //xshift = (-1*(i-1)*Unit_Size+(size-1)*Tolerance)/2;
    translate([0,0,(maxi-i)*Unit_Size/sqrt(2)])
    Shape(i, setcolour=Set_Colour);
  }
}

if(Draw_Shape) {
  Shape(Size, Hollow, setcolour = Set_Colour);
} else if (Draw_Stack){
  drawStack();
} else if(Draw_Side){
  drawSide();
}