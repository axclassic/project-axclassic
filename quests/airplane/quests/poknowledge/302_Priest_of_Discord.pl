sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah, another who admits that the path to glory and power lies in discord? Have we not always preached the truth?  We are the only ones that can give you passage to the new world of purest Discord.  Should you like to go there, tell me you [wish to go to Discord] and I will grant you passage.  If you wish to [know more] about this travel, I will tell you.");
quest::say("if you are seeking teleportation power for you or your  mercenaries, seek out the Priests when you arrive in Discord");
}
if($text=~/wish to go to Discord/i){
quest::movepc(302,-1491,-1325,224.2); }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	quest::signal(202273,5); #Qadar
}

sub EVENT_ITEM { 
    quest::say("I can't use this, if you are seeking teleportation power for you or your  mercenaries, seek out the Priests when you arrive in Discord");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
   }
}
# zone: PoK
