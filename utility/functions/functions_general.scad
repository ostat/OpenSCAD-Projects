include <functions_dictionary.scad>
include <functions_array.scad>
include <functions_custom_config.scad>
//TODO should not have modules in the functions
include <module_conditional.scad>

/*
U+1F7E5 🟥 LARGE RED SQUARE
U+1F7E6 🟦 LARGE BLUE SQUARE
U+1F7E7 🟧 LARGE ORANGE SQUARE
U+1F7E8 🟨 LARGE YELLOW SQUARE
U+1F7E9 🟩 LARGE GREEN SQUARE
U+1F7EA 🟪 LARGE PURPLE SQUARE
U+1F7EB 🟫 LARGE BROWN SQUARE
U+2B1B ⬛ BLACK LARGE SQUARE
U+2B1C ⬜ WHITE LARGE SQUARE
*/

function color_from_list(index) =
let(
  colours = ["white","red","blue","Green","pink","orange","purple","black", "Coral", "Gray", "Teal"],
  mod_index = index%len(colours)
) colours[mod_index];

module assert_openscad_version(){
  assert(
      version()[0]>2022 //OpenSCAD version
      || version()[0]<1000 //For non OpenSCAD like PythonSCAD
      ,"Gridfinity Extended requires an OpenSCAD version greater than 2022 https://openscad.org/downloads. Use Development Snapshots if the release version is still 2021.01 https://openscad.org/downloads.html#snapshots.");
}

//round a number to a decimal with a defined number of significant figures
// value: the number to be rounded
// sigFigs: the number of significant figures to round to (default: 0)
function roundtoDecimal(value, sigFigs = 0) =
  assert(is_num(value), "value must be a number")
  assert(is_num(sigFigs) && sigFigs >= 0, "sigFigs must be a number")
  let(
    sigFigs = round(sigFigs),
    factor = 10^round(sigFigs))
    sigFigs == 0
      ? round(value)
      : round(value*factor)/factor;

// Gets one value base on another.
// user_value: the value provided by the user
// base_value: the base value to compare against
// default_value: the default value if user_value is 0 (optional)
// max_value: the maximum value allowed (optional)
function get_related_value(user_value, base_value, default_value, max_value) =
  let(
      max_value = is_undef(max_value) ? base_value : max_value,
      default = is_undef(default_value) ? base_value : default_value,
      calculated = user_value == 0 ? default :
      user_value < 0 ? base_value/abs(user_value) : user_value)
      min(calculated, max_value);