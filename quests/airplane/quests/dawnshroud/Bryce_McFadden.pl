sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("What are you doing here? Can't you see we're trying to get some rest. It's not easy trying to find [Gant's Remains].'");
	}

	if($text=~/what gant/i){
		quest::say("We're looking for Gant's Remains. We've heard that they can be found somewhere in the caves not to far from here. Though. it's not easy getting into those caves. Those dawnhoppers are a vicious bunch. Maybe you'd like to help us. If you can find Gant's Remains bring it back to me and you'll get a handsome reward.'");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 30173 => 1)) { #Gant's Remains
		quest::say("No way! You're telling me you were able to recover Gant's Remains?! Gant will finally be able to rest in peace now. Here take this.");
		quest::summonitem(29897); #Tribal Warblade
		quest::ding();
		quest::exp(12500);
	} else {
		quest::say("I have no need for this, $name.");
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:dawnshroud  ID:174090 -- Bryce_McFadden 

