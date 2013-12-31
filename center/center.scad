translate([-20,-20,0]) cube([40,40,5]);

linear_extrude(height=10) polygon(points=[[ 20, 20],[ 20, 17],[ 17, 20]]);
linear_extrude(height=10) polygon(points=[[-20, 20],[-20, 17],[-17, 20]]);
linear_extrude(height=10) polygon(points=[[ 20,-20],[ 20,-17],[ 17,-20]]);
linear_extrude(height=10) polygon(points=[[-20,-20],[-20,-17],[-17,-20]]);
