sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::settimer(1,1);
	}
sub EVENT_ENTER{
if($ulevel <= 60){
 my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
quest::spawn2(159703,0,0,$x,$y,$z,$h);
quest::shout("We shall meet again $name! When you are a worthy opponent!!");
quest::depop();
}
}
sub EVENT_TIMER {
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 if($timer == 1 && ($x < -353 || $x > -109 || $y < -549 || $y > -310)) {
    quest::shout("No! I must not leave the time chamber! If I do, I'll age and die!");
    $npc->GMMove(-231.464005,-432.937469,202.375946,.125);
 }
}
sub EVENT_AGGRO{
	if($ulevel <= 60){
	my $x = $npc->GetX();
	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();
  	quest::spawn2(159703,0,0,$x,$y,$z,$h);
	quest::shout("We shall meet again $name! When you are a worthy opponent!!");
	quest::depop();
	}
}
sub EVENT_DEATH {
quest::signalwith(159704,159,0);
quest::stoptimer(1);
}
