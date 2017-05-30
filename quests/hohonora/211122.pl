#Lord_Draekon 211122##
sub EVENT_SPAWN {
quest::settimer("Lordpop",1800);
}
sub EVENT_TIMER {
   if($timer eq "Lordpop"){
   quest::stoptimer("Lordpop");
   quest::ze(14, "You have failed the lord Draekon Event.");
  quest::depop();
  }
 } 
sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(211194,0,0,$x,$y,$z,$h); 
}