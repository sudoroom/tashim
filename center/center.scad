translate([-40,-40,0]) cube([80,80,19]);

linear_extrude(height=26) polygon(points=[[ 40, 40],[ 40, 17],[ 17, 40]]);
linear_extrude(height=26) polygon(points=[[-40, 40],[-40, 17],[-17, 40]]);
linear_extrude(height=26) polygon(points=[[ 40,-40],[ 40,-17],[ 17,-40]]);
linear_extrude(height=26) polygon(points=[[-40,-40],[-40,-17],[-17,-40]]);
