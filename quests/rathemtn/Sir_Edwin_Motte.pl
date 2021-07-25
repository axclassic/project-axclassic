####Sir_Edwin_Motte level changer###
### Angelox

sub EVENT_SPAWN{
  my $x;
  my $y;
  my $z;
  my $h;
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
    quest::set_proximity( $x-500,$x+500,$y-500,$y+500,$z-500,$z+500);
} 

sub EVENT_ENTER
{
	if($ulevel >= 50){
	 my $x = $npc->GetX();
    	 my $y = $npc->GetY();
    	 my $z = $npc->GetZ();
    	 my $h = $npc->GetHeading();
	  quest::spawn2(50644,0,0,$x,$y,$z,$h);
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
  	  quest::spawn2(50644,0,0,$x,$y,$z,$h);
	  quest::depop;
	}
}