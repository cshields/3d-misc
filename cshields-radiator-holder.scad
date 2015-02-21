//Radiator Holder for cross-yagi
//Reinforced element holder with space for soldering coax
//SatNOGS project
//cshields edits, based on
//https://github.com/satnogs/satnogs-hardware/blob/master/Antennas/Yagi/Cross-Yagi-UHF-v1/src/satnogs-radiator-holder.scad

width = 38;
mast = 22;
element = 4.25;
extension = 9; // how far to extend the element supports

$fn=50;

module element_gutter() {
	union() {
		translate([mast/2+element/2,0,width/2+extension/2+1])
			cylinder(d=element,h=width+extension,center=true);
		translate([mast/2+element/2,0,-(width/2+extension/2+6)])
			cylinder(d=element,h=width+extension*2+1,center=true);
		rotate(90,[0,1,0])
			translate([4,0,mast/2])
			cube([6,10,mast],center=true);
		rotate(90,[0,1,0])
			translate ([-4,0,mast/2])
			cube([6,10,mast],center=true);
	}
}

module element_extension() {
	cylinder(d=element+4,h=width+extension*2,center=true);
}

module holder() {
	difference() {
		union() {
			minkowski() {
				cube([width-4,width-4,22], center=true);
				cylinder(r=2,h=1);
			}
			translate([mast/2+element/2,0,-3])
				rotate(90,[1,0,0])
					element_extension();
			rotate(90,[0,0,1])
				translate([mast/2+element/2,0,3])
					rotate(90,[1,0,0])
						element_extension();

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