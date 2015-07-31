sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 70, $x + 70, $y - 70, $y + 70);
	}
sub EVENT_ENTER{
if($ulevel <= 45){
 my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
quest::spawn2(32022,0,0,$x,$y,$z,$h);
quest::shout("We shall meet again $name! When you are a worthy opponent!!");
quest::depop();
}
}
sub EVENT_DEATH {
quest::signalwith(32106,638,0);
}