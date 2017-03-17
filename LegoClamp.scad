Lego_spacing = 8;
Lego_height = 1.7 + 0.1;
Lego_diameter = 5 + 0.2;

clamp_groove_width = 20;
clamp_groove_height = 3;
clamp_arm_width = 12;
clamp_pad_length = 35;
clamp_wall_spacing = 4;

n = round(clamp_pad_length/Lego_spacing);

difference(){
  intersection(){
    cylinder(d=clamp_pad_length,
             h=clamp_groove_height+2*clamp_wall_spacing,
             center=true,$fn=64);
    cube([clamp_groove_width+2*clamp_wall_spacing,
          clamp_pad_length+1,
          clamp_groove_height+2*clamp_wall_spacing],
            center=true);
  }
  translate([0,-clamp_wall_spacing,0]){
    intersection(){
      cylinder(d=clamp_pad_length,
               h=clamp_groove_height,
               center=true,$fn=64);
      cube([clamp_groove_width,
            clamp_pad_length+1,
            clamp_groove_height],
              center=true);
    }
    translate([0,-clamp_wall_spacing,
                clamp_groove_height/2+clamp_wall_spacing])
      cube([clamp_arm_width,
            clamp_pad_length-clamp_wall_spacing,
            clamp_groove_height+2*clamp_wall_spacing],
              center=true);
  }
  for(i=[-n:n])
    for(j=[-n:n])
      translate([i*Lego_spacing,j*Lego_spacing,
          -clamp_groove_height/2-clamp_wall_spacing-1])
        cylinder(d=Lego_diameter,h=Lego_height+1,$fn=64);
}

