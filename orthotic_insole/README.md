# Orthotic Insole Generator

An OpenSCAD model that generates a custom orthotic insole for 3D printing in TPU. You enter the foot measurements and the support you want (arch, heel cup, posting, metatarsal pad) and it produces a single solid STL ready to slice.

The outline is based on a standard insole shape, scaled to the foot length and to the heel, midfoot and ball widths. The insole can be made as a full-length piece, or as a rear part (heel and arch) or front part on its own. Split parts get a rounded, tapered end at the cut so they sit flat in the shoe.

The model is built flat on the bed with the top surface up, so it prints as-is with no supports. Stiffness is controlled with slicer infill. A gyroid infill at 15-25% is a reasonable starting point.

This is not a medical device. For a real prescription, use measurements from a podiatrist or orthotist.

## Usage

1. Open `orthotic_insole.scad` in OpenSCAD (tested with 2024.05).
2. Open the Customizer (Window > Customizer) and set the values below.
3. Render with F6 and export as STL.

Render takes about a second in solid mode. Lattice mode takes 15-30 seconds.

## Options

All lengths are in millimetres. Positions given as a fraction run from 0 at the back of the heel to 1 at the toe.

### Output

| Option | Default | Description |
|---|---|---|
| `foot_side` | right | `right`, `left` or `both`. The left insole is a mirror of the right. `both` puts a left and right pair side by side in one STL, arches facing each other. |
| `pair_gap` | 10 | Gap between the two insoles when `foot_side` is `both`. |
| `part` | full | `full`, `rear` (heel and arch only) or `front` (forefoot only). |
| `split_position` | 0.60 | Where the rear and front parts are split, as a fraction of length. Kept between about 0.3 and 0.67 so the rounded end fits. |
| `infill_mode` | solid | `solid` leaves the infill to the slicer (recommended). `lattice` models a grid inside the STL. |

### Support preset

| Option | Default | Description |
|---|---|---|
| `preset` | custom | `custom`, `flat_foot`, `neutral`, `high_arch`, `overpronation` or `supination`. Any preset other than custom overrides arch height and spread, heel cup heights, posting and metatarsal pad height. |

Preset values:

| Preset | Arch height | Arch spread | Medial post | Lateral post | Cup medial | Cup lateral | Met pad |
|---|---|---|---|---|---|---|---|
| flat_foot | 16 | 0.32 | 2 | 0 | 10 | 10 | 0 |
| neutral | 10 | 0.28 | 0 | 0 | 10 | 10 | 0 |
| high_arch | 14 | 0.40 | 0 | 0 | 12 | 12 | 3 |
| overpronation | 14 | 0.30 | 3 | 0 | 12 | 10 | 0 |
| supination | 10 | 0.38 | 0 | 3 | 10 | 14 | 3 |

### Foot size

| Option | Default | Description |
|---|---|---|
| `shoe_size` | Custom | Standard shoe size, UK 3 to 14 in half sizes. Each entry shows the UK, US and AU equivalents for men and women. Picking a size sets the foot length and all three widths and overrides the measurements below. Leave on Custom to use your own measurements. |
| `foot_length` | 265 | Heel to longest toe. |
| `length_allowance` | 5 | Added to the length so the toes are not pressed against the shoe. |
| `ball_width` | 98 | Width across the ball of the foot. |
| `midfoot_width` | 66 | Width at the narrowest part of the arch. |
| `heel_width` | 64 | Width of the heel. |
| `toe_tip_position` | 0.33 | Where the toe tip sits across the width. 0 is the medial (big toe) edge, 0.5 is the centre. |

Size conversions used: US men's is UK + 1, US women's is UK + 2, AU men's is the same as UK and AU women's is UK + 2. Foot length is 196 mm + 8.47 mm per UK size (a UK size step is a third of an inch), so UK 8 is about 264 mm. The widths keep the proportions of an average foot, so a size is a good starting point but measuring the actual foot will always fit better, particularly for narrow or wide feet. Brands vary, so check against the shoe if in doubt.

### Base thickness

| Option | Default | Description |
|---|---|---|
| `base_thickness` | 2.5 | Thickness of the forefoot and other flat areas. |
| `heel_lift` | 0 | Extra thickness under the heel, tapering forward. Used for leg length differences or Achilles relief. |
| `heel_drop` | 0 | Lowers the whole heel, seat and cup walls together, tapering forward. Useful for shoes with little room at the heel. The seat will not go below `min_thickness`. |
| `heel_lift_length` | 100 | Distance from the back of the heel at which the lift or drop has tapered out. |
| `min_thickness` | 1.0 | The thinnest the insole is allowed to get, for example under a lowered heel. |
| `edge_radius` | 1.2 | Radius of the rounded top edge around the outline. |

### Arch support

| Option | Default | Description |
|---|---|---|
| `arch_height` | 12 | Height of the medial arch support. Roughly 8 is low, 12-15 medium, 20 or more high. |
| `arch_start` | 0.18 | Where the arch support begins. |
| `arch_peak` | 0.40 | Where it is highest. |
| `arch_end` | 0.64 | Where it ends. |
| `arch_medial_bias` | 0.12 | Position of the arch crest across the foot. 0 is the medial edge, 0.5 the centre. |
| `arch_spread` | 0.28 | How far the support reaches toward the lateral side. Small values give a narrow ridge, large values a full-contact arch. |

### Heel cup

| Option | Default | Description |
|---|---|---|
| `cup_height_medial` | 10 | Wall height on the medial side. This wall carries forward into the arch. |
| `cup_height_lateral` | 12 | Wall height on the lateral side. |
| `cup_length` | 95 | How far forward the lateral wall runs before it fades out. |
| `cup_slope_width` | 13 | Width of the sloped part of the wall. Smaller makes a steeper, tighter cup. |
| `rim_width` | 3 | Width of the rounded top of the wall, so the rim has some body instead of a thin lip. |

### Metatarsal pad

| Option | Default | Description |
|---|---|---|
| `met_pad_height` | 0 | Height of the dome behind the ball of the foot. 0 turns it off. |
| `met_pad_position` | 0.58 | Position along the foot. |
| `met_pad_length` | 30 | Length of the pad. |
| `met_pad_width` | 0.55 | Width as a fraction of the insole width at that point. |

If you print a rear part with a metatarsal pad, keep the pad clear of the split. A pad inside the taper at the cut end gets flattened.

### Heel posting

| Option | Default | Description |
|---|---|---|
| `medial_post` | 0 | Raises the medial side of the heel. Used for overpronation. |
| `lateral_post` | 0 | Raises the lateral side of the heel. Used for supination. |
| `post_length` | 100 | How far forward the wedge runs before it fades out. |

### Rear / front part ends

These only apply when `part` is `rear` or `front`.

| Option | Default | Description |
|---|---|---|
| `cut_end_thickness` | 1.2 | Thickness at the cut end. |
| `cut_taper_length` | 30 | Length over which the part thins down to that thickness. 0 keeps full thickness to the end. |
| `cut_round` | 15 | Radius of the corners where the cut end meets the sides. |

### Lattice mode

These only apply when `infill_mode` is `lattice`. The grid is enclosed by a floor, an outer wall and a top skin, so the cells are sealed.

| Option | Default | Description |
|---|---|---|
| `pitch_support` | 5 | Grid cell size in the heel and arch. Smaller is stiffer. |
| `pitch_soft` | 8 | Grid cell size in the forefoot. Larger is softer. |
| `support_zone` | 0.62 | Fraction of the length, from the heel, that uses the stiffer grid. |
| `strut` | 1.2 | Grid wall thickness. Use 2-3 times your line width. |
| `grid_angle` | 45 | Grid angle in degrees. |
| `wall` | 1.2 | Outer wall thickness. |
| `floor_thickness` | 0.8 | Solid bottom layer. |
| `top_skin` | 1.2 | Solid top layer, following the contoured surface. |

### Quality

| Option | Default | Description |
|---|---|---|
| `resolution` | 2.5 | Mesh spacing along the outline. 1.5 is smoother, 3-4 is faster. |
| `rings` | 30 | Number of mesh rings from the edge in to the centre line. More gives a smoother heel cup. |
