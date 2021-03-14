
// casing

module casing(x,y,h,t=1) {

    color("white")
    difference(){
        cube([x,y,h]);
        translate([t,t,t])
            cube([x-2*t,y-2*t,h]);
    }

    l = 3;
    g = 5;

    t_hole = 0.8;
    t_nose = 0.8;
    t_all = 3;

    translate([0,0,h])
    casing_noses(x, y ,l, g, t, t_hole, t_nose, t_all);
}

module casing_noses(x, y, l, g, t, t_hole, t_nose, t_all) {

    push = t_all-t_nose - .1;

    translate([t,t,-push])
    casing_noses_side(x, l, g, t, t_hole, t_nose, t_all);

    translate([x-t,y-t,-push])
    rotate([0,0,180])
    casing_noses_side(x, l, g, t, t_hole, t_nose, t_all);

    translate([t,y-t,-push])
    rotate([0,0,270])
    casing_noses_side(y, l, g, t, t_hole, t_nose, t_all);

    translate([x-t,t,-push])
    rotate([0,0,90])
    casing_noses_side(y, l, g, t, t_hole, t_nose, t_all);
}

module casing_noses_side(s, l, g, t, t_hole, t_nose, t_all) {

    n = floor((s-2*t)/(l+g));
    rem = (s-2*t) - (n * (l+g));
    gap = rem / n;
    igap = (g+gap)/2;

    a = .1;

    for (i = [0:n-1]) {
        translate([igap + (i*(gap+l+g)), 0-a, 0])

        cube([l,t_hole+a,t_hole]);
    }
}