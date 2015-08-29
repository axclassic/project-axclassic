sub EVENT_SPAWN{ 
 $x = $npc->GetX(); 
 	$y = $npc->GetY(); 
 	quest::set_proximity($x - 55, $x + 55, $y - 55, $y + 55); 
  } 
sub EVENT_ENTER{ 
 if($ulevel <= 40){ 
 my $x = $npc->GetX(); 
 my $y = $npc->GetY(); 
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading(); 
 quest::spawn2(66182,0,0,$x,$y,$z,$h); 
 quest::shout("We shall meet again $name! When you are a worthy opponent!!"); 
 quest::depop(); 
 } 
 } 
sub EVENT_AGGRO{ 
 	if($ulevel <= 40){ 
 	my $x = $npc->GetX(); 
   	my $y = $npc->GetY(); 
   	my $z = $npc->GetZ(); 
   	my $h = $npc->GetHeading(); 
   	quest::spawn2(66183,0,0,$x,$y,$z,$h); 
 	quest::shout("We shall meet again $name! When you are a worthy opponent!!"); 
 	quest::depop(); 
 	} 
 } 
 sub EVENT_DEATH { 
 quest::signalwith(66184,661,0); 
 } 
