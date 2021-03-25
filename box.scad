
use <modules/display.scad>;
use <modules/perfboard.scad>;
use <cover.scad>;
use <casing.scad>;
use <modules/socket.scad>;
use <modules/handle.scad>;

// position of the socket
p = 60;
pd = 10;
pb = 75;

// box

module box() {

    x = 80;
    y = 110;
    h = 30;
    t = 1;

    // case
    difference() {
        casing(x, y, h, t);

        // cut out hole for the plug
        translate([x-1, p, 5.5])
        rotate([0,0,90])
        rotate([90,0,0])
        // the hole is 6mm now, which is the outer ring
        cylinder(h=3, d=6, $fn=50);

        // cut out hole for the display
        translate([x+1,pd+7,5])
        rotate([0,0,90])
        cube([25,5,8]);

        // cut out hole for the switch
        translate([-1,67,10])
        rotate([0,90,0])
        cylinder(h=5, d=6, $fn=50);
    }

    translate([x,p,0])
    rotate([0,0,90])
    fassung();

    translate([x-3,pd,4])
    rotate([0,0,90])
    display_holder();

    // support: display holder
    translate([x-1, pd-2, 0])
    rotate([0,0,90])
    cube([42,6,3]);

    // battery section
    translate([1, 59, 0])
    rotate([0,0,-90])
    battery_section();

    // board
    union() {
        translate([1,pb-1])
        union() {
            d=1.6;
            loff = 3;
            toff = 0;
            x = 66;
            y = 26;
            translate([loff,toff, 1])
            mount(d=d);
            translate([loff+x,toff, 1])
            mount(d=d);
            translate([loff, toff+y, 1])
            mount(d=d);
            translate([loff+x,toff+y, 1])
            mount(d=d);
        }
        
        translate([2.5,pb-2.5,3.1])
        %board(70, 30, 24, 10);
    }

    // handle
    
    translate([x-1.5,-10-t,h])
    rotate([0,180,-90])
    top(w=20, t=3, s=30);
}

// mount for the perfboard
module mount(d=1,h1=2, h2=4) {
    cylinder(h=h1, d=3.5, $fn=50);
    translate([0,0,h1])
    cylinder(h=h2, d=d, $fn=50);
}

module mount_cover(d=1, t=1, h=2) {
    difference() {
        cylinder(h=h+t/2, d=d+t, $fn=50);
        translate([0,0,-.1])
        cylinder(h=h+.2, d=d, $fn=50);
        translate([0,-5,0])
        *cube([20,20,20]);
    }
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

    translate([-3.5,1,1])
    %buchse();
}

module battery_section() {
    x=60;
    y=51;
    t=1;
    color("white")
    difference() {
        translate([-1,-1,0])
        cube([x,y,18]);
        // inner box
        translate([0,0,1])
        cube([x-t*2,y-t*2,19]);

        // cable outlet
        translate([-3,27,1])
        cube([5,10,20]);
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

module klammer_neu() {
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

rotate([0,0,90])
translate([p-6.5,-75,2.5])
color("#ff000066")
    %klammer_neu();

translate([75, p-6.5, 6])
rotate([90,0,90])
color("#ff000066")
    %klammer_neu();

*translate([-50,-50,20])
    %cover_pins(100,100,1);

// == prints

box();

// for printing a slice of the box
*intersection() {
    box();
    translate([0,0,0])
    cube([51,60,30]);
}

*for (i=[0:1]) {
    translate([-70,-0+(i*10),0])
    rotate([90,0,0])
        klammer_oben();
}


*for (i=[0:3]) {
    translate([-30,00+(i*12),0])
        klammer_neu();
}

/*
for (d=[0:10])
translate([-10, 0+(d*5), 0 ])
mount(d=1+d/10);
translate([-10,0,])
cube([10,60,2]);
*/

*mount(d=1.8);

*translate([5,0,2.5])
rotate([180,0,0]) {
    mount_cover(d=2.0, h=2);
    translate([5, 0,0])
    mount_cover(d=2.2, h=2);
    translate([10, 0,0])
    mount_cover(d=2.4, h=2);
}
