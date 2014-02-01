# nadox
# a_Luggald_High_Priest.pl
# a_luggald_apprentice.pl
# respawn named mob on a #Garodizan_Razorfin (227113) death
# Enestox, Angelox
#
# The High Priest (227081) will spawn Innoruuk (186107) 30 seconds after
# all four luggald apprentices (227089) are dead if the ceremony doesn't end.
# The timer kills the ceremony at 10 minutes from the first kill.
# The 10 minute timer also is the repop time of the apprentices.
# JrFaust

sub EVENT_ATTACK {
 quest::signalwith(227081,1,0);
}
   
sub EVENT_DEATH{
 quest::signalwith(227081,2,30);
 my $random_result = int(rand(100));
 my $a = 227113;#Garodizan_Razorfin
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($razo==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("razo");
  quest::setglobal("razo",3,3,"F");
  $razo=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#Garodizan_Razorfin (227113)