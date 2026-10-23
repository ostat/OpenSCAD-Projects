// ====================================================================
//  PARAMETRIC ORTHOTIC INSOLE  -  for TPU printing
// ====================================================================
//  Coordinate system (before mirroring, RIGHT foot, seen from above):
//     +Y = toward the toes, Y=0 = back of the heel
//     -X = medial (big-toe / arch) side,  +X = lateral (little-toe) side
//  The part is built flat on Z=0, top surface up -> print it as-is.
//
//  Works with the OpenSCAD Customizer (Window > Customizer).
//  The top surface is meshed directly on the outline (rings running
//  from the edge in to a centre spine), so the rim follows the outline
//  exactly and the solid insole needs no boolean operations.
//
//  NOT medical advice: for real orthotic prescriptions work with a
//  podiatrist / orthotist and use their measurements.
// ====================================================================

/* [Output] */
// Which foot (left = mirrored right). both = a left and right pair side by side
foot_side = "right";            // [right, left, both]
// Gap between the two insoles when foot_side is both (mm)
pair_gap = 10;
// Full insole, rear part only (heel + arch), or front part only
part = "full";                  // [full, rear, front]
// Where the rear/front split is, as fraction of insole length
split_position = 0.60;          // [0.3:0.01:0.75]
// solid = slicer makes the infill (recommended) / lattice = grid is modelled in the STL
infill_mode = "solid";          // [solid, lattice]

/* [Support preset] */
// Presets override arch, heel cup, posting and met pad values below. "custom" uses your own values.
preset = "custom";              // [custom, flat_foot, neutral, high_arch, overpronation, supination]

/* [Foot size] */
// Standard shoe size. Sets the foot length and all three widths, overriding the measurements below
shoe_size = 0;                  // [0:Custom (use measurements below), 3:UK 3 / US M4 W5 / AU M3 W5, 3.5:UK 3.5 / US M4.5 W5.5 / AU M3.5 W5.5, 4:UK 4 / US M5 W6 / AU M4 W6, 4.5:UK 4.5 / US M5.5 W6.5 / AU M4.5 W6.5, 5:UK 5 / US M6 W7 / AU M5 W7, 5.5:UK 5.5 / US M6.5 W7.5 / AU M5.5 W7.5, 6:UK 6 / US M7 W8 / AU M6 W8, 6.5:UK 6.5 / US M7.5 W8.5 / AU M6.5 W8.5, 7:UK 7 / US M8 W9 / AU M7 W9, 7.5:UK 7.5 / US M8.5 W9.5 / AU M7.5 W9.5, 8:UK 8 / US M9 W10 / AU M8 W10, 8.5:UK 8.5 / US M9.5 W10.5 / AU M8.5 W10.5, 9:UK 9 / US M10 W11 / AU M9 W11, 9.5:UK 9.5 / US M10.5 W11.5 / AU M9.5 W11.5, 10:UK 10 / US M11 W12 / AU M10 W12, 10.5:UK 10.5 / US M11.5 W12.5 / AU M10.5 W12.5, 11:UK 11 / US M12 W13 / AU M11 W13, 11.5:UK 11.5 / US M12.5 W13.5 / AU M11.5 W13.5, 12:UK 12 / US M13 W14 / AU M12 W14, 12.5:UK 12.5 / US M13.5 W14.5 / AU M12.5 W14.5, 13:UK 13 / US M14 W15 / AU M13 W15, 13.5:UK 13.5 / US M14.5 W15.5 / AU M13.5 W15.5, 14:UK 14 / US M15 W16 / AU M14 W16]
// Heel to longest toe (mm)
foot_length = 265;
// Extra length added so the toes are not jammed against the shoe (mm)
length_allowance = 5;
// Width across the ball of the foot (mm)
ball_width = 98;
// Width at the narrowest part of the arch (mm)
midfoot_width = 66;
// Width of the heel (mm)
heel_width = 64;
// Where the toe tip sits across the ball, 0 = medial edge, 0.5 = centre
toe_tip_position = 0.33;        // [0.15:0.01:0.5]

/* [Base thickness] */
// Thickness of the forefoot / flat areas (mm)
base_thickness = 2.5;
// Extra thickness under the heel, tapering forward (mm) e.g. leg length difference, achilles relief
heel_lift = 0;
// Lowers the whole heel (seat and cup walls), tapering forward (mm). For shoes with little room at the heel
heel_drop = 0;                  // [0:0.5:10]
// Distance from the heel where the lift / drop has tapered to zero (mm)
heel_lift_length = 100;
// Thinnest the insole may get anywhere, e.g. under a lowered heel (mm)
min_thickness = 1.0;            // [0.6:0.1:2]
// Radius of the rounded top edge around the outline (mm)
edge_radius = 1.2;              // [0:0.1:3]

/* [Arch support] */
// Height of the medial arch support (mm). ~0 flat, 8 low, 12-15 medium, 20+ high
arch_height = 12;
// Where the arch support starts / peaks / ends, as fraction of length
arch_start = 0.18;              // [0.05:0.01:0.5]
arch_peak = 0.40;               // [0.1:0.01:0.7]
arch_end = 0.64;                // [0.3:0.01:0.8]
// Position of the arch crest across the foot: 0 = medial edge, 0.5 = centre
arch_medial_bias = 0.12;        // [0:0.01:0.6]
// How far the arch support reaches toward the lateral side: small = narrow ridge, large = full-contact
arch_spread = 0.28;             // [0.1:0.01:0.6]

/* [Heel cup] */
// Wall height at the medial side of the heel (mm). Continues forward into the arch
cup_height_medial = 10;
// Wall height at the lateral side of the heel (mm)
cup_height_lateral = 12;
// How far forward the lateral cup wall runs before it has faded out (mm)
cup_length = 95;
// Width of the cup wall slope, measured in from the rim (mm). Smaller = steeper wall
cup_slope_width = 13;
// Width of the rounded top of the cup wall (mm). Gives the rim body instead of a thin lip
rim_width = 3;                  // [1:0.5:6]

/* [Metatarsal pad] */
// Height of the dome behind the ball of the foot (mm), 0 = off
met_pad_height = 0;
// Position along the foot (fraction of length)
met_pad_position = 0.58;        // [0.4:0.01:0.75]
// Length of the pad (mm)
met_pad_length = 30;
// Width of the pad as fraction of local insole width
met_pad_width = 0.55;           // [0.2:0.01:0.9]

/* [Heel posting (wedges)] */
// Raise the medial side of the heel - helps overpronation (mm)
medial_post = 0;
// Raise the lateral side of the heel - helps supination (mm)
lateral_post = 0;
// How far forward the wedge runs before fading out (mm)
post_length = 100;

/* [Rear / front part ends] */
// Thickness at the cut end when part is rear or front (mm)
cut_end_thickness = 1.2;
// Length over which the part tapers down to that thickness (mm), 0 = no taper
cut_taper_length = 30;
// Corner radius where the cut end meets the sides (mm)
cut_round = 15;                 // [5:1:30]

/* [Lattice mode only] */
// Cell size of the grid in the heel/arch zone (mm), smaller = stiffer
pitch_support = 5;
// Cell size of the grid in the forefoot zone (mm), larger = softer
pitch_soft = 8;
// Fraction of length (from heel) that uses the stiffer grid
support_zone = 0.62;            // [0.3:0.01:0.9]
// Grid wall thickness (mm) - use 2-3x your line width
strut = 1.2;
// Grid angle (degrees)
grid_angle = 45;                // [0:5:90]
// Outer wall thickness (mm)
wall = 1.2;
// Solid bottom layer (mm)
floor_thickness = 0.8;
// Solid top layer (mm)
top_skin = 1.2;

/* [Quality] */
// Mesh spacing along the outline (mm). 1.5 = smoother, 3 = faster
resolution = 2.5;               // [1.5:0.5:4]
// Number of rings from the edge in to the centre line
rings = 30;                     // [12:1:50]

/* [Hidden] */
// ---------------------------------------------------------------------
//  Presets:  name, arch_h, arch_spread, med_post, lat_post, cup_med, cup_lat, met_pad
// ---------------------------------------------------------------------
PRESETS = [
  ["flat_foot",      16, 0.32, 2, 0, 10, 10, 0],
  ["neutral",        10, 0.28, 0, 0, 10, 10, 0],
  ["high_arch",      14, 0.40, 0, 0, 12, 12, 3],
  ["overpronation",  14, 0.30, 3, 0, 12, 10, 0],
  ["supination",     10, 0.38, 0, 3, 10, 14, 3]
];
function find_idx(n, t, i = 0) = i >= len(t) ? -1 : (t[i][0] == n ? i : find_idx(n, t, i + 1));
PIDX = find_idx(preset, PRESETS);
function pv(k, custom) = (preset == "custom" || PIDX < 0) ? custom : PRESETS[PIDX][k];

arch_h   = pv(1, arch_height);
arch_sp  = pv(2, arch_spread);
med_post = pv(3, medial_post);
lat_post = pv(4, lateral_post);
cup_med  = pv(5, cup_height_medial);
cup_lat  = pv(6, cup_height_lateral);
met_h    = pv(7, met_pad_height);

// ---------------------------------------------------------------------
//  Helpers
// ---------------------------------------------------------------------
// Shoe size -> foot measurements.  One UK size is 1/3 inch of length; the
// widths keep the proportions of the default 265 mm foot.
FOOT_L  = shoe_size > 0 ? 196 + 8.467 * shoe_size : foot_length;
BALL_W  = shoe_size > 0 ? FOOT_L * 98 / 265 : ball_width;
MID_W   = shoe_size > 0 ? FOOT_L * 66 / 265 : midfoot_width;
HEEL_W  = shoe_size > 0 ? FOOT_L * 64 / 265 : heel_width;

L = FOOT_L + length_allowance;

function clampv(v, a, b) = min(max(v, a), b);
function smooth(e0, e1, x) = let(k = clampv((x - e0) / max(e1 - e0, 0.0001), 0, 1)) k * k * (3 - 2 * k);
function lerp2(a, b, f) = a + (b - a) * f;
function unit(v) = v / norm(v);
// smooth max(a, b): rounds the corner over a band of width k
function smax(a, b, k) = let(h = clampv(0.5 + 0.5 * (a - b) / k, 0, 1)) lerp2(b, a, h) + k * h * (1 - h);

// 5-tap smoothed linear lookup (removes kinks from the outline tables)
function sl(t, tab, d) =
  (lookup(t - 2*d, tab) + 2*lookup(t - d, tab) + 3*lookup(t, tab)
   + 2*lookup(t + d, tab) + lookup(t + 2*d, tab)) / 9;

// ---------------------------------------------------------------------
//  Outline
// ---------------------------------------------------------------------
//  Anatomical template of a right insole, 270 mm long, heel centre on
//  x = 0.  Between REF_YH (widest point of the heel) and REF_YT (start of
//  the toe curve) each side is a function x(y).  Behind REF_YH the heel is
//  a half-ellipse, in front of REF_YT the toe is a pair of Hermite curves
//  through the toe tip.  The template is scaled to the foot length and,
//  zone by zone, to the heel / midfoot / ball widths.
REF_L  = 270;
REF_YH = 33;
REF_YT = 222;
//          y     medial  lateral
REF_SIDES = [
  [  0, -32.5, 32.5],
  [ 33, -32.5, 32.5],
  [ 50, -32.3, 33.0],
  [ 70, -31.0, 34.3],
  [ 90, -29.0, 35.8],
  [110, -28.3, 37.5],
  [130, -31.5, 40.0],
  [150, -38.0, 44.0],
  [170, -45.0, 47.6],
  [185, -48.5, 48.8],
  [200, -49.0, 48.6],
  [212, -48.2, 46.0],
  [222, -46.5, 42.0],
  [234, -44.0, 35.5],   // beyond REF_YT: only steers the smoothing
  [246, -40.5, 27.0]
];
REF_MED = [for (r = REF_SIDES) [r[0], r[1]]];
REF_LAT = [for (r = REF_SIDES) [r[0], r[2]]];
// template widths at the heel, the narrowest midfoot point and the ball
// (as measured on the smoothed outline)
REF_HW = 65;
REF_MW = 66.4;
REF_BW = 97.1;

KY = L / REF_L;
// width scale factor along the (template) length; smoothstep between the
// heel, midfoot and ball zones so each zone gets exactly its width
function wsc(yr) =
  yr < 110 ? lerp2(HEEL_W / REF_HW, MID_W / REF_MW, smooth(45, 110, yr))
           : lerp2(MID_W / REF_MW, BALL_W / REF_BW, smooth(110, 180, yr));

function xmed(y) = let(yr = y / KY) sl(yr, REF_MED, 6) * wsc(yr);
function xlat(y) = let(yr = y / KY) sl(yr, REF_LAT, 6) * wsc(yr);

YH = REF_YH * KY;
YT = REF_YT * KY;

// heel half-ellipse
HC = [(xmed(YH) + xlat(YH)) / 2, YH];
HA = (xlat(YH) - xmed(YH)) / 2;
function heel_pt(a) = [HC.x + HA * cos(a), HC.y + YH * sin(a)];

// toe: Hermite curves medial end -> tip -> lateral end, u = 0..2
TIP = [lerp2(xmed(0.69 * L), xlat(0.69 * L), toe_tip_position), L];
PM  = [xmed(YT), YT];
PL  = [xlat(YT), YT];
TM  = unit([xmed(YT + 0.5) - xmed(YT - 0.5), 1]);       // forward along medial edge
TL  = -unit([xlat(YT + 0.5) - xlat(YT - 0.5), 1]);      // backward along lateral edge
function herm(p0, m0, p1, m1, t) =
  let(t2 = t * t, t3 = t2 * t)
  (2*t3 - 3*t2 + 1) * p0 + (t3 - 2*t2 + t) * m0 + (-2*t3 + 3*t2) * p1 + (t3 - t2) * m1;
// end cap through q, u = 0..2: p0 (tangent t0 * m0) -> q (tangent tq * mq) -> p1 (tangent t1 * m1)
function cap(p0, t0, m0, q, tq, mq, p1, t1, m1, u) =
  u <= 1 ? herm(p0, t0 * m0, q, tq * mq, u) : herm(q, tq * mq, p1, t1 * m1, u - 1);
function toe_pt(u) =
  cap(PM, TM, 1.15 * norm(TIP - PM), TIP, [1, 0], u <= 1 ? 1.15 * norm(TIP - PM) : 1.15 * norm(PL - TIP),
      PL, TL, 1.15 * norm(PL - TIP), u);

// ---------------------------------------------------------------------
//  Rear / front parts: the cut end is a rounded cap of its own
// ---------------------------------------------------------------------
CUT = clampv(split_position * L, YH + cut_round + 10, YT - cut_round - 10);
// the straight sides run from Y0 to Y1, the caps close the shape beyond them
Y0 = part == "front" ? CUT + cut_round : YH;
Y1 = part == "rear"  ? CUT - cut_round : YT;
function med_dir(y) = unit([xmed(y + 0.5) - xmed(y - 0.5), 1]);   // forward along medial edge
function lat_dir(y) = unit([xlat(y + 0.5) - xlat(y - 0.5), 1]);   // forward along lateral edge
// cut cap, u = 0..2 from medial to lateral: each side edge is extended to
// the cut line and the corner is filleted with a circular arc (as a cubic
// Hermite), then the cut runs straight across between the two fillets.
// dir = +1 for a cap in front of the sides (rear part), -1 behind (front part)
//   fillet of a corner turning by angle phi, tangent length d: [radius, Hermite tangent length]
function fillet(phi, d) = let(rr = d / tan(phi / 2)) [rr, 4 * tan(phi / 4) * rr];
function cut_cap(y, dir, u) =
  let(r  = cut_round,
      t0 = dir * med_dir(y),  p0 = [xmed(y), y],
      t1 = -dir * lat_dir(y), p1 = [xlat(y), y],
      d0 = r / abs(t0.y),     d1 = r / abs(t1.y),
      a  = p0 + t0 * d0 + [d0, 0],          // medial fillet ends on the cut line
      b  = p1 - t1 * d1 - [d1, 0],          // lateral fillet starts on the cut line
      f0 = fillet(acos(t0.x), d0),
      f1 = fillet(acos(t1.x), d1),
      l0 = f0[0] * acos(t0.x) * PI / 180,   // arc lengths, to space the points evenly
      l1 = f1[0] * acos(t1.x) * PI / 180,
      lm = max(b.x - a.x, 0.01),
      k  = u / 2 * (l0 + lm + l1))
  k < l0      ? herm(p0, t0 * f0[1], a, [1, 0] * f0[1], k / l0) :
  k < l0 + lm ? lerp2(a, b, (k - l0) / lm) :
                herm(b, [1, 0] * f1[1], p1, t1 * f1[1], (k - l0 - lm) / l1);

// start cap (u = 0 medial, 1 back, 2 lateral) and end cap (0 medial, 1 front, 2 lateral)
function start_pt(u) = part == "front" ? cut_cap(Y0, -1, u) : heel_pt(180 + 90 * u);
function end_pt(u)   = part == "rear"  ? cut_cap(Y1,  1, u) : toe_pt(u);

// ---------------------------------------------------------------------
//  Perimeter (counter-clockwise from above) and centre spine
// ---------------------------------------------------------------------
NS = max(8, ceil((Y1 - Y0) / resolution));                // spine segments
NH = max(6, ceil(norm(start_pt(1) - start_pt(0)) * 1.2 / resolution));  // points per start-cap half
NT = max(8, ceil(norm(end_pt(1) - end_pt(0)) * 1.2 / resolution));      // points per end-cap half
function ys(s) = Y0 + (Y1 - Y0) * s / NS;

SPINE = [for (s = [0:NS]) [(xmed(ys(s)) + xlat(ys(s))) / 2, ys(s)]];
// half width at each spine point = distance from spine to edge
SPHW  = [for (s = [0:NS]) (xlat(ys(s)) - xmed(ys(s))) / 2];

// each entry: [x, y, spine index]
PER = concat(
  [for (i = [0:NH-1])      concat(start_pt(1 + i / NH), 0)],
  [for (s = [0:NS])        [xlat(ys(s)), ys(s), s]],
  [for (j = [1:2*NT-1])    concat(end_pt(2 - j / NT), NS)],
  [for (s = [NS:-1:0])     [xmed(ys(s)), ys(s), s]],
  [for (i = [1:NH-1])      concat(start_pt(i / NH), 0)]
);
NP = len(PER);

module outline2d() polygon([for (p = PER) [p[0], p[1]]]);

// ---------------------------------------------------------------------
//  Height field  H(x, y, d)  =  top surface height in mm
//  d = distance in from the outline edge
// ---------------------------------------------------------------------
function H(x, y, d) =
  let(
    t    = clampv(y / L, 0, 1),
    yc   = clampv(y, YH, YT),
    xm   = xmed(yc),
    xl   = xlat(yc),
    s    = clampv((x - xm) / max(xl - xm, 1), 0, 1),  // 0 = medial edge, 1 = lateral edge

    // heel lift / drop
    lift = (heel_lift - heel_drop) * (1 - smooth(0.3 * heel_lift_length, heel_lift_length, y)),

    // medial longitudinal arch: crest near the medial edge, falling off laterally
    u     = clampv((t - arch_start) / max(arch_end - arch_start, 0.01), 0, 1),
    pk    = clampv((arch_peak - arch_start) / max(arch_end - arch_start, 0.01), 0.05, 0.95),
    a_lng = (u <= 0 || u >= 1) ? 0 :
            (u < pk ? 0.5 - 0.5 * cos(180 * u / pk)
                    : 0.5 + 0.5 * cos(180 * (u - pk) / (1 - pk))),
    a_lat = s > arch_medial_bias
              ? exp(-pow((s - arch_medial_bias) / arch_sp, 2))
              : 1 - 0.25 * pow((arch_medial_bias - s) / max(arch_medial_bias, 0.01), 2),
    arch  = arch_h * a_lng * a_lat,

    // heel cup: wall following the outline with a flat rim on top, rolling
    // over into the slope and flaring concave into the heel seat.  The
    // medial wall runs on until the arch peak so it flows into the arch.
    wall_p = 1 - smooth(0, cup_slope_width, d - rim_width),
    fade_m = 1 - smooth(0.4 * cup_length, max(arch_peak * L, cup_length), y),
    fade_l = 1 - smooth(0.4 * cup_length, cup_length, y),
    cup_w  = cup_med * fade_m * (1 - s) + cup_lat * fade_l * s,
    cup    = wall_p * cup_w,

    // metatarsal pad
    ym  = met_pad_position * L,
    r   = sqrt(pow((s - 0.5) / max(met_pad_width / 2, 0.01), 2)
             + pow((y - ym) / max(met_pad_length / 2, 0.01), 2)),
    met = met_h * (0.5 + 0.5 * cos(180 * min(r, 1))),

    // medial / lateral heel wedges
    pf   = 1 - smooth(0.4 * post_length, post_length, y),
    post = pf * (med_post * (1 - s) + lat_post * s),

    z0 = smax(base_thickness + lift + arch + cup + met + post, min_thickness, 1),

    // rear / front parts taper down to the rounded end cap, which stays thin
    fade = (part == "rear"  && cut_taper_length > 0) ? smooth(Y1 - cut_taper_length, Y1, y) :
           (part == "front" && cut_taper_length > 0) ? 1 - smooth(Y0, Y0 + cut_taper_length, y) : 0,
    z1 = z0 - fade * max(0, z0 - cut_end_thickness),

    // rounded top edge, growing to a full round over the rim where the cup is tall
    rim_f = clampv(cup_w / max(cup_med, cup_lat, 0.01), 0, 1),
    er = min(lerp2(edge_radius, max(edge_radius, 0.8 * rim_width), rim_f), 0.45 * z1),
    z  = d < er ? z1 - (er - sqrt(er * er - pow(er - d, 2))) : z1
  )
  z;

// ---------------------------------------------------------------------
//  Height field -> polyhedron
// ---------------------------------------------------------------------
//  Ring k is the outline pulled toward its spine point by factor FK[k];
//  rings are packed closer near the edge where the cup wall and the
//  rounded edge need the detail.
NK = rings;
FK = [for (k = [0:NK-1]) 1 - pow(k / NK, 1.5)];

function spt(i) = SPINE[PER[i][2]];
function rad(i) = norm([PER[i][0], PER[i][1]] - spt(i));

TOPV = concat(
  [for (k = [0:NK-1]) for (i = [0:NP-1])
     let(c = spt(i), p = lerp2(c, [PER[i][0], PER[i][1]], FK[k]))
     [p.x, p.y, H(p.x, p.y, rad(i) * (1 - FK[k]))]],
  [for (s = [0:NS]) [SPINE[s].x, SPINE[s].y, H(SPINE[s].x, SPINE[s].y, SPHW[s])]]
);
BOTV = [for (p = PER) [p[0], p[1], 0]];
PTS  = concat(TOPV, BOTV);

function TV(k, i) = k * NP + (i % NP);
function SV(s)    = NK * NP + s;
function BV(i)    = NK * NP + NS + 1 + (i % NP);

FACES = concat(
  // top surface between rings
  [for (k = [0:NK-2]) for (i = [0:NP-1]) each [
     [TV(k, i), TV(k+1, i), TV(k+1, i+1)],
     [TV(k, i), TV(k+1, i+1), TV(k, i+1)] ]],
  // innermost ring to the spine
  [for (i = [0:NP-1])
     let(a = TV(NK-1, i), d = TV(NK-1, i+1),
         b = SV(PER[i][2]), c = SV(PER[(i+1) % NP][2]))
     each (b == c ? [[a, b, d]] : [[a, b, c], [a, c, d]])],
  // side wall
  [for (i = [0:NP-1]) each [
     [TV(0, i), TV(0, i+1), BV(i+1)],
     [TV(0, i), BV(i+1), BV(i)] ]],
  // flat bottom
  [[for (i = [0:NP-1]) BV(i)]]
);

module solid_body() polyhedron(PTS, FACES, convexity = 10);

// ---------------------------------------------------------------------
//  Lattice insole (grid modelled in the STL)
// ---------------------------------------------------------------------
module grid2d(pitch) {
  n = ceil(max(L, 2 * BALL_W) * 1.2 / pitch);
  translate([0, L / 2]) rotate(grid_angle)
    for (k = [-n:n]) {
      translate([k * pitch - strut / 2, -n * pitch]) square([strut, 2 * n * pitch]);
      translate([-n * pitch, k * pitch - strut / 2]) square([2 * n * pitch, strut]);
    }
}

// the open cells between the grid walls, inside the outer wall.  Each cell
// is a separate hole-free polygon, which extrudes to a clean closed mesh.
// A strut runs along the zone boundary, and slivers too thin to print are
// removed (they also break the CGAL conversion).
module cells2d() {
  zy = support_zone * L;
  offset(delta = 0.3) offset(delta = -0.3) difference() {
    offset(delta = -wall) outline2d();
    intersection() { grid2d(pitch_support); translate([-300, -100]) square([600, zy + 100]); }
    intersection() { grid2d(pitch_soft);    translate([-300, zy])   square([600, L + 100]); }
    translate([-300, zy - strut / 2]) square([600, strut]);
  }
}

module lattice_body() {
  difference() {
    solid_body();
    // cell pockets: above the floor and below the top skin (which follows the contour)
    intersection() {
      translate([0, 0, floor_thickness]) linear_extrude(100) cells2d();
      translate([0, 0, -top_skin]) solid_body();
    }
  }
}

// ---------------------------------------------------------------------
//  Final output (rear / front parts are shaped by the outline itself)
// ---------------------------------------------------------------------
module insole() {
  if (infill_mode == "lattice") lattice_body();
  else solid_body();
}

// for a pair, each insole is shifted so its medial edge sits pair_gap / 2
// from the centre line: left on the left, right on the right, arches facing
PAIR_DX = pair_gap / 2 - min([for (p = PER) p[0]]);

if (foot_side == "both") {
  translate([-PAIR_DX, 0, 0]) mirror([1, 0, 0]) insole();
  translate([ PAIR_DX, 0, 0]) insole();
}
else if (foot_side == "left") mirror([1, 0, 0]) insole();
else insole();
