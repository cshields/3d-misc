// 1/2" PVC antenna mast to Camera Tripod clip-mount
// Based on Satnogs Project antenna to axis mount
// Satnogs Project 2014 MPL2.0 http://satnogs.org
// Corey Shields 2015 MPL2.0 https://www.mozilla.org/MPL/2.0/

$fn=50;

mast_1 = 34.1;		 // Axis mast diameter
mast_2 = 22;		 // Antenna mast diameter
offset = 8;			 // Extra width of mount
tireup_w = 6; 		 // Width of tireup
tireup_h = 1.5;	 // Height of tireup
washer = 16;		 // Washer diameter
bolt = 4.5;			 // Bolt for antenna mast

base_height = 9;  // base height for tripod mount

module axises() {
	translate([0,-(mast_1+mast_2)/2+mast_2/2,0])
		cylinder(h=mast_1+offset+1, d=mast_2, center=true);
	// Bolt for antenna mast cylinder
	translate([0,(mast_1+mast_2)/2-mast_1/2,0])
		rotate([90,0,0])
			cylinder(h=mast_1+offset+base_height+1, d=bolt, center=true);
}

module axises_outer() {
	translate([0,(mast_2+mast_2)/2-mast_1/2,0])
		rotate([0,90,0])
			cube(size=([30,5,30]), center=true);
	translate([0,-(mast_1+mast_2)/2+mast_2/2,0])
		cylinder(h=mast_1+offset, d=mast_2+offset, center=true);
}

module tire_up() {
	difference() {
		cylinder(h=tireup_w,d=mast_2+offset+tireup_h,center=true);
		cylinder(h=tireup_w,d=mast_2+offset-tireup_h,center=true);
	}
}

// the tripod base
module base() {
	translate([0,16,0])
		rotate([90,0,0])
			polyhedron(
			  points=[ [20.5,20.5,0],[20.5,-20.5,0],[-20.5,-20.5,0],[-20.5,20.5,0],
				[15,15,base_height],[15,-15,base_height],[-15,-15,base_height],[-15,15,base_height] ],
			  faces=[ [3,2,1,0],[1,2,6,5],[2,3,7,6],[3,0,4,7],[0,1,5,4],[4,5,6,7] ]
	);
}

module cut() {
	translate([0,-(mast_1+mast_2)/2,0])
		cube([offset*5,offset*1.5,mast_1+offset*4],center=true);
}

union() {
	difference() {
		union() {
			hull() {
				axises_outer();
			}
		base();
		};
		axises();
		cut();
	}
}
