# respawn named mob on a #Garodizan_Razorfin (227113) death
# Enestox, Angelox
#
# The High Priest (227081) will spawn Innoruuk (186107) 30 seconds after
# all four luggald apprentices (227089) are dead if the ceremony doesn't end.
# The timer kills the ceremony at 10 minutes from the first kill.
# The 10 minute timer also is the repop time of the apprentices.
# JrFaust

my $counter;

sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {
  $counter += 1;
  if ($signal == 1){
    if ($counter == 1){
      quest::say("And the ceremony begins.");
    }
  }
  if ($signal == 2){
    quest::settimer("ceremony",600);
    if ($counter == 8){
      quest::say("Innoruuk protect us!");
      quest::settimer("inny",30);
      quest::stoptimer("ceremony");
      $counter = 0;
    }
   }
}

sub EVENT_TIMER{
  if ($timername == "ceremony"){
    quest::stoptimer("ceremony");
    $counter = 0;
  }
  if ($timername == "inny"){
    quest::stoptimer("inny");
    quest::unique_spawn(227131,0,0,1714.00,669.00,-87.00);
  }
}
   
sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227113;#Garodizan_Razorfin
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($razo==2)){
  quest::spawn2($a,1,0,$x,$y,$z,$h);
  quest::delglobal("razo");
  quest::setglobal("razo",3,3,"F");
  $razo=undef;
  }else{
  #do nothing 
 }
 quest::stoptimer("ceremony");
}

# EOF zone: nadox NPCs:#Garodizan_Razorfin (227113)
