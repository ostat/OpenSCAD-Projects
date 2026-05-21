/* [ostat Plant Sign generator v1.0] */

//select what to render
render_part = "layered"; //[back, front, layered, combinedup:combined face up (works on makerworld export as 3mf), combineddown:combined face down (works on makerworld export as 3mf)]
//Herbs
Common_Herb = "custom"; //[custom, Basil, Bay leaf, Chives, Coriander, Curry Plant, Dill, Fennel, Lemongrass, Lovage, Marigold, Marjoram, Mint, Oregano, Parsley, Rosemary, Sage, Shiso, Sorrel, Summer Savory, Tarragon, Thyme, Winter Savory]
//Flowers
Common_Flower = "custom"; //[custom, Aster, Azalea, Begonia, Bluebell, Camellia, Carnation, Chrysanthemum, Cosmos, Daffodil, Daisy, DesertRose, Foxglove, Gardenia, Geranium, Gerbera, Hibiscus, Hyacinth, Hydrangea, Iris, Jasmine, Lavender, Lily, Lotus, Magnolia, Marigold, MexicanHeather, Morning Glory, Orchid, Pansy, Peony, Petunia, Poppy, Rose, Snapdragon, Sunflower, Tulip, Violet, Wisteria, Yarrow, Zinnia]
//Fruits
Common_Fruit = "custom"; //[custom, Allspice, Almond, Apple, Apricot, Avocado, Banana, Bay Laurel, Black Sapote, Breadfruit, Cacao, Cashew, Cherry, Cinnamon, Clove, Coconut, Coffee, Curry Leaf, Custard Apple, Date Palm, Dragon Fruit, Durian, Feijoa, Fig, Finger Lime, Grapefruit, Guava, Jackfruit, Jujube, Kumquat, Lemon, Lime, Longan, Loquat, Lychee, Macadamia, Mandarin, Mango, MiracleBerry, Mulberry, Nectarine, Nutmeg, Olive, Orange, Papaya, Pawpaw, Peach, Pear, Pepper, Persimmon, Plum, Pomegranate, Quince, Sapodilla, Soursop, Starfruit, Strawberry, Tamarillo, Tamarind, Tea, Tomato, White Sapote]

// Line 1 text I.E Name
Text_Line_1 = "";
// Line 2 text I.E Botanical name
Text_Line_2 = "";
// Line 3 text I.E. Date Planted 2026-01-01
Text_Line_3 = "";
// Line 4 text I.E. A personal Note
Text_Line_4 = "";
// The URL to navigate to
qr_value = "";

/* [Text Style] */
// Display a demo of the short list of fonts
Enable_Font_Short_List_Demo = false;
//Font for text, E.G. HarmonyOS Sans for block, Lobster Two is cursive, Pacifico is cursive
Text_Font_Short_List = "HarmonyOS"; //[HarmonyOS,Lobster_Two,Rubik,Pacifico,Bungee,NTR,Playfair,Chicle,Rouge_Script,Henny_Penny]
//Text full font list. View at fonts.google.com
Text_Font_Full_List = ""; // font
//Font size
Text_Size = 10;            // [1:1:50]
// Predefined colour sets
Text_Color_Set = "Custom"; // [Custom, Gold, Pink, Blue, Blue_Inverted, Blue_Gold, Pink_Inverted, Pink_Gold]
//Line color
Text_Color = "#99FF99";    // color
//Bold weight, 0 is default weight
Text_Boldness = 0.0;      // [0:0.1:3]
//Text Spacing, 1 is default spacing
Text_Spacing = 1;         // [0.5:0.01:3]
//Number of extrusion layers
Text_Layers = 4;

/* [Text Line 1 Style] */
//x, y position for Line 1 (mm)
Text_Line_1_Position = [0, 0];
//Font for text, E.G. HarmonyOS Sans for block, Lobster Two is cursive, Pacifico is cursive
Text_Line_1_Font = "";        // font
//Enable Bold
Text_Line_1_Font_Style_Bold = true;
//Enable Italics
Text_Line_1_Font_Style_Italics = false;
//Font size
Text_Line_1_Size = 0;         // [1:1:50]
//Line Color for Line 1
Text_Line_1_Color = "";    // color
//Bold weight (-1 will use Text_Boldness)
Text_Line_1_Boldness = -1;    // [0:0.1:3]
//Text Spacing (-1 will use Text_Spacing)
Text_Line_1_Spacing = -1;     // 0.01

/* [Text Line 2 Style] */
//x, y position for Line 2 (mm)
Text_Line_2_Position = [0, 0];
//Font for text, I.E. HarmonyOS Sans for block, Lobster Two is cursive, Pacifico is cursive
Text_Line_2_Font = "HarmonyOS";          // font
//Enable Bold
Text_Line_2_Font_Style_Bold = true;
//Enable Italics
Text_Line_2_Font_Style_Italics = true;
//Font size for Line 2
Text_Line_2_Size = -2;
//Line Color for Line 2
Text_Line_2_Color = "";    // color
//Bold weight (-1 will use Text_Boldness)
Text_Line_2_Boldness = -1;      // [0:0.1:3]
//Text Spacing (-1 will use Text_Spacing)
Text_Line_2_Spacing = -1; // 0.01

/* [Text Line 3 Style] */
//x, y position for Line 3 (mm)
Text_Line_3_Position = [0, 0];
//Font for text, I.E. HarmonyOS Sansfor block, Lobster Two is cursive, Pacifico is cursive
Text_Line_3_Font = "Lobster Two"; // font
//Enable Bold
Text_Line_3_Font_Style_Bold = true;
//Enable Italics
Text_Line_3_Font_Style_Italics = false;
//Font size for Line 3
Text_Line_3_Size = -2;
//Line Color for Line 3
Text_Line_3_Color = "";  // color
//Bold weight (-1 will use Text_Boldness)
Text_Line_3_Boldness = -1;      // [0:0.1:3]
//Text Spacing (-1 will use Text_Spacing)
Text_Line_3_Spacing = -1;       // 0.01

/* [Text Line 4 Style] */
//x, y position for Line 4 (mm)
Text_Line_4_Position = [0, 0];
//Font for text, I.E. HarmonyOS Sansfor block, Lobster Two is cursive, Pacifico is cursive
Text_Line_4_Font = "Lobster Two"; // font
//Enable Bold
Text_Line_4_Font_Style_Bold = true;
//Enable Italics
Text_Line_4_Font_Style_Italics = false;
//Font size for Line 4
Text_Line_4_Size = -2;
//Font size for Line 4
Text_Line_4_Color = "";  // color
//Bold weight (-1 will use Text_Boldness)
Text_Line_4_Boldness = -1;      // [0:0.1:3]
//Text Spacing (-1 will use Text_Spacing)
Text_Line_4_Spacing = -1;       // 0.01

/* [Backer] */
Backer_Style = "fancy"; // [fancy, plain]
Backer_Color = "#000000";    // color
// min size of the text area, borders are added.
Backer_Min_Size = [60,20];
//Backer plate size around the text(mm)
Backer_Outer_Border = 2;
Backer_Color_Border = 1;
//Amount of backer that should overlap between lines
Text_Clearance = 1.5;
//Number of extrusion layers for the backer
Backer_Layers = 8;

/* [Posts] */
Post_Count = 1;
//Distance between post (mm)
Post_Spacing = 0;
//Width of the post (mm)
Post_Width = 8;
// Length of the post (mm), -ve is sign_height/abs(post_length)
Post_Length = 75; //0.1

/* [QR Code] */
qr_position = "right"; // [disabled, right, below]
// of the QR code
qr_size = 25; // [1:1000]
// Error correction level
error_correction = "L"; // [L:"Low (~7%)", M:"Medium (~15%)", Q: "Quartile (~25%)", H: "High (~30%)"]
// Mask pattern
mask_pattern = 0; // [0:"000: (y + x)%2=0", 1:"001: y % 2=0", 2:"010: x % 3=0", 3:"011: (y + x)%3=0", 4:"100: (y/2 + x/3)%2=0", 5:"101: (y*x)%2+(y*x)%3=0", 6:"110: ((y*x)%3+y*x)%2=0", 7:"111: ((y*x)%3+y+x)%2=0"]
// Character encoding
encoding = "UTF-8"; // [ Alphanumeric, UTF-8:"UTF-8 (Unicode)", Shift_JIS:"Shift JIS (Shift Japanese International Standards)"]

/* [printing details] */
//x, y position of the model, to center the model (mm)
Model_Position = [0, 0];
//height of layer in mm
Extrusion_Layer_Height = 0.20;
fn = 128;
show_debug = false;

/* [Hidden] */
module end_of_customizer_opts() {}
$fn=fn;
fudge_factor = 0.01;

ienabled = 0;
itext = 1;
itext_size = 2;
itext_layers = 3;
itext_position = 4;
itext_font = 5;
itext_boldness = 6;
itext_spacing = 7;
icolor = 8;
itext_metrix = 9;

ipos_size=0;
ipos_midline=1;
ipos_top=2;
ipos_bottom=3;

icolor_text = 0;
icolor_backer = 1;

text_values_name = 0;
text_values_line2 = 1;
text_values_line3 = 2;
text_values_line4 = 3;
text_values_url = 4;

//https://meta.wikimedia.org/wiki/Special:UrlShortener
//using the url shortener can produce a QR code with less bits, and larger squares.
Common_Herbs = [
    ["Basil",         ["Basil",   "Ocimum basilicum", "https://w.wiki/3pe6"]], //https://en.wikipedia.org/wiki/Basil
    ["Bay leaf",      ["Bay leaf", "Laurus nobilis", "https://w.wiki/3rWr"]], //https://en.wikipedia.org/wiki/Bay_leaf
    ["Chives",        ["Chives", "Allium schoenoprasum", "https://w.wiki/NYKH"]], //https://en.wikipedia.org/wiki/Chives
    ["Coriander",     ["Coriander", "Coriandrum sativum", "https://w.wiki/3jir"]], //https://en.wikipedia.org/wiki/Coriander
    ["Curry Plant",   ["Curry Plant", "Helichrysum italicum", "https://w.wiki/MmPi"]],
    ["Dill",          ["Dill", "Anethum graveolens", "https://w.wiki/4kG4"]], //https://en.wikipedia.org/wiki/Dill
    ["Fennel",        ["Fennel", "Foeniculum vulgare", "https://w.wiki/3ovf"]], //https://en.wikipedia.org/wiki/Fennel
    ["Lemongrass",    ["Lemongrass", "Cymbopogon citratus", "https://w.wiki/NYKi"]], //https://en.wikipedia.org/wiki/Lemongrass
    ["Lovage",        ["Lovage", "Levisticum officinale", "https://w.wiki/MmQ9"]],
    ["Marigold",      ["Marigold", "Tagetes", "https://w.wiki/62tz"]],
    ["Marjoram",      ["Marjoram", "Origanum majorana", "https://w.wiki/NYKm"]], //https://en.wikipedia.org/wiki/Marjoram
    ["Mint",          ["Mint", "Mentha", "https://w.wiki/HPrR"]], //https://en.wikipedia.org/wiki/Mentha
    ["Oregano",       ["Oregano", "Origanum vulgare", "https://w.wiki/3r5D"]], //https://en.wikipedia.org/wiki/Oregano
    ["Parsley",       ["Parsley", "Petroselinum crispum", "https://w.wiki/4gUf"]], //https://en.wikipedia.org/wiki/Parsley
    ["Rosemary",      ["Rosemary", "Salvia rosmarinus", "https://w.wiki/9Vt8"]], //https://en.wikipedia.org/wiki/Rosemary
    ["Sage",          ["Sage", "Salvia officinalis", "https://w.wiki/NYKG"]], //https://en.wikipedia.org/wiki/Sage_(plant)
    ["Shiso",         ["Shiso", "Perilla frutescens", "https://w.wiki/MmPs"]],
    ["Sorrel",        ["Sorrel", "Rumex acetosa", "https://w.wiki/MmQB"]],
    ["Summer Savory", ["Summer Savory", "Satureja hortensis", "https://w.wiki/MiL2"]],
    ["Tarragon",      ["Tarragon", "Artemisia dracunculus", "https://w.wiki/NYKS"]], //https://en.wikipedia.org/wiki/Tarragon
    ["Thyme",         ["Thyme", "Thymus vulgaris", "https://w.wiki/9vV9"]], //https://en.wikipedia.org/wiki/Thyme
    ["Winter Savory", ["Winter Savory", "Satureja montana", "https://w.wiki/MmPu"]],
  ];

Common_Flowers = [
    ["Aster", ["Aster", "Aster", "https://w.wiki/NYpj"]], // https://en.wikipedia.org/wiki/Aster_(genus)
    ["Azalea", ["Azalea", "Rhododendron", "https://w.wiki/ND2x"]], // https://en.wikipedia.org/wiki/Azalea
    ["Begonia", ["Begonia", "Begonia", "https://w.wiki/N6Df"]], // https://en.wikipedia.org/wiki/Begonia
    ["Bluebell", ["Bluebell", "Hyacinthoides non-scripta", "https://w.wiki/NYpm"]], // https://en.wikipedia.org/wiki/Hyacinthoides_non-scripta
    ["Camellia", ["Camellia", "Camellia", "https://w.wiki/N6Eh"]], // https://en.wikipedia.org/wiki/Camellia
    ["Carnation", ["Carnation", "Dianthus caryophyllus", "https://w.wiki/NYo8"]], // https://en.wikipedia.org/wiki/Dianthus_caryophyllus
    ["Chrysanthemum", ["Chrysanthemum", "Chrysanthemum", "https://w.wiki/3onw"]], // https://en.wikipedia.org/wiki/Chrysanthemum
    ["Cosmos", ["Cosmos", "Cosmos bipinnatus", "https://w.wiki/NYpe"]], // https://en.wikipedia.org/wiki/Cosmos_bipinnatus
    ["Daffodil", ["Daffodil", "Narcissus", "https://w.wiki/NYoV"]], // https://en.wikipedia.org/wiki/Narcissus
    ["Daisy", ["Daisy", "Bellis perennis", "https://w.wiki/DbXP"]], // https://en.wikipedia.org/wiki/Bellis_perennis
    ["DesertRose", ["Desert Rose", "Adenium obesum", "https://w.wiki/NYpA"]], // https://en.wikipedia.org/wiki/Adenium_obesum
    ["Foxglove", ["Foxglove", "Digitalis purpurea", "https://w.wiki/BZzz"]], // https://en.wikipedia.org/wiki/Digitalis_purpurea
    ["Gardenia", ["Gardenia", "Gardenia", "https://w.wiki/MUUc"]], // https://en.wikipedia.org/wiki/Gardenia
    ["Geranium", ["Geranium", "Pelargonium", "https://w.wiki/FZNA"]], // https://en.wikipedia.org/wiki/Pelargonium
    ["Gerbera", ["Gerbera", "Gerbera", "https://w.wiki/Ei5n"]], // https://en.wikipedia.org/wiki/Gerbera
    ["Hibiscus", ["Hibiscus", "Hibiscus", "https://w.wiki/3jpP"]], // https://en.wikipedia.org/wiki/Hibiscus
    ["Hyacinth", ["Hyacinth", "Hyacinthus", "https://w.wiki/NYpP"]], // https://en.wikipedia.org/wiki/Hyacinth_(plant)
    ["Hydrangea", ["Hydrangea", "Hydrangea", "https://w.wiki/3jzX"]], // https://en.wikipedia.org/wiki/Hydrangea
    ["Iris", ["Iris", "Iris", "https://w.wiki/8W8V"]], // https://en.wikipedia.org/wiki/Iris_(plant)
    ["Jasmine", ["Jasmine", "Jasminum", "https://w.wiki/7y5n"]], // https://en.wikipedia.org/wiki/Jasmine
    ["Lavender", ["Lavender", "Lavandula", "https://w.wiki/NYmf"]], // https://en.wikipedia.org/wiki/Lavender
    ["Lily", ["Lily", "Lilium", "https://w.wiki/NYnm"]], // https://en.wikipedia.org/wiki/Lilium
    ["Lotus", ["Lotus", "Nelumbo nucifera", "https://w.wiki/7EY2"]], // https://en.wikipedia.org/wiki/Nelumbo_nucifera
    ["Magnolia", ["Magnolia", "Magnolia", "https://w.wiki/7vUU"]], // https://en.wikipedia.org/wiki/Magnolia
    ["Marigold", ["Marigold", "Tagetes", "https://w.wiki/62tz"]], // https://en.wikipedia.org/wiki/Tagetes
    ["MexicanHeather", ["Mexican Heather", "Cuphea hyssopifolia", "https://w.wiki/Knbn"]], // https://en.wikipedia.org/wiki/Cuphea_hyssopifolia
    ["Morning Glory", ["Morning Glory", "Ipomoea", "https://w.wiki/AVWo"]], // https://en.wikipedia.org/wiki/Morning_glory
    ["Orchid", ["Orchid", "Orchidaceae", "https://w.wiki/4XAN"]], // https://en.wikipedia.org/wiki/Orchidaceae
    ["Pansy", ["Pansy", "Viola tricolor var. hortensis", "https://w.wiki/NYo4"]], // https://en.wikipedia.org/wiki/Pansy
    ["Peony", ["Peony", "Paeonia", "https://w.wiki/3qcT"]], // https://en.wikipedia.org/wiki/Peony
    ["Petunia", ["Petunia", "Petunia", "https://w.wiki/NYn$"]], // https://en.wikipedia.org/wiki/Petunia
    ["Poppy", ["Poppy", "Papaver", "https://w.wiki/3om5"]], // https://en.wikipedia.org/wiki/Poppy
    ["Rose", ["Rose", "Rosa", "https://w.wiki/3oBw"]], // https://en.wikipedia.org/wiki/Rose
    ["Snapdragon", ["Snapdragon", "Antirrhinum", "https://w.wiki/NYoh"]], // https://en.wikipedia.org/wiki/Antirrhinum
    ["Sunflower", ["Sunflower", "Helianthus annuus", "https://w.wiki/NYme"]], // https://en.wikipedia.org/wiki/Sunflower
    ["Tulip", ["Tulip", "Tulipa", "https://w.wiki/6ASZ"]], // https://en.wikipedia.org/wiki/Tulip
    ["Violet", ["Violet", "Viola", "https://w.wiki/7soi"]], // https://en.wikipedia.org/wiki/Viola_(plant)
    ["Wisteria", ["Wisteria", "Wisteria", "https://w.wiki/DmMS"]], // https://en.wikipedia.org/wiki/Wisteria
    ["Yarrow", ["Yarrow", "Achillea millefolium", "https://w.wiki/AVPY"]], // https://en.wikipedia.org/wiki/Achillea_millefolium
    ["Zinnia", ["Zinnia", "Zinnia", "https://w.wiki/FiPo"]], // https://en.wikipedia.org/wiki/Zinnia
];

Common_Fruits = [
    ["Allspice", ["Allspice", "Pimenta dioica", "https://en.wikipedia.org/wiki/Allspice"]],
    ["Almond", ["Almond", "Prunus dulcis", "https://en.wikipedia.org/wiki/Almond"]],
    ["Apple",         ["Apple", "Malus domestica", "https://w.wiki/jkk"]], //https://en.wikipedia.org/wiki/Apple
    ["Apricot", ["Apricot", "Prunus armeniaca", "https://en.wikipedia.org/wiki/Apricot"]],
    ["Avocado", ["Avocado", "Persea americana", "https://en.wikipedia.org/wiki/Avocado"]],
    ["Banana", ["Banana", "Musa", "https://en.wikipedia.org/wiki/Banana"]],
    ["Bay Laurel", ["Bay Laurel", "Laurus nobilis", "https://en.wikipedia.org/wiki/Laurus_nobilis"]],
    ["Black Sapote", ["Black Sapote", "Diospyros nigra", "https://en.wikipedia.org/wiki/Black_sapote"]],
    ["Breadfruit", ["Breadfruit", "Artocarpus altilis", "https://en.wikipedia.org/wiki/Breadfruit"]],
    ["Cacao", ["Cacao", "Theobroma cacao", "https://en.wikipedia.org/wiki/Theobroma_cacao"]],
    ["Cashew", ["Cashew", "Anacardium occidentale", "https://en.wikipedia.org/wiki/Cashew"]],
    ["Cherry", ["Cherry", "Prunus avium", "https://en.wikipedia.org/wiki/Cherry"]],
    ["Cinnamon", ["Cinnamon", "Cinnamomum verum", "https://en.wikipedia.org/wiki/Cinnamomum_verum"]],
    ["Clove", ["Clove", "Syzygium aromaticum", "https://en.wikipedia.org/wiki/Clove"]],
    ["Coconut", ["Coconut", "Cocos nucifera", "https://en.wikipedia.org/wiki/Coconut"]],
    ["Coffee", ["Coffee", "Coffea arabica", "https://en.wikipedia.org/wiki/Coffea_arabica"]],
    ["Curry Leaf", ["Curry Leaf", "Murraya koenigii", "https://en.wikipedia.org/wiki/Curry_tree"]],
    ["Custard Apple", ["Custard Apple", "Annona reticulata", "https://en.wikipedia.org/wiki/Annona_reticulata"]],
    ["Date Palm", ["Date Palm", "Phoenix dactylifera", "https://en.wikipedia.org/wiki/Date_palm"]],
    ["Dragon Fruit", ["Dragon Fruit", "Selenicereus undatus", "https://en.wikipedia.org/wiki/Pitaya"]],
    ["Durian", ["Durian", "Durio zibethinus", "https://en.wikipedia.org/wiki/Durian"]],
    ["Feijoa", ["Feijoa", "Acca sellowiana", "https://en.wikipedia.org/wiki/Feijoa"]],
    ["Fig", ["Fig", "Ficus carica", "https://en.wikipedia.org/wiki/Common_fig"]],
    ["Finger Lime", ["Finger Lime", "Citrus australasica", "https://en.wikipedia.org/wiki/Citrus_australasica"]],
    ["Grapefruit", ["Grapefruit", "Citrus × paradisi", "https://en.wikipedia.org/wiki/Grapefruit"]],
    ["Guava", ["Guava", "Psidium guajava", "https://en.wikipedia.org/wiki/Guava"]],
    ["Jackfruit", ["Jackfruit", "Artocarpus heterophyllus", "https://en.wikipedia.org/wiki/Jackfruit"]],
    ["Jujube", ["Jujube", "Ziziphus jujuba", "https://en.wikipedia.org/wiki/Jujube"]],
    ["Kumquat", ["Kumquat", "Citrus japonica", "https://en.wikipedia.org/wiki/Kumquat"]],
    ["Lemon", ["Lemon", "Citrus limon", "https://w.wiki/3qEt"]], //https://en.wikipedia.org/wiki/Lemon
    ["Lime", ["Lime", "Citrus aurantiifolia", "https://w.wiki/5Xmp"]], //https://en.wikipedia.org/wiki/Lime_(fruit)
    ["Longan", ["Longan", "Dimocarpus longan", "https://en.wikipedia.org/wiki/Longan"]],
    ["Loquat", ["Loquat", "Eriobotrya japonica", "https://en.wikipedia.org/wiki/Loquat"]],
    ["Lychee", ["Lychee", "Litchi chinensis", "https://en.wikipedia.org/wiki/Lychee"]],
    ["Macadamia", ["Macadamia", "Macadamia integrifolia", "https://en.wikipedia.org/wiki/Macadamia"]],
    ["Mandarin", ["Mandarin", "Citrus reticulata", "https://en.wikipedia.org/wiki/Mandarin_orange"]],
    ["Mango", ["Mango", "Mangifera indica", "https://en.wikipedia.org/wiki/Mango"]],
    ["MiracleBerry", ["Miracle Berry", "Synsepalum dulcificum", "https://w.wiki/8syB"]], //https://en.wikipedia.org/wiki/Synsepalum_dulcificum
    ["Mulberry", ["Mulberry", "Morus", "https://en.wikipedia.org/wiki/Mulberry"]],
    ["Nectarine", ["Nectarine", "Prunus persica var. nucipersica", "https://en.wikipedia.org/wiki/Nectarine"]],
    ["Nutmeg", ["Nutmeg", "Myristica fragrans", "https://en.wikipedia.org/wiki/Nutmeg"]],
    ["Olive", ["Olive", "Olea europaea", "https://en.wikipedia.org/wiki/Olive"]],
    ["Orange", ["Orange", "Citrus × sinensis", "https://en.wikipedia.org/wiki/Orange_(fruit)"]],
    ["Papaya", ["Papaya", "Carica papaya", "https://en.wikipedia.org/wiki/Papaya"]],
    ["Pawpaw", ["Pawpaw", "Asimina triloba", "https://en.wikipedia.org/wiki/Asimina_triloba"]],
    ["Peach",         ["Peach", "Prunus persica", "https://en.wikipedia.org/wiki/Peach"]],
    ["Pear",          ["Pear", "Pyrus", "https://en.wikipedia.org/wiki/Pear"]],
    ["Pepper", ["Pepper", "Piper nigrum", "https://en.wikipedia.org/wiki/Black_pepper"]],
    ["Persimmon", ["Persimmon", "Diospyros kaki", "https://en.wikipedia.org/wiki/Persimmon"]],
    ["Plum",          ["Plum", "Prunus domestica", "https://en.wikipedia.org/wiki/Plum"]],
    ["Pomegranate", ["Pomegranate", "Punica granatum", "https://en.wikipedia.org/wiki/Pomegranate"]],
    ["Quince", ["Quince", "Cydonia oblonga", "https://en.wikipedia.org/wiki/Quince"]],
    ["Sapodilla", ["Sapodilla", "Manilkara zapota", "https://en.wikipedia.org/wiki/Manilkara_zapota"]],
    ["Soursop", ["Soursop", "Annona muricata", "https://en.wikipedia.org/wiki/Soursop"]],
    ["Starfruit", ["Starfruit", "Averrhoa carambola", "https://en.wikipedia.org/wiki/Carambola"]],
    ["Strawberry", ["Strawberry", "Fragaria × ananassa", "https://w.wiki/3hMQ"]], //https://en.wikipedia.org/wiki/Strawberry
    ["Tamarillo", ["Tamarillo", "Solanum betaceum", "https://w.wiki/AqZ6"]], //https://en.wikipedia.org/wiki/Tamarillo
    ["Tamarind", ["Tamarind", "Tamarindus indica", "https://en.wikipedia.org/wiki/Tamarind"]],
    ["Tea", ["Tea", "Camellia sinensis", "https://en.wikipedia.org/wiki/Tea_plant"]],
    ["Tomato",        ["Tomato", "Solanum lycopersicum", "https://w.wiki/3k7k"]], //https://en.wikipedia.org/wiki/Tomato
    ["White Sapote", ["White Sapote", "Casimiroa edulis", "https://en.wikipedia.org/wiki/Casimiroa_edulis"]]
];

Text_Color_Sets = [
  ["Gold", ["#FFFFFF","#D4AF37"]],
  ["Pink", ["#FEA3B1","#FFFFFF"]],
  ["Pink_Inverted", ["#FFFFFF","#FC6C85"]],
  ["Pink_Gold", ["#D4AF37","#FC6C85"]],
  ["Blue", ["#87CEEB","#FFFFFF"]],
  ["Blue_Inverted", ["#FFFFFF","#246BCE"]],
  ["Blue_Gold", ["#D4AF37","#246BCE"]]];

Font_Short_List =
  [
  ["Henny_Penny", "Henny Penny:style=Regular"],
  ["Rouge_Script", "Rouge Script:style=Regular"],
  ["Pacifico", "Pacifico:style=Regular"],
  ["Lobster_Two", "Lobster Two:style=Regular"],
  ["Chicle", "Chicle:style=Regular"],
  ["Bungee", "Bungee Color:style=Regular"],
  ["Playfair", "Playfair Display"],
  ["NTR", "NTR:style=Regular"],
  ["Rubik", "Rubik"],
  ["HarmonyOS", "HarmonyOS Sans SC:style=Regular"],
  ];

function DictGet(list, key, default = undef, alert=false) =
  let(
    //match  matchResults = [21], no match matchResults = [[]]
    matchResults = search([key], list,1),
    matchIndex = is_list(matchResults) && len(matchResults)==1 && is_num(matchResults[0]) ? matchResults[0]: undef,
    found_match = is_num(matchIndex),
    alertMessage = str("could not find key in list key:'", key, "' matchResults:'", matchResults, "' matchIndex:'", matchIndex),
    matchValue = found_match ? list[matchIndex] : [-1, default])
    assert(!alert || found_match, alertMessage)
      matchValue[1];

// Gets one value base on another.
// if user_value = 0 use the base value
// user_value > 0 use that value
// user_value < 0 base_value/abs(user_value) (i.e. -3 is 1/3 the base_value)
function get_related_value(user_value, base_value, default_value, max_value) =
  let(
      default = is_undef(default_value) ? base_value : default_value,
      calculated = user_value == 0 ? default :
      user_value < 0 ? base_value/abs(user_value) : user_value)
      is_undef(max_value) ? calculated : min(calculated, max_value);


function get_line_settings(
    customise,
    text,
    size,
    layers,
    position,
    font,
    boldness,
    spacing,
    color,
    default_size,
    default_font,
    default_boldness,
    default_spacing,
    default_layers,
    default_color
    ) =
    let(
      _enabled = len(text) > 0,
      _size = customise && size > 0 ? size : default_size,
      _font = customise && len(font) > 0 ? font : default_font,
      _boldness = customise && boldness != -1 ? boldness : default_boldness,
      _spacing = customise && spacing != -1 ? spacing : default_spacing,
      _layers =  customise && layers > 0 ? layers : default_layers,
      _color = customise && len(color) > 0 ? color : default_color,
      _position = _enabled ? position : [0, 0],
      tm = _enabled ? textmetrics(text=text, size=_size, font=_font, spacing=_spacing).size : [0, 0]
    )
    [_enabled,
    text,
    _size,
    _layers,
    _position,
    _font,
    _boldness,
    _spacing,
    _color,
    tm];

function calculate_line_positions(line_settings, text_clearance) =
  let(
      //bottom
    line4_size = line_settings[3][ienabled] ? [
      line_settings[3][itext_metrix].x+line_settings[3][itext_boldness]+text_clearance*2,
      line_settings[3][itext_metrix].y+line_settings[3][itext_boldness]+text_clearance*2] : [0,0],
    line4_midline = line_settings[3][ienabled] ? [
      line_settings[3][itext_position].x,
      line_settings[3][itext_position].y + line4_size.y/2] : [0,0],
    line4_bottom = line_settings[3][ienabled] ? [
      line4_midline.x-line4_size.x/2,
      line4_midline.y-line4_size.y/2] : [0,0],
    line4_top = line_settings[3][ienabled] ? [
      line4_midline.x-line4_size.x/2,
      line4_midline.y+line4_size.y/2] : [0,0],

    //middle bottom
    line3_size = line_settings[2][ienabled] ? [
      line_settings[2][itext_metrix].x+line_settings[2][itext_boldness]+text_clearance*2,
      line_settings[2][itext_metrix].y+line_settings[2][itext_boldness]+text_clearance*2] : [0,0],
    line3_midline = line_settings[2][ienabled] ? [
      line_settings[2][itext_position].x,
      line_settings[2][itext_position].y + line3_size.y/2 + line4_top.y] : line4_midline,
    line3_bottom = line_settings[2][ienabled] ? [
      line3_midline.x-line3_size.x/2,
      line3_midline.y-line3_size.y/2] : line4_top,
    line3_top = line_settings[2][ienabled] ? [
      line3_midline.x-line3_size.x/2,
      line3_midline.y+line3_size.y/2] : line4_top,

    //middle top
    line2_size = line_settings[1][ienabled] ? [
      line_settings[1][itext_metrix].x+line_settings[1][itext_boldness]+text_clearance*2,
      line_settings[1][itext_metrix].y+line_settings[1][itext_boldness]+text_clearance*2] : [0,0],
    line2_midline = line_settings[1][ienabled] ? [
      line_settings[1][itext_position].x,
      line_settings[1][itext_position].y + line2_size.y/2 + line3_top.y] : line3_midline,
    line2_bottom = line_settings[1][ienabled] ? [
      line2_midline.x-line2_size.x/2,
      line2_midline.y-line2_size.y/2] : line3_top,
    line2_top = line_settings[1][ienabled] ? [
      line2_midline.x-line2_size.x/2,
      line2_midline.y+line2_size.y/2] : line3_top,

    //top
    line1_size = line_settings[0][ienabled] ? [
      line_settings[0][itext_metrix].x+line_settings[0][itext_boldness]+text_clearance*2,
      line_settings[0][itext_metrix].y+line_settings[0][itext_boldness]+text_clearance*2] : [0,0],
    line1_midline = line_settings[0][ienabled] ? [
      line_settings[0][itext_position].x,
      line_settings[0][itext_position].y + line1_size.y/2 + line2_top.y] : line2_midline,
    line1_bottom = line_settings[0][ienabled] ? [
      line1_midline.x-line1_size.x/2,
      line1_midline.y-line1_size.y/2] : line2_top,
    line1_top = line_settings[0][ienabled] ? [
      line1_midline.x-line1_size.x/2,
      line1_midline.y+line1_size.y/2] : line2_top
  )
  [
    [line1_size, line1_midline, line1_top, line1_bottom],
    [line2_size, line2_midline, line2_top, line2_bottom],
    [line3_size, line3_midline, line3_top, line3_bottom],
    [line4_size, line4_midline, line4_top, line4_bottom]
  ];

// String functions found here https://github.com/thehans/funcutils/blob/master/string.scad
function join(l,delimiter="") =
  let(s = len(l), d = delimiter,
      jb = function (b,e) let(s = e-b, m = floor(b+s/2)) // join binary
        s > 2 ? str(jb(b,m), jb(m,e)) : s == 2 ? str(l[b],l[b+1]) : l[b],
      jd = function (b,e) let(s = e-b, m = floor(b+s/2))  // join delimiter
        s > 2 ? str(jd(b,m), d, jd(m,e)) : s == 2 ? str(l[b],d,l[b+1]) : l[b])
  s > 0 ? (d=="" ? jb(0,s) : jd(0,s)) : "";

function substr(s,b,e) = let(e=is_undef(e) || e > len(s) ? len(s) : e) (b==e) ? "" : join([for(i=[b:1:e-1]) s[i] ]);

function strip_font_style(font) =
    let(pos = search(":style=", font))
    len(pos) > 0
        ? substr(font, 0, pos[0] - 1)
        : font;

function build_font(
    font,
    bold=false,
    italic=false,
    regular_when_none=true
) =
    let(
        base = strip_font_style(font),
        style =
            bold && italic ? "Bold Italic" :
            bold ? "Bold" :
            italic ? "Italic" :
            regular_when_none ? "Regular" : ""
    )
    style == ""
        ? base
        : str(base, ":style=", style);

function overall_text_size(lines, minsize) =
    let(
        valid = [for (l = lines) if (l[ipos_size].x > 0 && l[ipos_size].y > 0) l],

        lefts   = [for (l = valid) l[ipos_midline].x - l[ipos_size].x/2],
        rights  = [for (l = valid) l[ipos_midline].x + l[ipos_size].x/2],
        bottoms = [for (l = valid) l[ipos_midline].y - l[ipos_size].y/2],
        tops    = [for (l = valid) l[ipos_midline].y + l[ipos_size].y/2],
        size =     len(valid) == 0
          ? [0,0]
          : [max(rights) - min(lefts), max(tops) - min(bottoms)]

    )
    [max(size.x, minsize.x), max(size.y, minsize.y)];

colour_set = DictGet(Text_Color_Sets, Text_Color_Set, default = [Text_Color, Backer_Color]);

text_values = let(
    knownHerb = DictGet(Common_Herbs, Common_Herb),
    knownFruit = DictGet(Common_Fruits, Common_Fruit),
    knownFlower = DictGet(Common_Flowers, Common_Flower),
    fallback_tomato = DictGet(Common_Fruits, "Tomato"),
    selected = knownHerb != undef ? knownHerb
              : knownFruit != undef ? knownFruit
              : knownFlower != undef ? knownFlower
              : [Text_Line_1, Text_Line_2, qr_value],
    result = (selected[0] == undef || selected[0] == "")
        && (selected[1] == undef || selected[1] == "")
        && (selected[2] == undef || selected[2] == "") ? fallback_tomato : selected
  )
  [
    result[0],
    result[1],
    Text_Line_3,
    Text_Line_4,
    result[2]
  ];

qr_position_calculated = (is_undef(text_values[text_values_url]) || text_values[text_values_url]  == "") ? "disabled" : qr_position;

Text_Font = len(Text_Font_Full_List) > 0
      ? Text_Font_Full_List
      : DictGet(Font_Short_List, Text_Font_Short_List, alert=true);

topper_settings = [
  get_line_settings(
    customise = true,
    text = text_values[text_values_name],
    size = Text_Line_1_Size,
    layers = 0,
    position = Text_Line_1_Position,
    font = build_font(Text_Line_1_Font, Text_Line_1_Font_Style_Bold, Text_Line_1_Font_Style_Italics),
    boldness = Text_Line_1_Boldness,
    spacing = Text_Line_1_Spacing,
    color = Text_Line_1_Color,
    default_size = Text_Size,
    default_font = Text_Font,
    default_boldness = Text_Boldness,
    default_spacing = Text_Spacing,
    default_layers = Text_Layers,
    default_color = colour_set[icolor_text]),

  get_line_settings(
    customise = true,
    text = text_values[text_values_line2],
    size = get_related_value(Text_Line_2_Size, Text_Line_1_Size, Text_Line_1_Size),
    layers = 0,
    position = Text_Line_2_Position,
    font = build_font(Text_Line_2_Font, Text_Line_2_Font_Style_Bold, Text_Line_2_Font_Style_Italics),
    boldness = Text_Line_2_Boldness,
    spacing = Text_Line_2_Spacing,
    color = Text_Line_2_Color,
    default_size = Text_Size/2,
    default_font = Text_Font,
    default_boldness = Text_Boldness,
    default_spacing = Text_Spacing,
    default_layers = Text_Layers,
    default_color = colour_set[icolor_text]),

  get_line_settings(
    customise = true,
    text = text_values[text_values_line3],
    size = get_related_value(Text_Line_3_Size, Text_Line_1_Size, Text_Line_1_Size),
    layers = 0,
    position = Text_Line_3_Position,
    font = build_font(Text_Line_3_Font, Text_Line_3_Font_Style_Bold, Text_Line_3_Font_Style_Italics),
    boldness = Text_Line_3_Boldness,
    spacing = Text_Line_3_Spacing,
    color = Text_Line_3_Color,
    default_size = Text_Size/2,
    default_font = Text_Font,
    default_boldness = Text_Boldness,
    default_spacing = Text_Spacing,
    default_layers = Text_Layers,
    default_color = colour_set[icolor_text]),

   get_line_settings(
    customise = true,
    text = text_values[text_values_line4],
    size = get_related_value(Text_Line_4_Size, Text_Line_1_Size, Text_Line_1_Size),
    layers = 0,
    position = Text_Line_4_Position,
    font = build_font(Text_Line_4_Font, Text_Line_4_Font_Style_Bold, Text_Line_4_Font_Style_Italics),
    boldness = Text_Line_4_Boldness,
    spacing = Text_Line_4_Spacing,
    color = Text_Line_4_Color,
    default_size = Text_Size/2,
    default_font = Text_Font,
    default_boldness = Text_Boldness,
    default_spacing = Text_Spacing,
    default_layers = Text_Layers,
    default_color = colour_set[icolor_text]),
  ];

line_positions = calculate_line_positions(topper_settings, Text_Clearance);
label_text_size = overall_text_size(line_positions, Backer_Min_Size);

//qr_size_calculated = label_text_size.y >= qr_size+Text_Clearance*2 ? qr_size : label_text_size.y - Text_Clearance*2;
qr_size_calculated = max(label_text_size.y - Text_Clearance*2, qr_size);

label_size = qr_position_calculated == "right" ? [label_text_size.x + qr_size_calculated + Text_Clearance*3, max(label_text_size.y, qr_size_calculated+ Text_Clearance*3)]
              : qr_position_calculated == "below" ? [label_text_size.x + Text_Clearance*3, label_text_size.y + qr_size_calculated + Text_Clearance*3]
              : [label_text_size.x + Text_Clearance, label_text_size.y + Text_Clearance] ;

calculated_post_length = get_related_value(Post_Length, label_size.y, 0);
model_position =
  [Model_Position.x,
  Model_Position.y,
  0];

if(show_debug){
    echo(line1_settings = topper_settings[0]);
    echo(line2_settings = topper_settings[1]);
    echo(line3_settings = topper_settings[2]);
    echo(line4_settings = topper_settings[3]);
    echo(line1 = line_positions[0]);
    echo(line2 = line_positions[1]);
    echo(line3 = line_positions[2]);
    echo(line4 = line_positions[3]);
    echo(label_size = label_size, label_text_size=label_text_size, qr_size=qr_size, qr_size_calculated=qr_size_calculated);
    echo(render_part=render_part, model_position=model_position, calculated_post_length=calculated_post_length);
}

if(Enable_Font_Short_List_Demo){
  font_demo();
} else {
  translate(model_position)
  if(render_part == "back"){
    back_layer();
  } else if(render_part == "front"){
    front_layer();
  } else if(render_part == "combineddown" || render_part == "combinedup"){
    translate(render_part == "combinedup" ? [0,0,0] : [0,0,Backer_Layers*Extrusion_Layer_Height])
    rotate(render_part == "combinedup" ? [0,0,0] : [0,180,0])
    union(){
      difference(){
        back_layer();
        translate([0,0,Backer_Layers*Extrusion_Layer_Height-Text_Layers*Extrusion_Layer_Height+fudge_factor])
        front_layer();
      }
      translate([0,0,Backer_Layers*Extrusion_Layer_Height-Text_Layers*Extrusion_Layer_Height+fudge_factor])
      front_layer();
    }
  } else{
    union(){
      translate([0,0,Backer_Layers*Extrusion_Layer_Height-fudge_factor])
      front_layer();
      back_layer();
    }
  }
}

module front_layer(){
  translate( qr_position_calculated == "right"  ? [-(qr_size_calculated)/2 - Text_Clearance, label_size.y/2-label_text_size.y/2, 0]
            : qr_position_calculated == "below" ? [0, qr_size_calculated + Text_Clearance*2, 0]
            : [0,0,0])
  union(){
    for (i=[0:len(topper_settings)-1]) {
      let(
        line = topper_settings[i],
        line_position = line_positions[i])

        translate([line[itext_position].x,line_position[ipos_midline].y,0])
        if (line[ienabled]) {
            layered_text(
              text=line[itext], font=line[itext_font], size=line[itext_size], spacing=line[itext_spacing],
              valign="center",
              top_layer_thickness=line[itext_layers]*Extrusion_Layer_Height,
              top_layer_offset=line[itext_boldness],
              top_layer_color=line[icolor],
              bottom_layer_thickness=0,
              bottom_layer_offset=0,
              bottom_layer_color=colour_set[icolor_backer]);

            if(show_debug){
                #cube(size = [line_position[ipos_size].x,line_position[ipos_size].y,2], center=true);
            }
        }
    }

    if(show_debug){
        #translate([-label_text_size.x/2,0,0])
        cube(size = [label_text_size.x,label_text_size.y,1], center=false);
    }
  }

  color(Text_Color)
  translate([0, label_size.y/2, 0])
  border(
    style = Backer_Style,
    size = [label_size.x, label_size.y, Text_Layers*Extrusion_Layer_Height],
    border_size = Backer_Color_Border);

  if(qr_position_calculated != "disabled")
  {
    translate( qr_position_calculated == "right"  ? [label_text_size.x/2, label_size.y/2, 0]
          : qr_position_calculated == "below" ? [0, qr_size_calculated/2+Text_Clearance, 0]
          : [0,0,0])

    color(Text_Color)
      qr(text_values[text_values_url], error_correction, qr_size_calculated, qr_size_calculated, Text_Layers*Extrusion_Layer_Height, 1, mask_pattern, encoding);
  }
}

module back_layer(){
  color(colour_set[icolor_backer])
  translate([0, label_size.y/2, 0]) {
    backer(
      style = Backer_Style,
      size = [label_size.x, label_size.y, Backer_Layers*Extrusion_Layer_Height],
      outer_space=Backer_Outer_Border, border_size = Backer_Color_Border);
  }
  // Create posts
  if (calculated_post_length > 0) {
    post_canvas = (label_size.x*.9-Post_Width);
    post_spacing = Post_Count <=1 ? 0 : post_canvas/(Post_Count-1);

    color(colour_set[icolor_backer])
    for (i=[0:Post_Count-1]) {
        translate([Post_Count == 1 ? 0 : -post_canvas/2+i*post_spacing,0,0])
        stand(length = calculated_post_length, width = Post_Width,thickness=Backer_Layers*Extrusion_Layer_Height);
    }
  }
}

module layered_text(
  text, font, size, spacing,
  top_layer_thickness,
  top_layer_offset,
  top_layer_color,
  middle_layer_thickness = 0,
  middle_layer_offset = 0,
  middle_layer_color,
  bottom_layer_thickness = 0,
  bottom_layer_offset = 0,
  bottom_layer_color,
  halign="center",
  valign="bottom"
  ){
 color(top_layer_color)
    translate([0,0,bottom_layer_thickness+middle_layer_thickness])
    linear_extrude(top_layer_thickness)
    offset(r=top_layer_offset) {
    text(text=text,
      size=size,
      font=font,
      spacing=spacing,
      halign=halign,
      valign=valign);
    }

  //Outline
  color(middle_layer_color)
    translate([0,0,bottom_layer_thickness])
    linear_extrude(middle_layer_thickness)
    offset(r=top_layer_offset+middle_layer_offset)
    text(text=text,
      size=size,
      font=font,
      spacing=spacing,
      halign=halign,
      valign=valign);

  //Backer
  color(bottom_layer_color)
    linear_extrude(bottom_layer_thickness)
    offset(r=top_layer_offset+middle_layer_offset+bottom_layer_offset)
    text(text=text,
      size=size,
      font=font,
      spacing=spacing,
      halign=halign,
      valign=valign);
}

module stand(
  length = 100,
  width = 10,
  thickness=2)
{
  hull(){
    translate([-width/2,-length,0])
    cube([width,length,thickness]);

    translate([0,-length,0])
    cylinder(h=thickness, d=width);
  }
}


module backer(style, size, radius = undef, outer_space=3, border_size = 1)
{
  radius = is_undef(radius) ? size.y/8 : radius;
  calc_size = [
    size.x,
    size.y
  ];

  translate([0,0,0])
  linear_extrude(size.z)
  offset(r=(outer_space+border_size))
  backer_shape(style, calc_size, radius);
}

module border(style, size, radius = undef, border_size=1)
{
  radius = is_undef(radius) ? size.y/8 : radius;

  calc_size = [
    size.x,
    size.y,
    size.z
  ];

  translate([0,0,0])
  linear_extrude(calc_size.z)
  difference(){
    offset(r=border_size)
    backer_shape(style, calc_size, radius);
    backer_shape(style, calc_size, radius);
  }
}


module backer_shape(style, size, radius = undef){
radius = is_undef(radius) ? size.y/8 : radius;

  offset(r=-radius)
  offset(r=2 * radius)
  offset(r=-radius)
  union(){
    square(size=[size.x,size.y], center=true);
    if(style == "fancy"){
      square(size=[size.x-radius*4,size.y+radius*2], center=true);
    }
  }
}


module font_demo(
  // minimum angle for a fragment (fragments = 360/fa).  Low is more fragments
  $fa = 24,
  // minimum size of a fragment.  Low is more fragments
  $fs = 2,
  // number of fragments, overrides $fa and $fs
  $fn = 0){
  text = str(Text_Line_1, " - ", Text_Line_2, " - ", Text_Line_3);

  function list_sum_metrix(list, n, pad = 0, i = 0) =
    i >= len(list) || i >= n ? 0 : list[i][itext_metrix].y+pad + list_sum_metrix(list, n, pad,i + 1);

  function text_lines(list) = [for (x = list)
  let(
    font_key = x[0],
    font_value = x[1]
  )
    get_line_settings(
      customise = false,
      text = str(font_key," - ",text),
      default_size = Text_Size,
      default_font = font_value,
      default_boldness = Text_Boldness,
      default_spacing = Text_Spacing,
      default_layers = Text_Layers,
      default_color = colour_set[icolor_text])
    ];

  function calculate_line_positions(lines_settings) = [for (i=[0:len(lines_settings)-1])
    let (
        line = lines_settings[i],
        metrix = line[itext_metrix],
        sum_x = list_sum_metrix(list=lines_settings, n=i, pad=Text_Clearance)
    ) sum_x ];

  lines_settings = text_lines(Font_Short_List);
  lines_positions = calculate_line_positions(lines_settings);
  total_height = list_sum_metrix(lines_settings, n=len(lines_settings),pad=Text_Clearance);

  translate([0,-total_height/2,0])
  for (i=[0:len(lines_settings)-1])
  let(
    line = lines_settings[i],
    position = [0,lines_positions[i],0]
  )
  {
    translate(position)
    layered_text(
      text=line[itext], font=line[itext_font], size=line[itext_size], spacing=line[itext_spacing],
      valign="bottom",
      top_layer_thickness=line[itext_layers]*Extrusion_Layer_Height,
      top_layer_offset=line[itext_boldness],
      top_layer_color=line[icolor],
      bottom_layer_thickness=Backer_Layers*Extrusion_Layer_Height,
      bottom_layer_offset=Text_Clearance,
      bottom_layer_color=colour_set[icolor_backer]);
  }
}


/*QR stuff*/
//data.scad
// Galois field 256 exponentiation table
gf256_exp = [
    1,2,4,8,16,32,64,128,29,58,116,232,205,135,19,38,
    76,152,45,90,180,117,234,201,143,3,6,12,24,48,96,192,
    157,39,78,156,37,74,148,53,106,212,181,119,238,193,159,35,
    70,140,5,10,20,40,80,160,93,186,105,210,185,111,222,161,
    95,190,97,194,153,47,94,188,101,202,137,15,30,60,120,240,
    253,231,211,187,107,214,177,127,254,225,223,163,91,182,113,226,
    217,175,67,134,17,34,68,136,13,26,52,104,208,189,103,206,
    129,31,62,124,248,237,199,147,59,118,236,197,151,51,102,204,
    133,23,46,92,184,109,218,169,79,158,33,66,132,21,42,84,
    168,77,154,41,82,164,85,170,73,146,57,114,228,213,183,115,
    230,209,191,99,198,145,63,126,252,229,215,179,123,246,241,255,
    227,219,171,75,150,49,98,196,149,55,110,220,165,87,174,65,
    130,25,50,100,200,141,7,14,28,56,112,224,221,167,83,166,
    81,162,89,178,121,242,249,239,195,155,43,86,172,69,138,9,
    18,36,72,144,61,122,244,245,247,243,251,235,203,139,11,22,
    44,88,176,125,250,233,207,131,27,54,108,216,173,71,142,1
];

// Galois field 256 log table
gf256_log = [
    undef,0,1,25,2,50,26,198,3,223,51,238,27,104,199,75,
    4,100,224,14,52,141,239,129,28,193,105,248,200,8,76,113,
    5,138,101,47,225,36,15,33,53,147,142,218,240,18,130,69,
    29,181,194,125,106,39,249,185,201,154,9,120,77,228,114,166,
    6,191,139,98,102,221,48,253,226,152,37,179,16,145,34,136,
    54,208,148,206,143,150,219,189,241,210,19,92,131,56,70,64,
    30,66,182,163,195,72,126,110,107,58,40,84,250,133,186,61,
    202,94,155,159,10,21,121,43,78,212,229,172,115,243,167,87,
    7,112,192,247,140,128,99,13,103,74,222,237,49,197,254,24,
    227,165,153,119,38,184,180,124,17,68,146,217,35,32,137,46,
    55,63,209,91,149,188,207,205,144,135,151,178,220,252,190,97,
    242,86,211,171,20,42,93,158,132,60,57,83,71,109,65,162,
    31,45,67,216,183,123,164,118,196,23,73,236,127,12,111,246,
    108,161,59,82,41,157,85,170,251,96,134,177,187,204,62,90,
    203,89,95,176,156,169,160,81,11,245,22,235,122,117,44,215,
    79,174,213,233,230,231,173,232,116,214,244,234,168,80,88,175
];

// Form is gp[0]*x^0...gp[n]*x^n (gp[i] is this constant at index i)
generator_polynomials = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [127, 122, 154, 164, 11, 68, 117],
    [255, 11, 81, 54, 239, 173, 200, 24],
    [226, 207, 158, 245, 235, 164, 232, 197, 37],
    [216, 194, 159, 111, 199, 94, 95, 113, 157, 193],
    [172, 130, 163, 50, 123, 219, 162, 248, 144, 116, 160],
    [68, 119, 67, 118, 220, 31, 7, 84, 92, 127, 213, 97],
    [137, 73, 227, 17, 177, 17, 52, 13, 46, 43, 83, 132, 120],
    [14, 54, 114, 70, 174, 151, 43, 158, 195, 127, 166, 210, 234, 163],
    [29, 196, 111, 163, 112, 74, 10, 105, 105, 139, 132, 151, 32, 134, 26],
    [59, 13, 104, 189, 68, 209, 30, 8, 163, 65, 41, 229, 98, 50, 36, 59],
    [119, 66, 83, 120, 119, 22, 197, 83, 249, 41, 143, 134, 85, 53, 125, 99, 79],
    [239, 251, 183, 113, 149, 175, 199, 215, 240, 220, 73, 82, 173, 75, 32, 67, 217, 146],
    [194, 8, 26, 146, 20, 223, 187, 152, 85, 115, 238, 133, 146, 109, 173, 138, 33, 172, 179],
    [152, 185, 240, 5, 111, 99, 6, 220, 112, 150, 69, 36, 187, 22, 228, 198, 121, 121, 165, 174],
    [44, 243, 13, 131, 49, 132, 194, 67, 214, 28, 89, 124, 82, 158, 244, 37, 236, 142, 82, 255, 89],
    [89, 179, 131, 176, 182, 244, 19, 189, 69, 40, 28, 137, 29, 123, 67, 253, 86, 218, 230, 26, 145, 245],
    [179, 68, 154, 163, 140, 136, 190, 152, 25, 85, 19, 3, 196, 27, 113, 198, 18, 130, 2, 120, 93, 41, 71],
    [122, 118, 169, 70, 178, 237, 216, 102, 115, 150, 229, 73, 130, 72, 61, 43, 206, 1, 237, 247, 127, 217, 144, 117],
    [245, 49, 228, 53, 215, 6, 205, 210, 38, 82, 56, 80, 97, 139, 81, 134, 126, 168, 98, 226, 125, 23, 171, 173, 193],
    [246, 51, 183, 4, 136, 98, 199, 152, 77, 56, 206, 24, 145, 40, 209, 117, 233, 42, 135, 68, 70, 144, 146, 77, 43, 94],
    [240, 61, 29, 145, 144, 117, 150, 48, 58, 139, 94, 134, 193, 105, 33, 169, 202, 102, 123, 113, 195, 25, 213, 6, 152, 164, 217],
    [252, 9, 28, 13, 18, 251, 208, 150, 103, 174, 100, 41, 167, 12, 247, 56, 117, 119, 233, 127, 181, 100, 121, 147, 176, 74, 58, 197],
    [228, 193, 196, 48, 170, 86, 80, 217, 54, 143, 79, 32, 88, 255, 87, 24, 15, 251, 85, 82, 201, 58, 112, 191, 153, 108, 132, 143, 170],
    [212, 246, 77, 73, 195, 192, 75, 98, 5, 70, 103, 177, 22, 217, 138, 51, 181, 246, 72, 25, 18, 46, 228, 74, 216, 195, 11, 106, 130, 150]
];

fmtinf_strs = [
    [1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0],
    [1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1],
    [1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0],
    [1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1],
    [1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0],
    [1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1],
    [1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
    [1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0],
    [1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1],
    [1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0],
    [1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1],
    [1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1],
    [1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0],
    [1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
    [1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0],
    [0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1],
    [0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0],
    [0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1],
    [0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1],
    [0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1],
    [0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1],
    [0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0],
    [0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1],
    [0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0],
    [0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1],
    [0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1]
];

verinf_strs = [
    [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1],
    [0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1],
    [0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0],
    [0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1],
    [0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1],
    [0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0],
    [0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1],
    [0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1],
    [0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0],
    [0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0],
    [0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1],
    [0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1],
    [0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0],
    [0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1],
    [0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1],
    [0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0],
    [0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1],
    [0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1],
    [0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0],
    [0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0],
    [0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1],
    [0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1],
    [0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0],
    [0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0],
    [0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1],
    [0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1],
    [0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0],
    [1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
    [1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1],
    [1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0],
    [1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0],
    [1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1]
];

// total data codewords / ec codewords per block / num blocks in group 1 / num data codewords in each of grp 1's blocks / num blocks in group 2 / num data codewords in each of grp 2's blocks
ectab = [
    [
        [19, 7, 1, 19, 0, 0],
        [16, 10, 1, 16, 0, 0],
        [13, 13, 1, 13, 0, 0],
        [9, 17, 1, 9, 0, 0]
    ],
    [
        [34, 10, 1, 34, 0, 0],
        [28, 16, 1, 28, 0, 0],
        [22, 22, 1, 22, 0, 0],
        [16, 28, 1, 16, 0, 0]
    ],
    [
        [55, 15, 1, 55, 0, 0],
        [44, 26, 1, 44, 0, 0],
        [34, 18, 2, 17, 0, 0],
        [26, 22, 2, 13, 0, 0]
    ],
    [
        [80, 20, 1, 80, 0, 0],
        [64, 18, 2, 32, 0, 0],
        [48, 26, 2, 24, 0, 0],
        [36, 16, 4, 9, 0, 0]
    ],
    [
        [108, 26, 1, 108, 0, 0],
        [86, 24, 2, 43, 0, 0],
        [62, 18, 2, 15, 2, 16],
        [46, 22, 2, 11, 2, 12]
    ],
    [
        [136, 18, 2, 68, 0, 0],
        [108, 16, 4, 27, 0, 0],
        [76, 24, 4, 19, 0, 0],
        [60, 28, 4, 15, 0, 0]
    ],
    [
        [156, 20, 2, 78, 0, 0],
        [124, 18, 4, 31, 0, 0],
        [88, 18, 2, 14, 4, 15],
        [66, 26, 4, 13, 1, 14]
    ],
    [
        [194, 24, 2, 97, 0, 0],
        [154, 22, 2, 38, 2, 39],
        [110, 22, 4, 18, 2, 19],
        [86, 26, 4, 14, 2, 15]
    ],
    [
        [232, 30, 2, 116, 0, 0],
        [182, 22, 3, 36, 2, 37],
        [132, 20, 4, 16, 4, 17],
        [100, 24, 4, 12, 4, 13]
    ],
    [
        [274, 18, 2, 68, 2, 69],
        [216, 26, 4, 43, 1, 44],
        [154, 24, 6, 19, 2, 20],
        [122, 28, 6, 15, 2, 16]
    ],
    [
        [324, 20, 4, 81, 0, 0],
        [254, 30, 1, 50, 4, 51],
        [180, 28, 4, 22, 4, 23],
        [140, 24, 3, 12, 8, 13]
    ],
    [
        [370, 24, 2, 92, 2, 93],
        [290, 22, 6, 36, 2, 37],
        [206, 26, 4, 20, 6, 21],
        [158, 28, 7, 14, 4, 15]
    ],
    [
        [428, 26, 4, 107, 0, 0],
        [334, 22, 8, 37, 1, 38],
        [244, 24, 8, 20, 4, 21],
        [180, 22, 12, 11, 4, 12]
    ],
    [
        [461, 30, 3, 115, 1, 116],
        [365, 24, 4, 40, 5, 41],
        [261, 20, 11, 16, 5, 17],
        [197, 24, 11, 12, 5, 13]
    ],
    [
        [523, 22, 5, 87, 1, 88],
        [415, 24, 5, 41, 5, 42],
        [295, 30, 5, 24, 7, 25],
        [223, 24, 11, 12, 7, 13]
    ],
    [
        [589, 24, 5, 98, 1, 99],
        [453, 28, 7, 45, 3, 46],
        [325, 24, 15, 19, 2, 20],
        [253, 30, 3, 15, 13, 16]
    ],
    [
        [647, 28, 1, 107, 5, 108],
        [507, 28, 10, 46, 1, 47],
        [367, 28, 1, 22, 15, 23],
        [283, 28, 2, 14, 17, 15]
    ],
    [
        [721, 30, 5, 120, 1, 121],
        [563, 26, 9, 43, 4, 44],
        [397, 28, 17, 22, 1, 23],
        [313, 28, 2, 14, 19, 15]
    ],
    [
        [795, 28, 3, 113, 4, 114],
        [627, 26, 3, 44, 11, 45],
        [445, 26, 17, 21, 4, 22],
        [341, 26, 9, 13, 16, 14]
    ],
    [
        [861, 28, 3, 107, 5, 108],
        [669, 26, 3, 41, 13, 42],
        [485, 30, 15, 24, 5, 25],
        [385, 28, 15, 15, 10, 16]
    ],
    [
        [932, 28, 4, 116, 4, 117],
        [714, 26, 17, 42, 0, 0],
        [512, 28, 17, 22, 6, 23],
        [406, 30, 19, 16, 6, 17]
    ],
    [
        [1006, 28, 2, 111, 7, 112],
        [782, 28, 17, 46, 0, 0],
        [568, 30, 7, 24, 16, 25],
        [442, 24, 34, 13, 0, 0]
    ],
    [
        [1094, 30, 4, 121, 5, 122],
        [860, 28, 4, 47, 14, 48],
        [614, 30, 11, 24, 14, 25],
        [464, 30, 16, 15, 14, 16]
    ],
    [
        [1174, 30, 6, 117, 4, 118],
        [914, 28, 6, 45, 14, 46],
        [664, 30, 11, 24, 16, 25],
        [514, 30, 30, 16, 2, 17]
    ],
    [
        [1276, 26, 8, 106, 4, 107],
        [1000, 28, 8, 47, 13, 48],
        [718, 30, 7, 24, 22, 25],
        [538, 30, 22, 15, 13, 16]
    ],
    [
        [1370, 28, 10, 114, 2, 115],
        [1062, 28, 19, 46, 4, 47],
        [754, 28, 28, 22, 6, 23],
        [596, 30, 33, 16, 4, 17]
    ],
    [
        [1468, 30, 8, 122, 4, 123],
        [1128, 28, 22, 45, 3, 46],
        [808, 30, 8, 23, 26, 24],
        [628, 30, 12, 15, 28, 16]
    ],
    [
        [1531, 30, 3, 117, 10, 118],
        [1193, 28, 3, 45, 23, 46],
        [871, 30, 4, 24, 31, 25],
        [661, 30, 11, 15, 31, 16]
    ],
    [
        [1631, 30, 7, 116, 7, 117],
        [1267, 28, 21, 45, 7, 46],
        [911, 30, 1, 23, 37, 24],
        [701, 30, 19, 15, 26, 16]
    ],
    [
        [1735, 30, 5, 115, 10, 116],
        [1373, 28, 19, 47, 10, 48],
        [985, 30, 15, 24, 25, 25],
        [745, 30, 23, 15, 25, 16]
    ],
    [
        [1843, 30, 13, 115, 3, 116],
        [1455, 28, 2, 46, 29, 47],
        [1033, 30, 42, 24, 1, 25],
        [793, 30, 23, 15, 28, 16]
    ],
    [
        [1955, 30, 17, 115, 0, 0],
        [1541, 28, 10, 46, 23, 47],
        [1115, 30, 10, 24, 35, 25],
        [845, 30, 19, 15, 35, 16]
    ],
    [
        [2071, 30, 17, 115, 1, 116],
        [1631, 28, 14, 46, 21, 47],
        [1171, 30, 29, 24, 19, 25],
        [901, 30, 11, 15, 46, 16]
    ],
    [
        [2191, 30, 13, 115, 6, 116],
        [1725, 28, 14, 46, 23, 47],
        [1231, 30, 44, 24, 7, 25],
        [961, 30, 59, 16, 1, 17]
    ],
    [
        [2306, 30, 12, 121, 7, 122],
        [1812, 28, 12, 47, 26, 48],
        [1286, 30, 39, 24, 14, 25],
        [986, 30, 22, 15, 41, 16]
    ],
    [
        [2434, 30, 6, 121, 14, 122],
        [1914, 28, 6, 47, 34, 48],
        [1354, 30, 46, 24, 10, 25],
        [1054, 30, 2, 15, 64, 16]
    ],
    [
        [2566, 30, 17, 122, 4, 123],
        [1992, 28, 29, 46, 14, 47],
        [1426, 30, 49, 24, 10, 25],
        [1096, 30, 24, 15, 46, 16]
    ],
    [
        [2702, 30, 4, 122, 18, 123],
        [2102, 28, 13, 46, 32, 47],
        [1502, 30, 48, 24, 14, 25],
        [1142, 30, 42, 15, 32, 16]
    ],
    [
        [2812, 30, 20, 117, 4, 118],
        [2216, 28, 40, 47, 7, 48],
        [1582, 30, 43, 24, 22, 25],
        [1222, 30, 10, 15, 67, 16]
    ],
    [
        [2956, 30, 19, 118, 6, 119],
        [2334, 28, 18, 47, 31, 48],
        [1666, 30, 34, 24, 34, 25],
        [1276, 30, 20, 15, 61, 16]
    ]
];

//bits.scad
//
// Bit operation utils (not specific to QR)
//
pow2=[1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768];
char_nums = [[0,0],["\x01",1],["\x02",2],["\x03",3],["\x04",4],["\x05",5],["\x06",6],["\x07",7],["\x08",8],["\x09",9],["\x0a",10],["\x0b",11],["\x0c",12],["\x0d",13],["\x0e",14],["\x0f",15],["\x10",16],["\x11",17],["\x12",18],["\x13",19],["\x14",20],["\x15",21],["\x16",22],["\x17",23],["\x18",24],["\x19",25],["\x1a",26],["\x1b",27],["\x1c",28],["\x1d",29],["\x1e",30],["\x1f",31],["\x20",32],["\x21",33],["\x22",34],["\x23",35],["\x24",36],["\x25",37],["\x26",38],["\x27",39],["\x28",40],["\x29",41],["\x2a",42],["\x2b",43],["\x2c",44],["\x2d",45],["\x2e",46],["\x2f",47],["\x30",48],["\x31",49],["\x32",50],["\x33",51],["\x34",52],["\x35",53],["\x36",54],["\x37",55],["\x38",56],["\x39",57],["\x3a",58],["\x3b",59],["\x3c",60],["\x3d",61],["\x3e",62],["\x3f",63],["\x40",64],["\x41",65],["\x42",66],["\x43",67],["\x44",68],["\x45",69],["\x46",70],["\x47",71],["\x48",72],["\x49",73],["\x4a",74],["\x4b",75],["\x4c",76],["\x4d",77],["\x4e",78],["\x4f",79],["\x50",80],["\x51",81],["\x52",82],["\x53",83],["\x54",84],["\x55",85],["\x56",86],["\x57",87],["\x58",88],["\x59",89],["\x5a",90],["\x5b",91],["\x5c",92],["\x5d",93],["\x5e",94],["\x5f",95],["\x60",96],["\x61",97],["\x62",98],["\x63",99],["\x64",100],["\x65",101],["\x66",102],["\x67",103],["\x68",104],["\x69",105],["\x6a",106],["\x6b",107],["\x6c",108],["\x6d",109],["\x6e",110],["\x6f",111],["\x70",112],["\x71",113],["\x72",114],["\x73",115],["\x74",116],["\x75",117],["\x76",118],["\x77",119],["\x78",120],["\x79",121],["\x7a",122],["\x7b",123],["\x7c",124],["\x7d",125],["\x7e",126],["\x7f",127],["\u0080",128],["\u0081",129],["\u0082",130],["\u0083",131],["\u0084",132],["\u0085",133],["\u0086",134],["\u0087",135],["\u0088",136],["\u0089",137],["\u008a",138],["\u008b",139],["\u008c",140],["\u008d",141],["\u008e",142],["\u008f",143],["\u0090",144],["\u0091",145],["\u0092",146],["\u0093",147],["\u0094",148],["\u0095",149],["\u0096",150],["\u0097",151],["\u0098",152],["\u0099",153],["\u009a",154],["\u009b",155],["\u009c",156],["\u009d",157],["\u009e",158],["\u009f",159],["\u00a0",160],["\u00a1",161],["\u00a2",162],["\u00a3",163],["\u00a4",164],["\u00a5",165],["\u00a6",166],["\u00a7",167],["\u00a8",168],["\u00a9",169],["\u00aa",170],["\u00ab",171],["\u00ac",172],["\u00ad",173],["\u00ae",174],["\u00af",175],["\u00b0",176],["\u00b1",177],["\u00b2",178],["\u00b3",179],["\u00b4",180],["\u00b5",181],["\u00b6",182],["\u00b7",183],["\u00b8",184],["\u00b9",185],["\u00ba",186],["\u00bb",187],["\u00bc",188],["\u00bd",189],["\u00be",190],["\u00bf",191],["\u00c0",192],["\u00c1",193],["\u00c2",194],["\u00c3",195],["\u00c4",196],["\u00c5",197],["\u00c6",198],["\u00c7",199],["\u00c8",200],["\u00c9",201],["\u00ca",202],["\u00cb",203],["\u00cc",204],["\u00cd",205],["\u00ce",206],["\u00cf",207],["\u00d0",208],["\u00d1",209],["\u00d2",210],["\u00d3",211],["\u00d4",212],["\u00d5",213],["\u00d6",214],["\u00d7",215],["\u00d8",216],["\u00d9",217],["\u00da",218],["\u00db",219],["\u00dc",220],["\u00dd",221],["\u00de",222],["\u00df",223],["\u00e0",224],["\u00e1",225],["\u00e2",226],["\u00e3",227],["\u00e4",228],["\u00e5",229],["\u00e6",230],["\u00e7",231],["\u00e8",232],["\u00e9",233],["\u00ea",234],["\u00eb",235],["\u00ec",236],["\u00ed",237],["\u00ee",238],["\u00ef",239],["\u00f0",240],["\u00f1",241],["\u00f2",242],["\u00f3",243],["\u00f4",244],["\u00f5",245],["\u00f6",246],["\u00f7",247],["\u00f8",248],["\u00f9",249],["\u00fa",250],["\u00fb",251],["\u00fc",252],["\u00fd",253],["\u00fe",254],["\u00ff",255]];

function xor(a, b) = (a || b) && !(a && b);

function xor_byte(a, b) =
    let(ba=bytes2bits([a]), bb=bytes2bits([b]))
    bits2byte([ for (i=[0:8-1]) xor(ba[i], bb[i]) ? 1 : 0 ]);

function is_bit_set(val, idx) =
    floor(val / pow2[7-idx%8]) % 2 == 1;

function bits2byte(bits) =
    bits[0]*pow2[7] +
    bits[1]*pow2[6] +
    bits[2]*pow2[5] +
    bits[3]*pow2[4] +
    bits[4]*pow2[3] +
    bits[5]*pow2[2] +
    bits[6]*pow2[1] +
    bits[7]*pow2[0];

// Truncating right bitshift
function rsh(x, n) =
    floor(x/pow(2,n));

function bittrunc(x, nbits) =
    x%pow(2,nbits);

function do_str2bytes(cps, idx=0, acc=[]) =
    idx >= len(cps) ? acc :
    cps[idx] <= 127 ?
        do_str2bytes(cps, idx+1, concat(acc, cps[idx])) :
    cps[idx] <= 2047 ?
        do_str2bytes(cps, idx+1, concat(
            acc,
            128+64+rsh(cps[idx],6),
            128+bittrunc(cps[idx],6)
        )) :
    cps[idx] <= 65535 ?
        do_str2bytes(cps, idx+1, concat(
            acc,
            128+64+32+rsh(cps[idx],12),
            128+bittrunc(rsh(cps[idx],6),6),
            128+bittrunc(cps[idx],6)
        )) :
    cps[idx] <= 1114111 ?
        do_str2bytes(cps, idx+1, concat(
            acc,
            128+64+32+16+rsh(cps[idx],18),
            128+bittrunc(rsh(cps[idx],12),6),
            128+bittrunc(rsh(cps[idx],6),6),
            128+bittrunc(cps[idx],6)
        )) :
    undef;

// UTF-8 encodes the result of str2codepts
function str2bytes(s) =
    do_str2bytes(str2codepts(s));

function do_str_num_bytes(cps, idx=0, acc=0) =
    idx >= len(cps) ? acc :
    cps[idx] <= 127 ?
        do_str_num_bytes(cps, idx+1, acc+1) :
    cps[idx] <= 2047 ?
        do_str_num_bytes(cps, idx+1, acc+2) :
    cps[idx] <= 65535 ?
        do_str_num_bytes(cps, idx+1, acc+3) :
    cps[idx] <= 1114111 ?
        do_str_num_bytes(cps, idx+1, acc+3) :
    undef;

// Length of string in UTF-8 encoding
function str_num_bytes(s) =
    do_str_num_bytes(str2codepts(s));

// ord got added in ver 2019.05 (missing in Thingiverse Customizer)
function str2codepts(s) =
    version_num() >= 20190500 ?
        [ for(i=s) ord(i) ] :
    [ for(i=search(s, char_nums, num_returns_per_match=0))
        i[0] ];

function bytes2bits(bytes) = [ for(i=[0:len(bytes)*8-1]) is_bit_set(bytes[floor(i/8)], i) ? 1 : 0 ];

// Pads not fully filled bytes with 0s
function bits2bytes(bits) = [ for(i=[0:ceil(len(bits)/8)-1]) bits2byte([
    for(j=[0:8-1])
        let(bitidx=8*i + j)
        bitidx < len(bits) ? bits[bitidx] : 0
    ]) ];

function do_strjoin(strs, delim, idx=0, acc="") =
	idx >= len(strs) ? acc :
	do_strjoin(strs, delim, idx+1, str(acc, acc == "" ? "" : delim, strs[idx]));

function strjoin(strs, delim="") =
	do_strjoin(strs, delim);

  //qr.scad

//
// Public API
//

//@PUBLIC

// Generates a QR code encoding plain text.
// error_correction: options: "L" (~7%), "M" (~15%), "Q" (~25%) or "H" (~30%)
// thickness: thickness, or 0 for 2D
// mask_pattern: range: 0-7
// encoding: options: "UTF-8" (Unicode) or "Shift_JIS" (Shift Japanese International Standards)
// convexity: only affects preview; set this when faces are drawn incorrectly (see [OpenSCAD FAQ](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/FAQ#Why_are_some_parts_(e.g._holes)_of_the_model_not_rendered_correctly?)) [does nothing if thickness=0]
module qr(message, error_correction="M", width=100, height=100, thickness=1, center=false, mask_pattern=0, encoding="UTF-8", convexity=undef)
    qr_custom(message, error_correction, width, height, thickness, center, mask_pattern, encoding, convexity=convexity) {
        default_module();
        default_position_pattern();
        default_alignment_pattern();
}

// Generates a QR code using custom elements.
// Child elements (2D, origin: [0,0], must extend into positive XY, 1 module = 1mm):
// - `children(0)`: Module (black pixel)
// - `children(1)`: Position pattern
// - `children(2)`: Alignment pattern
// error_correction: options: "L" (~7%), "M" (~15%), "Q" (~25%) or "H" (~30%)
// thickness: thickness, or 0 for 2D
// mask_pattern: range: 0-7
// encoding: options: "UTF-8" (Unicode) or "Shift_JIS" (Shift Japanese International Standards)
// convexity: only affects preview; set this when faces are drawn incorrectly (see [OpenSCAD FAQ](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/FAQ#Why_are_some_parts_(e.g._holes)_of_the_model_not_rendered_correctly?)) [does nothing if thickness=0]
module qr_custom(message, error_correction="M", width=100, height=100, thickness=1, center=false, mask_pattern=0, encoding="UTF-8", convexity=undef) {
    ec_lvl =
        error_correction == "L" ? EC_L :
        error_correction == "M" ? EC_M :
        error_correction == "Q" ? EC_Q :
        error_correction == "H" ? EC_H :
        undef;
    assert(ec_lvl >= EC_L && ec_lvl <= EC_H, "error_correction must be \"L\", \"M\", \"Q\" or \"H\"");

    enc =
        encoding == "Shift_JIS" ? ENC_SJIS :
        encoding == "UTF-8" ? ENC_UTF8 :
        undef;
    assert(enc >= ENC_SJIS && enc <= ENC_UTF8, "encoding must be \"UTF-8\" or \"Shift_JIS\"");

    message_bytes = str2bytes(message);

    ver = get_version(len(message_bytes), ec_lvl, enc);
    size = version2size(ver);

    bits = encode_message(message_bytes, ec_lvl, mask_pattern, ver, enc);

    positions = data_bit_positions(size);

    translate(center ? [-width/2, -height/2, 0] : [0,0,0])
    extrude_or_2d(thickness, convexity)
    scale([width/size, height/size]) {
        // Position patterns
        for(i=[[0,6],[size-7,6],[0,size-1]])
            translate([i[0], size-1-i[1], 0])
            children(1);
        // Timing patterns
        for(x=[8:size-1-8])
            if (x%2 == 0)
            module_1(size, x, 6) children(0);
        for(y=[8:size-1-8])
            if (y%2 == 0)
            module_1(size, 6, y) children(0);
        // Alignment patterns
        if (ver >= 2) {
            n_pats = n_alignment_patterns(ver);
            pat_step = alignment_pattern_step(ver);
            pat_last = size-1-6;
            pat_coords = concat([6], [
                for(i=[0:max(0, n_pats-2)]) pat_last-i*pat_step
            ]);
            for(y=pat_coords,x=pat_coords)
                if (!(
                    (x == 6 && y == 6) ||
                    (x == 6 && y == pat_last) ||
                    (x == pat_last && y == 6)
                ))
                translate([x-2, size-1-y-2, 0])
                children(2);
        }
        // Version information
        if(ver >= 7) {
            verinf = verinf_bits(ver);
            for(i=[0:17])
                if (verinf[17-i])
                module_1(size, floor(i/3), size-11+i%3) children(0);
            for(i=[0:17])
                if (verinf[17-i])
                module_1(size, size-11+i%3, floor(i/3)) children(0);
        }
        // Format info
        fmtinf = fmtinf_bits(ec_lvl, mask_pattern);
        for(i=[0:7])
            if (fmtinf[14-i])
            module_1(size, 8, i <= 5 ? i : i+1) children(0);;
        for(i=[8:14])
            if (fmtinf[14-i])
            module_1(size, 15-(i <= 8 ? i : i+1), 8) children(0);;
        for(i=[0:7])
            if (fmtinf[14-i])
            module_1(size, size-1-i, 8) children(0);;
        for(i=[8:14])
            if (fmtinf[14-i])
            module_1(size, 8, size-1-6+i-8) children(0);;
        module_1(size, 8, size-1-7) children(0);;
        // Modules
        for(p=positions) {
            x = p[0];
            y = p[1];
            i = p[2];
            val = apply_mask_pattern(
                bits[i],
                x, y, mask_pattern
            );
            if (val)
                module_1(size, x, y) children(0);
        }
    }
}

// Returns the length of one side of the QR code (in modules/squares).
// error_correction: options: "L" (~7%), "M" (~15%), "Q" (~25%) or "H" (~30%)
// encoding: options: "UTF-8" (Unicode) or "Shift_JIS" (Shift Japanese International Standards)
function qr_size(message, error_correction="M", encoding="UTF-8") =
    version2size(qr_version(message, error_correction, encoding));

// Returns the version of a QR code (1 <= version <= 40; version dictates the size).
// error_correction: options: "L" (~7%), "M" (~15%), "Q" (~25%) or "H" (~30%)
// encoding: options: "UTF-8" (Unicode) or "Shift_JIS" (Shift Japanese International Standards)
function qr_version(message, error_correction="M", encoding="UTF-8") =
    let(ec_lvl =
        error_correction == "L" ? EC_L :
        error_correction == "M" ? EC_M :
        error_correction == "Q" ? EC_Q :
        error_correction == "H" ? EC_H :
        undef)
    assert(ec_lvl >= EC_L && ec_lvl <= EC_H, "error_correction must be \"L\", \"M\", \"Q\" or \"H\"")
    let(enc =
        encoding == "Shift_JIS" ? ENC_SJIS :
        encoding == "UTF-8" ? ENC_UTF8 :
        undef)
    assert(enc >= ENC_SJIS && enc <= ENC_UTF8, "encoding must be \"UTF-8\" or \"Shift_JIS\"")
    get_version(str_num_bytes(message), ec_lvl, enc);

// Generates a 'connect to wifi' message which can be input into qr().
// ssid: network name
// psk: network password
// auth: options: "nopass" (open network), "WPA" (WPA password protection), "WEP" (WEP password protection; obsolete)
// hidden: whether network is hidden
function qr_wifi(ssid, psk, auth="WPA", hidden=false) =
    (auth != "nopass" && auth != "WPA" && auth != "WEP") ? undef :
    str("WIFI:T:", auth, ";S:", ssid, ";P:", auth != "nopass" ? psk : "", ";", hidden ? "H:true" : "", ";");

// Generates a 'make a phone call' message which can be input into qr().
function qr_phone_call(number) =
    str("TEL:", number);

// Generates a VCard containing contact info which can be input into qr().
// Only a basic subset of VCard is implemented.
// If applicable, multiple entries must be separated by commas (e.g. middlenames, nameprefixes...).
// lastname: last name
// firstname: first name
// middlenames: additional first names
// nameprefixes: honorific prefixes
// namesuffixes: honorific suffixes
// customfullname: full name, leave blank to automatically generate
// email: email address
// url: website or other URL
// phone: phone number
// address: street address
// ext_address: extended address (e.g. apartment or suite number)
// city: city name
// region: region (e.g. state or province)
// postalcode: postal code
// country: full country name
function qr_vcard(lastname, firstname, middlenames="", nameprefixes="", namesuffixes="", customfullname="", email="", url="", phone="", address="", ext_address="", city="", region="", postalcode="", country="") =
    let (fullname = customfullname ? customfullname :
        strjoin(
            [ for (s=[nameprefixes, firstname, middlenames, lastname, namesuffixes]) if (s != "") s ],
            delim=" "
        ))
    str(
        "BEGIN:VCARD\n",
        "VERSION:3.0\n",
        "N:",lastname,";",firstname,";",middlenames,";",nameprefixes,";",namesuffixes,"\n",
        "FN:",fullname,"\n",
        email ?
            str("EMAIL;type=PREF,INTERNET:",email,"\n") : "",
        url ?
            str("URL:",url,"\n") : "",
        phone ?
            str("TEL:",phone,"\n") : "",
        (address || ext_address || city || region || postalcode || country) ?
            str("ADR;TYPE=HOME:",";",ext_address,";",address,";",city,";",region,";",postalcode,";",country,"\n") : "",
        "END:VCARD\n"
    );

// Generates a VCalendar event which can be input into qr().
// summary: short event description
// description: event description
// location: location name
// start_datetime: start date time UTC string, can be generated using qr_vevent_datetime()
// end_datetime: end date time UTC string, can be generated using qr_vevent_datetime()
function qr_vevent(summary="", description="", location="", start_datetime, end_datetime) =
    str(
        "BEGIN:VCALENDAR\n",
        "VERSION:2.0\n",
        "PRODID:-//hacksw/handcal//NONSGML v1.0//EN\n",
        "BEGIN:VEVENT\n",
        summary ?
            str("SUMMARY:", summary, "\n") : "",
        description ?
            str("DESCRIPTION:", description, "\n") : "",
        location ?
            str("LOCATION:", location, "\n") : "",
        "DTSTAMP:", start_datetime, "\n",
        "DTSTART:", start_datetime, "\n",
        "DTEND:", end_datetime, "\n",
        "END:VEVENT\n",
        "END:VCALENDAR\n"
    );

// Generates a UTC datetime string to be input into qr_vevent.
function qr_vevent_datetime(year, month, day, hour, minute, second) =
    str(
        padstr(str(year), "0", 4), padstr(str(month), "0", 2), padstr(str(day), "0", 2), "T",
        padstr(str(hour), "0", 2), padstr(str(minute), "0", 2), padstr(str(second), "0", 2), "Z"
    );

//@PRIVATE

//
// Misc helper functions
//
function padstr(s, ch, pad, acc="") =
    len(acc) >= pad-len(s) ?
    str(acc, s) :
    padstr(s, ch, pad, str(acc, ch));

//
// QR code helper modules
//
module default_module() {
    square([1, 1]);
}

module default_position_pattern() union() {
    difference() {
        square(7);
        translate([1, 1])
            square(5);
    }
    translate([2, 2])
        square(3);
}

module default_alignment_pattern() union() {
    difference() {
        square(5);
        translate([1, 1])
            square(3);
    }
    translate([2, 2])
        square(1);
}

module module_1(size, x, y) {
    epsilon=0.0001; // ensures adjacent modules fuse together when rendering
    translate([x-epsilon, size-1-y-epsilon, 0])
        scale([1+2*epsilon, 1+2*epsilon, 1])
        children(0);
}

// Applies linear_extrude(thickness) only if thickness > 0
module extrude_or_2d(thickness, convexity) {
    if (thickness <= 0) {
        children(0);
    } else {
        linear_extrude(thickness, convexity=convexity)
            children(0);
    }
}

function data_bit_positions(size, index=0, pos=undef, acc=[]) =
    let(nextpos=next_module_position(pos, size))
    nextpos == undef ? acc :
    let(app=concat([nextpos[0], nextpos[1]], index))
    data_bit_positions(size, index+1, nextpos, concat([app], acc));

//
// QR code general functions
//
// Error correction levels
EC_L = 0; // low      (7% recovery)
EC_M = 1; // medium   (15% recovery)
EC_Q = 2; // quartile (25% recovery)
EC_H = 3; // high     (30% recovery)

// Encodings supported by this library
ENC_SJIS = 0; // Shift Japanese International Standards (standard QR code encoding)
ENC_UTF8 = 1; // Unicode

function version2size(ver) = 17+4*ver;
function size2version(size) = (size-17)/4;

function do_get_version(msg_bytelen, ec_lvl, ver, encoding) =
    ver > 40 ? undef :
    get_max_msg_bytelen(ver, ec_lvl, encoding) >= msg_bytelen ?
        ver :
        do_get_version(msg_bytelen, ec_lvl, ver+1, encoding);

// Picks the right QR code size (called version) for
// the given message length and error correction level
function get_version(msg_bytelen, ec_lvl, encoding) =
    do_get_version(msg_bytelen, ec_lvl, 1, encoding);

// Applies one of the 7 mask patterns via XOR
function apply_mask_pattern(val, x, y, pat) =
    pat == 0 ?
        ((y + x) % 2 == 0 ? !val : val) :
    pat == 1 ?
        (y % 2 == 0 ? !val : val) :
    pat == 2 ?
        (x % 3 == 0 ? !val : val) :
    pat == 3 ?
        ((y + x) % 3 == 0 ? !val : val) :
    pat == 4 ?
        ((floor(y/2) + floor(x/3)) % 2 == 0 ? !val : val) :
    pat == 5 ?
        (y*x % 2 + y*x % 3 == 0 ? !val : val) :
    pat == 6 ?
        ((y*x % 2 + y*x % 3) % 2 == 0 ? !val : val) :
    pat == 7 ?
        ((y*x%3 + y+x) % 2 == 0 ? !val : val) :
    undef;

//
// QR code message encoding
//
function get_max_msg_bytelen(ver, ec_lvl, encoding) =
    let(maxbytes=ectab[ver-1][ec_lvl][0])
    let(msg_len_bytes=ver <= 9 ? 1 : 2)
    let(extra_bytes= // see data_codewords() for what these do
        encoding == ENC_SJIS ? 1 :
        encoding == ENC_UTF8 ? 2 :
        undef)
    maxbytes - msg_len_bytes - extra_bytes;

// Performs a gf2^8 finite field multiplication
function gf256_mul(a, b) =
    a == 0 || b == 0 ? 0 :
    gf256_exp[
        (gf256_log[a] + gf256_log[b]) % 255
    ];

// Performs gf2^8 polynomial long division of data_cws by gp
function do_ec_codewords(n, data_cws, gp, res, i) =
    i >= len(data_cws) ?
        res :
    let (lt = xor_byte(data_cws[i], res[0]))
    let (res = [ for(i=[1:len(res)-1]) res[i] ])
    let (res = concat(res, [0]))
    let (res = [ for(i=[0:n-1])
        xor_byte(res[i], gf256_mul(gp[i], lt))
    ])
    do_ec_codewords(n, data_cws, gp, res, i+1);

// Generates n error correction codewords for data_cws
function ec_codewords(n, data_cws) =
    do_ec_codewords(n, data_cws, generator_polynomials[n], [ for(i=[0:n]) 0 ], 0);

// Error correction patterns converted to decimal
ec_pats = [
    1,
    0,
    3,
    2
];

// Look up format info with error correction
function fmtinf_bits(ec_lvl, mask_pat) =
    // equivalent to: ec_lvl << 3 | mask_pat
    fmtinf_strs[ec_pats[ec_lvl] * pow2[3] + mask_pat];

// Look up version info bits
function verinf_bits(ver) =
    verinf_strs[ver-1];

// Pads bytes with add additional bytes
// The padding bytes alternate between the
// values 236 and 17
function pad_bytes(bytes, add) =
    [ for(i=[0:len(bytes)+add-1])
        i < len(bytes) ?
            bytes[i] :
        (i-len(bytes)) % 2 == 0 ? 236 : 17
    ];

// Encode msg as data codewords, including the header
// and padding
// Returns a byte stream
function data_codewords(msg_bytes, ec_lvl, ver, encoding) =
    let(max_msg_bytes=get_max_msg_bytelen(ver, ec_lvl, encoding))
    let(msg_len_bits=bytes2bits(ver <= 9 ?
        [ len(msg_bytes) ] :
        [ floor(len(msg_bytes)/pow2[8]), len(msg_bytes) ]))
    let(mode=
        encoding == ENC_SJIS ? [0,1,0,0] :
        encoding == ENC_UTF8 ? [0,1,1,1] :
        undef)
    let(eci_enc=
        encoding == ENC_SJIS ? [] :
        encoding == ENC_UTF8 ? bytes2bits([26]) :
        undef)
    let(eci_mode=
        encoding == ENC_SJIS ? [] :
        encoding == ENC_UTF8 ? [0,1,0,0] :
        undef)
    let(terminator=
        encoding == ENC_SJIS ? [0,0,0,0] :
        encoding == ENC_UTF8 ? (
            // the terminator may be omitted if the
            // message fits perfectly into the maximum
            // number of bytes
            len(msg_bytes) == max_msg_bytes ?
                [] : [0,0,0,0,0,0,0,0]
        ) :
        undef)
    let(bits=concat(
        mode,
        eci_enc,
        eci_mode,
        msg_len_bits,
        bytes2bits(msg_bytes),
        terminator
    ))
    let(pad_amt=max_msg_bytes
        -len(msg_bytes)
        -(len(terminator) == 8 ? 1 : 0))
    pad_bytes(bits2bytes(bits), pad_amt);

// Splits the data codewords into the appropriate blocks
function data_blocks(data_cws, ec_lvl, ver) =
    let(n_blocks_grp1=ectab[ver-1][ec_lvl][2])
    let(n_blocks_grp2=ectab[ver-1][ec_lvl][4])
    let(grp1_block_size=ectab[ver-1][ec_lvl][3])
    let(grp2_block_size=ectab[ver-1][ec_lvl][5])
    [ for(i=[0:n_blocks_grp1+n_blocks_grp2-1])
        let(block_offset=i < n_blocks_grp1 ?
            i*grp1_block_size :
            n_blocks_grp1*grp1_block_size + (i-n_blocks_grp1)*grp2_block_size)
        let(block_size=i < n_blocks_grp1 ? grp1_block_size : grp2_block_size)
        [ for(j=[0:block_size-1])
            data_cws[block_offset+j]
        ]];

function interleave_codewords(blocks) =
    [ for(i=[0:max([ for(b=blocks) len(b) ])-1])
        for(j=[0:len(blocks)-1])
            if(i < len(blocks[j]))
                blocks[j][i]
    ];

function ec_blocks(data_blocks, ec_lvl, ver) =
    let(ec_n=ectab[ver-1][ec_lvl][1])
    [ for(block=data_blocks)
        ec_codewords(ec_n, block) ];

// Get final encoded data including error
// correction as bits
function encode_message(msg_bytes, ec_lvl, mask_pattern, ver, encoding) =
    let(data_blocks=data_blocks(data_codewords(msg_bytes, ec_lvl, ver, encoding), ec_lvl, ver))
    let(data_cws=interleave_codewords(data_blocks))
    let(ec_blocks=ec_blocks(data_blocks, ec_lvl, ver))
    let(ec_cws=interleave_codewords(ec_blocks))
    concat(
        bytes2bits(data_cws), // data codewords
        bytes2bits(ec_cws) // error correction
    );


//
// QR code module placement
//
// Gets the maximum alignment patterns per row /
// column, NOT the overall total
function n_alignment_patterns(ver) =
    ver == 1 ? 0 :
    floor(ver/7)+2;

// Distance between alignment patterns
// (excluding the first one which is
// always at x=6)
function alignment_pattern_step(ver) =
    let(size=version2size(ver))
    let(n=n_alignment_patterns(ver))
    2*ceil((size-1-12)/(2*(n-1)));

// x can be either x or y; does not account
// for illegal positions
function coord_is_in_alignment_pattern(x, size) =
    let(ver=size2version(size))
    let(s=alignment_pattern_step(ver))
    ver == 1 ? false :
    (x >= 4 && x < 9) ||
    (
        (x > 6+2) &&
        ((s+size-1-6+2-x)%s) < 5
    );

function region_is_in_bounds(x, y, size) =
    x >= 0 && x < size &&
    y >= 0 && y < size;

function region_is_data(x, y, size) =
    region_is_in_bounds(x, y, size) &&
    // position squares and format info
    !(
        (x < 9 && y < 9) ||
        (x < 9 && y > size-9) ||
        (y < 9 && x > size-9)
    ) &&
    // version info
    !(
        size >= version2size(7) && (
            (x < 6 && y > size-12) ||
            (y < 6 && x > size-12)
        )
    ) &&
    // timing pattern
    !(x == 6 || y == 6) &&
    // alignment pattern
    !(
        size > version2size(1) &&
        !(
            // illegal position
            // for alignment patterns
            // (intersecting with
            // position pattern)
            (x == size-9 && y < 9) ||
            (y == size-9 && x < 9)
        ) &&
        (
            coord_is_in_alignment_pattern(x, size) &&
            coord_is_in_alignment_pattern(y, size)
        )
    );

// Finds the next free module starting
// from x, y while going in the y-direction
// ydir in a right-to-left zig-zag
function find_next_free_module(x, y, ydir, size, depth=0) =
    region_is_data(x, y, size) ? [x, y] :
    region_is_data(x-1, y, size) ? [x-1, y] :
    find_next_free_module(x, y+ydir, ydir, size, depth+1);

function next_module_position(prev, size, depth=0) =
    prev == undef ? [size-1, size-1] :
    let(eff_x=
        prev[0] < 6 ? prev[0] :
        prev[0]-1)
    let(ydir=
        eff_x % 4 < 2 ? 1 : -1)
    let(right=eff_x % 2 == 1)
    let(x=
        right ? prev[0]-1 : prev[0]+1)
    let(y=
        right ? prev[1] : prev[1] + ydir)
    !region_is_in_bounds(x, y, size) ? (
        x < 2 ? undef :
        let(x=
            x == 8 ? x-3 : x-2) // go 1 further left if module would collide with timing pattern
        find_next_free_module(x, y, -ydir, size)
    ) :
    !region_is_data(x, y, size) ? (
        region_is_data(x-1, y, size) ? [x-1, y] :
        next_module_position([x-1, y], size, depth+1)
    ) :
    [x, y];
