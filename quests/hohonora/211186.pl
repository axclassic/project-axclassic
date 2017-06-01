##Armor_of_the_Gods 211186 may spawn adds##
sub EVENT_DEATH {
  my $randomroll = int(rand(100));  #Random roll
  if ($randomroll < '50') {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
	quest::spawn2(211191,0,0,$x,$y,$z,$h);
    quest::spawn2(211191,0,0,$x,$y,$z,$h);
   }
   elsif ($addrandomroll > '51'){
       #do nothing;
   }
    else {
   #do Nothing;
   }
 }