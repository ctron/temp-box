use <cover.scad>;
use <casing.scad>;

// preview

*union() {
    difference() {
        union() {
            translate([0,0,10])
            cover_noses(40,20,1);
            casing(40,20, 10);
        }
        
        translate([-1,-1, -1])
        cube([20,30,30]);
    }
}

// print

translate([0, -10, 1])
rotate([180,0,0])
cover_noses(20,20,1);

casing(20,20, 10);
