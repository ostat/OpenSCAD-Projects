include <toy_stack_octahedron.scad>

scenario = "stack"; //["stack", "multi", "spiral", "sidestack", "boat", "bird", "potplant", "ring", "owl", "tree", "dog", "bigdog", "frog", "bigfrog", "tower"]
showtext = true;

//Include help info in the logs
help=false;
setViewPort=true;

module end_of_customizer_opts() {}

$vpr = setViewPort ? scenario == "multi" ? [85,0,145] : [80,0,145] : $vpr;
$vpt = setViewPort ? scenario == "multi" ? [-15,30,410] :[20,65,150] : $vpt; //shows translation (i.e. won't be affected by rotate and zoom)
$vpf = setViewPort ? 25 : $vpf; //shows the FOV (Field of View) of the view [Note: Requires version 2021.01]
$vpd = setViewPort ? scenario == "multi" ? 1980 : 900 : $vpd;//shows the camera distance [Note: Requires version 2015.03]
  
s1 = 1;
s2 = 2;
s3 = 3;
s4 = 4;
s5 = 5;

//Array index
isize = 0;
ir = 1;
ip = 2;

function getScenario(scenario) = 
  scenario == "stack" ? [["Stack", false, [0,0,0],[0,0,0]],
      [9,0,[0,0,1]],
      [8,0,[0,0,2]],
      [7,0,[0,0,3]],
      [6,0,[0,0,4]],
      [5,0,[0,0,5]],
      [4,0,[0,0,6]],
      [3,0,[0,0,7]],
      [2,0,[0,0,8]],
      [1,0,[0,0,9]]]   
   : scenario == "sidestack" ? [["Side Stack", false, [0,0,50],[-0,0,-45]],
      [s5,0,[0,0,1]],
      [s4,1,[0,0,2]],
      [s3,1,[1,0,2]],
      [s2,1,[2,0,2]],
      [s1,1,[3,0,2]],
      [s3,2,[-1,0,2]],
      [s2,2,[-1,1,2]],
      [s2,2,[-1,-1,2]],
      [s1,2,[-1,2,2]],
      [s1,2,[-1,-2,2]]]
   : scenario == "boat" ? [["Boat", false, [0,0,0],[0,0,-30]],
      [s3,0,[0,0,1]],
      [s4,0,[0,0,2]],
      [s5,0,[0,0,3]],
      [s1,1,[3,0,4]],
      [s2,1,[2,0,4]],
      [s3,1,[1,0,4]],
      [s4,1,[0,0,4]],
      [s2,0,[-2,0,4]],
      [s1,0,[-2,0,5]],
      [s2,0,[-2,0,6]],
      [s1,0,[-2,0,7]],
      [s2,0,[-2,0,8]],
      [s3,2,[-2,0,11]]]
   : scenario == "bird" ? [["Bird", false, [0,0,0],[0,0,320]],
      [s3,0,[0,0,1]],
      [s5,2,[0,0,5]],
      [s4,1,[0,1,5]],
      [s3,1,[-1,1,5]],
      [s3,1,[1,1,5]],
      [s2,0,[3,2,5]],
      [s2,0,[-3,2,5]],
      [s1,0,[3,2,6]],
      [s1,0,[-3,2,6]],
      [s4,0,[0,0,8]],
      [s1,1,[-1,1,9]],
      [s1,1,[0,2,9]],
      [s1,1,[1,1,9]],
      [s2,2,[-2,0,10]],
      [s2,2,[2,0,10]]]    
  : scenario == "potplant" ? [["Pot Plant", false, [0,0,0],[0,0,45]],
      [s5,0,[0,0,1]],
      [s1,0,[0,-3,2]],
      [s2,2,[0,-2,2]],
      [s3,0,[0,1,2]],
      [s2,0,[0,-2,4]],
      [s1,0,[0,-2,5]],
      [s4,2,[0,1,5]],
      [s4,0,[0,1,7]],
      [s3,0,[0,1,8]],
      [s2,0,[0,1,9]],
      [s1,0,[0,1,10]]]
  : scenario == "ring" ? [["Ring", false, [0,0,0],[0,0,45]],
      [s2,0,[0,0,1]],
      [s4,1,[0,0,5]],
      [s3,0,[0,0,8]],
      [s1,2,[1,0,9]],
      [s1,2,[0,1,9]],
      [s1,2,[-1,0,9]],
      [s1,2,[0,-1,9]]]
  : scenario == "owl" ? [["Owl", false, [0,0,0],[0,0,45]],
      [s3,0,[0,0,1]],
      [s5,1,[0,0,5]],
      [s4,2,[1,0,5]],
      [s3,2,[1,1,5]],
      [s3,2,[1,-1,5]],
      [s2,2,[1,2,5]],
      [s2,2,[1,-2,5]],
      [s1,4,[1,3,5]],
      [s1,4,[1,-3,5]],
      [s4,0,[0,0,8]],
      [s2,1,[0,-2,10]],
      [s2,1,[0,2,10]],
      [s1,4,[2,0,9]],
      [s1,4,[1,1,9]],
      [s1,4,[1,-1,9]]] 
  : scenario == "tree" ? [["Tree", false, [0,0,0],[0,0,45]],
      [s5,0,[0,0,1]],
      [s3,0,[0,0,1]],
      [s4,2,[0,0,4]],
      [s2,0,[0,0,8]],
      [s3,0,[0,0,9]],
      [s4,0,[0,0,10]],
      [s3,2,[0,0,11]],
      [s2,1,[0,2,12]],
      [s2,1,[0,-2,12]],
      [s2,0,[0,0,14]],
      [s1,2,[0,0,15]]]
  : scenario == "dog" ? [["Dog", false, [0,0,0],[0,0,0]],
      [s3,0,[0,0,1]],
      [s2,0,[-7,0,1]],
      [s4,0,[-3,0,3]],
      [s3,1,[1,0,4]],
      [s5,1,[0,0,5]],
      [s3,1,[-7,0,4]],
      [s4,0,[0,0,8]],
      [s2,1,[0,-2,10]],
      [s2,1,[0,2,10]],
      [s1,2,[2,0,9]],
      [s1,2,[1,1,9]],
      [s1,2,[1,-1,9]]]    
  : scenario == "bigdog" ? [["Big Dog", false, [0,0,0],[0,0,0]],
      [s3,0,[0,0,1]],
      [s3,0,[-8,0,1]],
      [s5,0,[-4,0,3]],
      [s3,1,[1,0,4]],
      [s4,1,[0,0,4]],
      [s3,1,[-8,0,3]],
      [s2,0,[-4,0,4]],
      [s2,1,[-6,0,4]],
      [s1,4,[-7,0,4]],
      [s2,1,[-2,0,4]],
      [s1,4,[-1,0,4]],
      [s2,2,[-4,2,4]],
      [s1,0,[-4,3,4]],
      [s2,2,[-4,-2,4]],
      [s1,4,[-4,-3,4]],
      [s3,0,[0,0,7]],
      [s4,0,[0,0,8]],
      [s2,0,[0,0,8]],
      [s2,1,[0,-2,10]],
      [s2,1,[0,2,10]],
      [s1,4,[2,0,9]],
      [s1,4,[1,1,9]],
      [s1,4,[1,-1,9]]]
  : scenario == "frog" ? [["Frog", false, [0,0,0],[0,0,30]],
      [s3,0,[0,-3,1]],
      [s3,0,[0,3,1]],
      [s4,0,[0,0,3]],
      [s3,0,[0,0,4]],
      [s4,2,[0,0,7]],
      [s5,0,[0,0,8]],
      [s2,0,[0,-2,9]],
      [s2,0,[0,2,9]],
      [s2,1,[0,-2,11]],
      [s2,1,[0,2,11]],
      [s1,0,[2,1,9]],
      [s1,0,[2,-1,9]],
      [s1,0,[3,0,9]]]   
  : scenario == "bigfrog" ? [["Big Frog", false, [0,0,0],[0,0,30]],
      [s3,0,[0,-4,1]],
      [s3,0,[0,4,1]],
      [s1,4,[0,3,2]],
      [s1,4,[0,-3,2]],
      [s4,2,[0,-4,4]],
      [s4,2,[0,4,4]],
      [s3,2,[0,-5,4]],
      [s3,2,[0,5,4]],
      [s5,0,[0,0,3]],
      [s4,0,[0,0,4]],
      [s3,0,[0,0,5]],
      [s4,2,[0,0,8]],
      [s2,2,[0,-1,7]],
      [s2,2,[0,1,7]],
      [s5,0,[0,0,9]],
      [s2,0,[0,-2,10]],
      [s2,0,[0,2,10]],
      [s2,1,[0,-2,12]],
      [s2,1,[0,2,12]],
      [s1,4,[2,1,10]],
      [s1,4,[2,-1,10]],
      [s1,4,[3,0,10]]]
  : scenario == "tower" ? [["Tower", false, [0,0,0],[0,0,30]],
      [s3,0,[0,-3,1]],
      [s3,0,[0,3,1]],
      [s1,0,[0,4,2]],
      [s1,0,[0,-4,2]],
      [s1,0,[0,2,2]],
      [s1,0,[0,-2,2]],
      [s4,2,[0,-3,4]],
      [s4,2,[0,3,4]],
      [s5,2,[0,0,6]],
      [s4,0,[0,0,3]],
      [s3,0,[0,-3,7]],
      [s2,0,[0,-3,8]],
      [s2,2,[0,-3,10]],
      [s3,0,[0,3,7]],
      [s2,0,[0,3,8]],
      [s3,0,[0,3,9]],
      [s4,2,[0,3,12]],
      [s5,0,[0,-1,11]],
      [s3,0,[0,0,12]],
      [s2,2,[0,0,13]],
      [s2,0,[0,0,14]],
      [s1,0,[0,0,15]],
      [s2,0,[0,3,16]],
      [s1,0,[0,3,17]],
      [s2,0,[0,3,18]],
      [s1,0,[0,3,19]]]
   : scenario == "multi" ? [["multi", false, [0,0,0],[0,0,30]]]
   : []; //


selectedScenario = getScenario(scenario);


  
if(showtext)
color("LightSlateGray")
translate($vpt)
rotate($vpr)
translate([0,-160,60])
 linear_extrude(height = 0.1)
 text(selectedScenario[0][0], size=25, valign = "center", halign = "center");

function GetPos(hypotenuse, angle) = let(
  opposite = sin(angle) * hypotenuse,
  adjacent = cos(angle) * hypotenuse) [adjacent,opposite];
  
module RenderScenario(scenario){
   selectedScenario = getScenario(scenario);
  echo(selectedScenario=selectedScenario);

  rotate(selectedScenario[0][3])
  translate(selectedScenario[0][2])
  union(){
    for (i =[1:len(selectedScenario)-1])
    { 
       shape = selectedScenario[i];
       hollow = (shape[ir] != 4);
       echo(shape=shape);
        //translate(
        //  shape[ir] == 1 ? [shape[ip].x*Unit_Size/sqrt(2), shape[ip].y*Unit_Size/2, shape[ip].z*Unit_Size/sqrt(2)]
        //  : shape[ir] == 2 ? [shape[ip].x*Unit_Size/sqrt(2), shape[ip].y*Unit_Size/sqrt(2), shape[ip].z*Unit_Size/sqrt(2)]
        //  : [shape[ip].x*Unit_Size/2, shape[ip].y*Unit_Size/2, shape[ip].z*Unit_Size/sqrt(2)])
        translate([shape[ip].x*(Unit_Size+Tolerance)/sqrt(2), shape[ip].y*(Unit_Size+Tolerance)/sqrt(2), shape[ip].z*(Unit_Size+Tolerance)/sqrt(2)])
        rotate(
          shape[ir] == 1 ? [90,0,90] 
          : shape[ir] == 2 ? [90,0,0] 
          : [0,0,0])
        rotate([0,0,selectedScenario[0][1]? 0: 45])
        Shape(shape[isize], hollow=hollow);
    }
  }
}


if(scenario == "multi"){
  RenderScenario("stack");
  
  zeroang = $vpr.z;
  hyp = 350;
  l1height = 100;
  l2height = l1height+250;
  
  translate(let(pos = GetPos(hyp,zeroang+90)) [pos.x,pos.y,l1height])
  rotate([0,0,10]) RenderScenario("tower");

  translate(let(pos = GetPos(hyp,zeroang+45)) [pos.x,pos.y,l1height-30])
  rotate([0,0,0]) RenderScenario("tree");
  
  translate(let(pos = GetPos(hyp,zeroang+135)) [pos.x,pos.y,l1height-30])
  rotate([0,0,-15]) RenderScenario("potplant");
  
  translate(let(pos = GetPos(hyp+25,zeroang+180)) [pos.x,pos.y,l1height-75])
  rotate([0,0,-15]) RenderScenario("ring");
  translate(let(pos = GetPos(hyp+25,zeroang+0)) [pos.x,pos.y,l1height-75])
  rotate([0,0,-15]) RenderScenario("boat");
  
  translate(let(pos = GetPos(hyp+410,zeroang+113)) [pos.x,pos.y,l2height])
  rotate([0,0,30]) RenderScenario("bigfrog");
  translate(let(pos = GetPos(hyp+320,zeroang+135)) [pos.x,pos.y,l2height-125])
  rotate([0,0,30]) RenderScenario("frog");
  

  translate(let(pos = GetPos(hyp+410,zeroang+70)) [pos.x,pos.y,l2height])
  rotate([0,0,-15]) RenderScenario("bigdog");
  translate(let(pos = GetPos(hyp+320,zeroang+45)) [pos.x,pos.y,l2height-125])
  rotate([0,0,-45]) RenderScenario("dog");

  translate(let(pos = GetPos(hyp,zeroang+107)) [pos.x,pos.y,480])
  rotate([0,0,15]) RenderScenario("owl");
  translate(let(pos = GetPos(hyp,zeroang+73)) [pos.x,pos.y,480])
  rotate([0,0,-15]) RenderScenario("bird");

  translate(let(pos = GetPos(hyp+10,zeroang+170)) [pos.x,pos.y,620])
  rotate([0,0,0]) RenderScenario("sidestack");
  }
else{
  RenderScenario(scenario);
}
