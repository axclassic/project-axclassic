sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	}
sub EVENT_ENTER{
if($ulevel <= 45){
 my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
quest::spawn2(112131,0,0,$x,$y,$z,$h);
quest::shout("We shall meet again $name! When you are a worthy opponent!!");
quest::depop();
}
}
sub EVENT_AGGRO{
	if($ulevel <= 45){
	my $x = $npc->GetX();
	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();
  	quest::spawn2(112131,0,0,$x,$y,$z,$h);
	quest::shout("We shall meet again $name! When you are a worthy opponent!!");
	quest::depop();
	}
}
sub EVENT_DEATH {
quest::signalwith(112121,204,0);
}