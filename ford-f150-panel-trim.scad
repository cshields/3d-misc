$fn=50;

difference() {
	union() {
		cube([110, 42, 2]); 
		translate([0,21,0])
			cylinder(h=2, r=20);
		translate([110,21,0])
			cylinder(h=2, r=20);
		rotate ([0,0,180])
			translate ([-38,-7,2])
				tab(width=7);
		rotate ([0,0,180])
			translate ([-79,-7,2])
				tab(width=7);
		rotate ([0,0,0])
			translate ([71,35,2])
				tab(width=7);
		rotate ([0,0,0])
			translate ([30,35,2])
				tab(width=7);
		rotate ([0,0,90])
			translate ([17.5,12.5,2])
				tab(width=7);
		rotate ([0,0,-90])
			translate ([-24.5,124,2])
				tab(width=7);
	}
	translate([55,21,-1])
		cylinder(h=4, r=14.5);
	translate([8,21,-1])
		cylinder(h=4, r=14.5);
	translate([102,21,-1])
		cylinder(h=4, r=14.5);
}

module tab(width) {
	cube([width,2,12]);
	polyhedron(
		points=[ [width,2,10],[width,2,12],[width,4,10],[0,2,12],[0,2,10],[0,4,10] ],
		faces=[ [0,1,3,4], [3,5,4], [3,1,2,5], [0,2,1], [5,2,0,4] ] );
}