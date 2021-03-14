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

rotate([180,0,0])
cover_noses(40,20,1);