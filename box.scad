
use <modules/display.scad>;
use <cover.scad>;

// position of the socket
p = 20;

// casing

module casing(x,y,h,t=1) {
    color("white")
    translate([0,0,h/2])
    difference(){
        cube([x,y,h], center=true);
        translate([0,0,t])
            cube([x-2*t,y-2*t,h], center=true);
    }
}

// box

module box() {

    // case
    difference() {
        casing(100,100,20,1);

        // cut out hole for the plug
        translate([p,-48, 5.5])
        rotate([90,0,0])
        // the hole is 6mm now, which is the outer ring
        cylinder(h=3, d=6, $fn=50);

        // cut out hole for the display
        translate([51,-13,5])
        rotate([0,0,90])
        cube([28,5,8]);
    }

    translate([p,-50,0])
    fassung();

    translate([47,-20,4])
    rotate([0,0,90])
    display_holder();

    // support: display holder
    translate([49,-22, 0])
    rotate([0,0,90])
    cube([42,5,3]);

    // battery section
    translate([-49, 9, 0])
    rotate([0,0,-90])
    battery_section();
}

module display_holder() {

    difference() {
        translate([-2,-2,-1])
        cube([42,6,12]);

        // cut out inner parts
        translate([0,-2-.1,0])
        cube([39,4.5+.1,13]);

        // cut out pins
        translate([0,1,0])
        cube([3,5.5,11.1]);
    }
    
    %display();
}

module fassung() {
    
    w=7;
    h=9;
    d=7.5;

    color("white")
    difference() {
        union () {
            translate([-w/2-2, 0, 0])
                cube([w+4, d+1.5, h+1]);
            translate([-w/2-2, d+1.5, 1])
                cube([w+4, 1, 1]);
        }
        // cut outs:

        // sides
        translate([4.5,-.1,0])
        cube([2, d-1, h-2]);
        translate([-w+0.5,-.1,0])
        cube([2, d-1, h-2]);

        // nose
        translate([-1.1,d-.1,1])
            cube([2.2,2.7,1.1]);
        translate([-w/2,-.1,1])
            cube([w,d+1.6,1.1]);
        // top cube 
        translate([-w/2,-.1,2])
            cube([w,d+2.1,h+1.1]);
    }    
}

module battery_section() {
    color("white")
    difference() {
        translate([-1,-1,0])
        cube([60,50,18]);
        // inner box
        translate([0,0,1])
        cube([58,48,19]);

        // cable outlet
        translate([-3,25,1])
        cube([5,10,7]);
    }
}

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

// klammer: oben

module klammer_oben() {
    difference() {
        cube([13,2,3]);
        translate([1,-1,1])
            cube([11,3.1,1]);
        translate([1.8,-1.1,-.1])
            cube([9.4,3.2,1.3]);
    }
}

// klammer: hinten

module klammer_hinten() {
    x=13;
    y=3;
    t=1;
    difference() {
        cube([x,y+t*2,2]);
        translate([2,-1,-0.5])
            cube([x-t*4,y,3]);
        translate([1,1,-0.5])
            cube([x-t*2,y,3]);
    }
}

// == background

translate([p-6.5,-47+2,2.5])
color("#ff000066")
    %klammer_hinten();

translate([p-6.5, -48+3, 6])
rotate([90,0,0])
color("#ff000066")
    //%klammer_oben();
    %klammer_hinten();

translate([p-3.5,-49,1])
    %buchse();

*translate([-50,-50,20])
    %cover(100,100,1);

// == prints

box();

/*
for (i=[0:1]) {
    translate([-70,-0+(i*10),0])
    rotate([90,0,0])
        klammer_oben();
}
*/

for (i=[0:3]) {
    translate([-70,-10-(i*12),0])
        klammer_hinten();
}
