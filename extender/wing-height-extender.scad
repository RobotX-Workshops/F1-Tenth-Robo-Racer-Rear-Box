// Outer dimensions
outer_height = 60;
outer_width = 127;

// Wall thickness
wall_thickness = 1.5;

extension_buffer_mm=10;

// Inner dimensions (calculated)
inner_height = outer_height - 2 * wall_thickness;
inner_width = outer_width - 2 * wall_thickness;

// Create the outer cuboid
module outer_cuboid() {
  cube([outer_width, outer_width, outer_height]);
}

// Create the inner (negative space) cuboid
module inner_cuboid() {
  cube([inner_width + extension_buffer_mm, inner_width, inner_height *10]);
}

// Create the hollow cuboid by subtracting the inner from the outer
difference() {
  outer_cuboid();
  translate([wall_thickness - extension_buffer_mm, wall_thickness, wall_thickness- extension_buffer_mm]) 
  inner_cuboid();
}