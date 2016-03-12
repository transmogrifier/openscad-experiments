//Tippe top
$fs = 0.5; //Set to 1.5 during design, 0.5 before final compile/rendering
$fa = 0.5; //Set to 1.0 during design, 0.5 before final compile/rendering
rs = 18; //radius of the spherical portion
ra = 30; //recess angle
rr = rs*sin(ra); //radius of the cylindrical recess
rh = 3.0; // radius of the handle
roffset = rs/6; //recess base offset from center of sphere
hr = rs + roffset; //height of the recess
hh = 1.5*rs;
union(){
  difference(){
    sphere(r=rs);
    translate([0,0,-1*roffset]){
        cylinder(r=rr, h=hr, center=false);
      }
  }
  translate([0,0,-1*roffset]){
    cylinder(r=rh, h=hh, center=false);
    translate([0,0,hh]) sphere(r=rh);
  }
}
