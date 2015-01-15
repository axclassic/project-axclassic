sub EVENT_SPAWN  {
  quest::settimer(281,1800);
  
}
sub EVENT_SIGNAL {
    if ($signal == 280) {
	 my $a = quest::ChooseRandom(280089,280084,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089,280089);
    quest::spawn2($a,0,0,1642.9,-495.3,443.1,192.1);
	}
   }
 
	sub EVENT_TIMER {
	quest::stoptimer(281);
	quest::depop(280089);
	quest::depop(280084);
	quest::depop(280083);
	quest::depop(280089);
	quest::depop(280085);
	quest::depop(280087);
	quest::depop();
   }