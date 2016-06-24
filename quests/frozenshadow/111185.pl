#Fabled Tserrina_Syl`Tor Spawn
#npc - #Fabled Tserrina_Syl`Tor (111185)
#zone - Frozenshadow
#Angelox

 sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
}

sub EVENT_ENTER
{
	quest::attack("$name");
}

sub EVENT_DEATH{
 quest::delglobal("Tserr");
 quest::setglobal("Tserr",2,3,"F");
 $Tserr=undef;
  };