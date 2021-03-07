module cover(x,y,t) {
    n=2;
    d=2;
    cube([x,y,t]);

    translate([x-d,y-d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([x-d,d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([d,y-d,-2])
    cylinder(h=n,d=d, $fn=50);
    translate([d,d,-2])
    cylinder(h=n,d=d, $fn=50);
}

// prints

translate([-50,50,1])
rotate([180,0,0])
cover(100,100,1);