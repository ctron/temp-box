
// buchse

module buchse() {
    w=7;
    h=9;
    d=7.5;

    color("red") union() {
        cube([w,d,h]);
    }
    color("lightblue") {
        translate([w/2,0,h/2])
            rotate([90,0,0])
                cylinder(h=4, d=4, $fn=50);
        translate([w/2,0,h/2])
            rotate([90,0,0])
                cylinder(h=1, d=6, $fn=50);
    }
    color("lightgreen") {
        // front nose
        translate([w/2,0,h+2])
            nose();
        // back nose #1
        rotate([-90,0,0])
        translate([w/2,-0.5,d+1.5])
            nose();
        // back nose #2
        rotate([-90,0,0])
        translate([w/2,-7,d+1.5])
            nose();
    }
}


// flat metal nose

module nose() {
    translate([0,.1,0])
    union() {
        rotate([90,0,0])
            cylinder(h=0.1, d=2, $fn=50);
        translate([-1,-0.1,-2])
            cube([2,0.1,2]);
    }
}
