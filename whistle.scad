//Basic whistle
$fs = 0.5; //Set to 1.5 during design, 0.5 before final compile/rendering
$fa = 0.5; //Set to 1.0 during design, 0.5 before final compile/rendering
dc = 20; //O.D of cylinder
lb = 30; //length of blower part measured from the centerline of cylinder
tb = 5; //outer thickness of blower part
tw = 1; //wall thickness
ht = 15; //height of the whistle
di = dc - 2*tw; //diameter of inner shape
hti = ht - 2*tw; //height of inner shape
tbi = tb - 2*tw; //thickness of blower section in inner shape
dh = 4*tw; //for the chord hole
th = tw*1.5; //for the chord hole
union(){
	//main body
	difference(){
		difference(){
			//Outer hull
			union(){
				cylinder(r=dc/2, h=ht, center=false);
				translate([0,(dc/2) -tb,0]) cube([lb,tb,ht]);
			}
			color([0,0,1]){
				translate([0,0,tw]){
					//Inner shape
					union(){
						cylinder(r=di/2, h=hti, center=false);
						translate([0,(di/2)-tbi,0]) cube([lb,tbi,hti]);
					}
				}
			}
		}

		//for the notch
		color([1,0,0]){
			translate([dc/4,dc/2,tw])
			union(){
				cylinder(r=tw, h=hti,$fn=4);
				translate([0,-1*tw,0]) cube([2*tw,2*tw,hti]);
			}
		}
	}

	//This is the chord holder
	translate([-1*(dc/2 + dh/5),0,(ht-th)/2]){
		difference(){
			cylinder(r=dh/2,h=th);
			cylinder(r=dh/4,h=th);
		}
	}
}
