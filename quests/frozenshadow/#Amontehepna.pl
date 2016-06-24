#npc - Spawns #Cara_Omica (111163)
#zone - FrozenShadow
#Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 if (($random_result < 11) && ($omica == 2)){
 quest::spawn2(111177,0,0,196.0,972.5,186.1,188);  #Spawn Fabled Omica
 quest::delglobal("omica");
 quest::setglobal("omica",3,3,"F");
 $omica=undef;}
 elsif (($random_result > 10) && ($omica == 2)){
 quest::spawn2(111163,0,0,196.0,972.5,186.1,188); #Spawn normal Omica
 quest::delglobal("omica");
 quest::setglobal("omica",3,3,"F");
 $omica=undef; }
}
