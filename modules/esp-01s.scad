module esp_01s () {
    
    union() {
        color("#222222")
        cube([24.75, 14.5, 1]);

        color("black")
        translate([10,9,-2])
        cube([5,5,2]);

        color("black")
        translate([10,2.5,-1])
        cube([5,5,1]);
    }

    // pins
    translate([.25,14.5/2-10/2,1])
    pins(2,4);

}

module pins (x, y) {
    for (ix=[0:x-1]) {
    for (iy=[0:y-1]) {
        translate([ix*2.5,iy*2.5,0])
        pin();
    }
    }
}

module pin() {
    color("black")
    cube([2.5,2.5,2.5]);

    p1=2.5/2-1/2;
    color("yellow")
    translate([p1, p1, 2.5])
    cube([1,1,6]);

    p2=2.5/2-.5/2;
    color("#AAAAAA")
    translate([p2, p2, -3])
    cube([.5,.5,3]);
}

esp_01s();