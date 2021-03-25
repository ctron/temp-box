
module top(w, t, s) {

    d=10; // down
    g=11; // gap
    g2=-1-t; // front gap
    g3=10; // top next gap

    g4=g*.8; // gap of front

    translate([-t/2,0,0])
    cylinder(h=w, d=t, $fn=20);
    
    translate([-t/2,-t/2,0])
    cube([t/2 + g, t, w]);
  
    translate([-t, -d, 0])
    cube([t, d, w]);
    
    translate([-t/2,-d,0])
    cylinder(h=w, d=t, $fn=20);

    
    translate([g-g4,-t-w-g3-s,w+g2])
    cube([g4,w,t]);

    translate([g-g4,-t-g3-s, w+g2+t/2])
    rotate([90,0,0])
    cylinder(h=w, d=t, $fn=20);
}

w=20;
t=3;
g=11;

top(w=w, t=t, s=30);


translate([g,-80+t/2,0])
cube([1,80,22+t]);

translate([g,-80+t/2,0])
cube([20,1,22+t]);

%
color("#ffff0022")
translate([0,-100-t*1.5,0])
cube([10,100,w]);