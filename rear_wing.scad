// Parameters
side_width_y = 120;         // Width of end plates in Y-direction (front-to-back, mm)
side_height_z = 220;       // Height of end plates in Z-direction (bottom-to-top, mm)
side_thickness_x = 2;      // Thickness of end plates in X-direction (left-to-right, mm)
spacing_x = 120;           // Distance between centers of end plates in X-direction (mm)
// Chord length of wing in Y-direction (front-to-back, mm)
wing_chord_y = sqrt(pow(side_width_y,2) + pow(side_height_z,2));  
wing_span_x = spacing_x;   // Span of wing in X-direction (left-to-right, mm)
wing_thickness_z = 2;      // Thickness of wing in Z-direction (mm)
wing_height_z = side_height_z / 2;  // Height where wing is mounted (mm from bottom)
wing_angle = atan(side_height_z / side_width_y);          // Angle of attack in degrees (negative for downforce)

// End plate left
translate([-spacing_x/2, 0, 0])
    cube([side_thickness_x, side_width_y, side_height_z]);

// End plate right
translate([spacing_x/2 - side_thickness_x, 0, 0])
    cube([side_thickness_x, side_width_y, side_height_z]);

// Wing (horizontal, spanning between end plates, with angle of attack)
translate([0, side_width_y/2, wing_height_z])
    rotate([wing_angle, 0, 0])
        cube([wing_span_x, wing_chord_y, wing_thickness_z], center=true);