
module board(x,y, nx, ny, t=1.6) {

    a = 2.54;

    difference() {

        // board
        color("darkgreen")
        cube([x, y, t]);

        // side offset
        ox = (x - (nx * a)) / 2 + 0.5;
        oy = (y - (ny * a)) / 2 + 0.8;

        // holes
        color("darkgreen")
        for (ix = [0: nx-1])
        for (iy = [0: ny-1])
            translate([ix * a + ox, iy * a + oy, 1])
            cylinder(h=3, d=1, center=true);

        // corner holes
        color("darkgreen")
        translate([0,0,-1])
        union() {
            xoff=0.5;
            yoff=1;
            translate([1+xoff, 1+yoff, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([x-1.5-xoff, 1+yoff, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([1+xoff, y-1-yoff, 0])
            cylinder(h=3, d=2, $fn=10);
            translate([x-1.5-xoff, y-1-yoff, 0])
            cylinder(h=3, d=2, $fn=10);
        }

    }

}

//board(70, 30, 24, 10);
board(60, 40, 20, 14);