sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("I am a Drill Master of the Legion of Cabilis.  I have no time for idle chitchat.  Be off if you were not summoned to this fortress!  Find that guild which was chosen for you as an egg."); }
}
sub EVENT_ITEM { 
	if ($item1=="18203"){quest::say("Thanks.");
quest::summonitem("5130");
quest::ding(); quest::exp("100"); }
}
#END of FILE Zone:cabeast  ID:1114 -- Drill_Master_Vygan 

