# Spawns Frogtown in Rathe
sub EVENT_SPAWN{
  if (($Classic2012 < 1) | (!defined $Classic2012)){
    quest::spawn_condition("rathemtn",2,1);
  }
  elsif ($Classic2012 > 0 ){
    quest::spawn_condition("rathemtn",2,0);
  }
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Rathe Mountains hideaway!"); }
}
#END of FILE Zone:rathemtn  ID:50118 -- Innkeep_Serge 

