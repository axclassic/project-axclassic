sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the mines of Kaladim!"); }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 18767 => 1)) { #Small, Folded Note
    quest::say("Very well then, take this and get to work.");
    quest::summonitem(13516); #Ruined Miner's Tunic
    quest::ding();
	quest::faction(220, 10); #miners guid 628
    quest::faction( 77, 10); 	#deeppockets
    quest::faction( 29, -30); 	#butcherblock bandits
    quest::faction( 33, -30);	#circle of unseen hands
	quest::exp(1000);
	quest::rebind(67,201,559,-33);
	}
        else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:kaladimb  ID:67019 -- Mater 
