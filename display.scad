module display() {
    
    // board
    color("green")
    cube([38,1,12]);

    // display
    color("#444444")
    translate([6, -2, .5])
    cube([30,2,11]);

    // pins
    translate([0,0,.25])
    for (i=[0:3]) {
        color("black")
        translate([0, 1, i*3])
        cube([2.5,2,2.5]);

        color("yellow")
        translate([.75, 2, .75 + (i*3)])
        cube([1,6,1]);

        color("#AAAAAA")
        translate([0.75, -1.5, 0.75 + (i*3)])
        cube([.5,2,.5]);
    }
}

display();
