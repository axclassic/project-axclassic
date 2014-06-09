sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the mines of Kaladim!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  if (plugin::check_handin(\%itemcount, 18767 => 1)) { #Small, Folded Note
    quest::say("Very well then, take this and get to work.");
    quest::summonitem(13516); #Ruined Miner's Tunic
    quest::ding();
	quest::faction(220, 10); #miners guid 628
    quest::faction( 77, 10); 	#deeppockets
    quest::faction( 29, -30); 	#butcherblock bandits
    quest::faction( 33, -30);	#circle of unseen hands
	quest::exp(500);
	}
    else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:kaladimb  ID:67019 -- Mater 
