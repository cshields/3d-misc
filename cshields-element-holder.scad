//Element Holder for cross-yagi
//SatNOGS project
//cshields edits, based on
//https://github.com/satnogs/satnogs-hardware/blob/master/Antennas/Yagi/Cross-Yagi-UHF-v1/src/satnogs-radiator-holder.scad

width = 38;
mast = 22;
element = 4.25;

module element_gutter() {
	union() {
		translate([mast/2+element/2,0,0])
			cylinder(d=element,h=width+1,center=true);
		translate([mast/2+element/2,0,0])
			cylinder(d=6,h=width/2,center=true);
		translate([mast/2,0,0])
			cube([element,element,width+1],center=true);
		translate([mast/2,0,0])
			cube([6,6,width/2],center=true);
		rotate(90,[0,1,0])
			translate([0,0,mast/2])
			cylinder(d=6,h=mast,center=true);
	}
}

module holder() {
	difference() {
		minkowski() {
			cube([34,34,17], center=true);
			cylinder(r=2,h=1);
		}
		cylinder(d=mast,h=width,center=true);
		translate([0,0,-3])
			rotate(90,[1,0,0])
				element_gutter();
		rotate(90,[0,0,1])
			translate([0,0,3])
				rotate(90,[1,0,0])
					element_gutter();
	}
}
	

holder();