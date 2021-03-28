module cover_plate(x,y,t) {
    cube([x,y,t]);
}

module cover_pins(x,y,t) {
    n=2;
    d=2;

    cover_plate(x,y,t);

    translate([x-d,y-d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([x-d,d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([d,y-d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([d,d,-2])
    cylinder(h=n,d=d, $fn=50);
}

module cover_squares(x,y,t) {
    n=4;
    d=2;

    difference() {
        cover_plate(x,y,t);

        *translate([0,1,.6])
        scale([.03,.03,.2]) 
        linear_extrude(height = 5, $fn=10) { 
            //import("assets/drogueiot_onecolor_icon_reverse.dxf");
            import("assets/rodney.svg");
        }
    }

    translate([0,0,-n]) {
        translate([x-d-t,y-d-t,0])
        cube([d,d,n]);
        translate([x-d-t,d-t,0])
        cube([d,d,n]);
        translate([d-t,y-d-t,0])
        cube([d,d,n]);
        translate([d-t,d-t,0])
        cube([d,d,n]);
    }
}

module cover_bars(x,y,t) {
    n=4;
    d=2;

    difference() {
        cover_plate(x,y,t);

        *translate([0,1,.6])
        scale([.03,.03,.2]) 
        linear_extrude(height = 5, $fn=10) { 
            //import("assets/drogueiot_onecolor_icon_reverse.dxf");
            import("assets/rodney.svg");
        }
    }

    translate([0,0,-n]) {
        translate([t,t,0])
        cube([x-2*t,d,n]);

        translate([t,y-d-t,0])
        cube([x-d-t,d,n]);

        translate([t,t,0])
        cube([d,y-2*d,n]);

        translate([x-d-t,t,0])
        cube([d,y-2*t,n]);
    }
}

module cover_noses(x,y,t) {
    l = 3;
    g = 5;

    t_hole = 0.8;
    t_nose = 0.8;
    t_all = 3;

    cover_plate(x,y,t);

    translate([0,0,-t])
    union() {
        translate([t,t,0])
        cover_noses_side(x, l, g, t, t_hole, t_nose, t_all);

        translate([x-t,y-t,0])
        rotate([0,0,180])
        cover_noses_side(x, l, g, t, t_hole, t_nose, t_all);

        translate([x-t,t,0])
        rotate([0,0,90])
        cover_noses_side(y, l, g, t, t_hole, t_nose, t_all);

        translate([t,y-t,0])
        rotate([0,0,270])
        cover_noses_side(y, l, g, t, t_hole, t_nose, t_all);
    }
}

module cover_noses_side(s, l, g, t, t_hole, t_nose, t_all) {
    n = floor((s-2*t)/(l+g));
    rem = (s-2*t) - (n * (l+g));
    gap = rem / n;
    igap = (g+gap)/2;

    translate([0,0,-t])
    for (i = [0:n-1]) {
        translate([igap + (i*(gap+l+g)), 0, -t])
        cover_nose(l, t, t_hole, t_nose, t_all);
    }
}

module cover_nose(l, t, t_hole, t_nose, t_all) {
    difference() {
        cube([l, t_hole+t_nose, t_all]);
        translate([-.1, -.1, t_hole])
        cube([l+.2, t_hole+.1, t_all+.1]);
    }
}

// prints

*rotate([180,0,0])
cover_noses(40,20,1);

x = 80;
y = 110;

*rotate([180,0,0])
cover_squares(x,y,1);

rotate([180,0,0])
cover_bars(x,y,1);

%cover_squares(40,20,1);