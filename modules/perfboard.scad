
module board(x,y, nx, ny, t=1.6) {

    a = 2.54;

    difference() {

        // board
        color("darkgreen")
        cube([x, y, t]);

        // side offset
        ox = (x - (nx * a)) / 2;
        oy = (y - (ny * a)) / 2;

        // holes
        color("darkgreen")
        for (ix = [0: nx])
        for (iy = [0: ny])
            translate([ix * a + ox, iy * a + oy, 1])
            cylinder(h=3, d=1, center=true, $fn=10);

        // corner holes
        color("darkgreen")
        translate([0,0,-1])
        union() {
            off=.5;
            translate([1+off, 1+off, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([x-1-off, 1+off, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([1+off, y-1-off, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([x-1-off, y-1-off, 0])
            cylinder(h=3, d=2, $fn=10);
        }

    }

}

//board(70, 30, 24, 10);
board(60, 40, 20, 14);