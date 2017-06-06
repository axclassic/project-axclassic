##Event_Level_Spawn 213735##
sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
	}
sub EVENT_ENTER {
  quest::say("I see you $name spawning appropriate mobs");
  if(defined $qglobals{"Takaone"} == 1 ){
  quest::spawn_conditon(taka,1,1);
  }
  elsif(defined $qglobals{"Takatwo"} == 1 ){
  quest::spawn_conditon(taka,1,2);
  }
  elsif(defined $qglobals{"Takathree"} == 1 ){
  quest::spawn_conditon(taka,1,3);
  }
  elsif(defined $qglobals{"Takafour"} == 1 ){
  quest::spawn_conditon(taka,1,4);
  }
  elsif(defined $qglobals{"Takafive"} == 1 ){
  quest::spawn_conditon(taka,1,5);
  }
  elsif(defined $qglobals{"Takasix"} == 1 ){
  quest::spawn_conditon(taka,1,6);
  }
  elsif(defined $qglobals{"Takaseven"} == 1 ){
  quest::spawn_conditon(taka,1,7);
  }
  elsif(defined $qglobals{"Takaeight"} == 1 ){
  quest::spawn_conditon(taka,1,8);
  }
  elsif(defined $qglobals{"Takanine"} == 1 ){
  quest::spawn_conditon(taka,1,9);
  }
  elsif(defined $qglobals{"Takaten"} == 1 ){
  quest::spawn_conditon(taka,1,10);
  }
  else {
  #do Nothing;
  }
  }