# Bloodhunt Event
# William (El Amansa-Guapos)
# Mistmoore Castle
# Keeps the NPC de-popped, unless event is active. Also respawns a stronger William for higher level players.
# By Angelox

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
}


sub EVENT_EXIT{
##Countess Event
 if ($event3 != 1){ 
    quest::depop;
  }
}

sub EVENT_ENTER{
##Countess Event
 if ($event3 != 1){ 
    quest::depop;
  }
}

sub EVENT_AGGRO
{
	if($ulevel >= 50){
	my $x = $npc->GetX();
    	my $y = $npc->GetY();
    	my $z = $npc->GetZ();
    	my $h = $npc->GetHeading();
  	quest::spawn2(59161,0,0,$x,$y,$z,$h);
	quest::depop;
	}
}
