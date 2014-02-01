# Set globals event
# Zone: Gunthak

sub EVENT_SPAWN
{
#	$x = $npc->GetX();
#	$y = $npc->GetY();
#	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);

	quest::delglobal("Alina");
  	quest::setglobal("Alina",2,3,"F");
  	$Alina=undef;
}

#sub EVENT_ENTER
#{
#	quest::delglobal("sandy");
#	quest::setglobal("sandy",3,3,"F");
#	$sandy=undef;
#	quest::delglobal("$name");
#	quest::setglobal("$name",2,3,"F");
#}