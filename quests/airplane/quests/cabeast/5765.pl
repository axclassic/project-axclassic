sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hail."); }
}
sub EVENT_ITEM { 
	if ($item1=="18848"){quest::say("Thanks.");
quest::summonitem("13577");
quest::ding(); quest::exp("100"); }
}
#END of FILE Zone:cabeast  ID:5765 -- Prime_Patriarch_Vuzx 

