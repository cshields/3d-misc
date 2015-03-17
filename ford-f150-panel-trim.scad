$fn=50;

difference() {
	union() {
		cube([108, 42, 2]); 
		translate([0,21,0])
			cylinder(h=2, r=20);
		translate([108,21,0])
			cylinder(h=2, r=20);
	}
	translate([54,21,-1])
		cylinder(h=4, r=14.5);
	translate([8,21,-1])
		cylinder(h=4, r=14.5);
	translate([100,21,-1])
		cylinder(h=4, r=14.5);
}