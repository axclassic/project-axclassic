##Zenurix 211124##
sub EVENT_SIGNAL{
if($signal == 225){
  quest::shout("Face me mortal! You have bested the seals, now your final test will begin! Your end will be sweet indeed!");
}
}
sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(211194,0,0,$x,$y,$z,$h); 
}