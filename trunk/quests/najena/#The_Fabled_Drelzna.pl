####Fabled Depoper###
### Romell 6-9-09

sub EVENT_SPAWN{
  my $x;
  my $y;
  my $z;
  my $h;
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $h = $npc->GetHeading();
    quest::set_proximity( $x-100,$x+100,$y-100,$y+100,$z-100,$z+100);
} 

sub EVENT_ENTER
{
	if($ulevel <= 49){
	 my $x = $npc->GetX();
    	 my $y = $npc->GetY();
    	 my $z = $npc->GetZ();
    	 my $h = $npc->GetHeading();
	  quest::spawn2(44094,0,0,$x,$y,$z,$h);
	  quest::depop;	
	}
}

sub EVENT_AGGRO
{
	if($ulevel <= 49){
	 my $x = $npc->GetX();
    	 my $y = $npc->GetY();
    	 my $z = $npc->GetZ();
    	 my $h = $npc->GetHeading();
  	  quest::spawn2(44094,0,0,$x,$y,$z,$h);
	  #quest::shout("We shall meet again $name! When you are a worthy opponent!!");
	  quest::depop;
	}
}