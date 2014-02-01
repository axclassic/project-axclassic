sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("FROOAAAK!");
    }
  if (($text=~/intestine necklace/i) && ($faction <5)) {
    quest::emote("winks at you with a lidless eye.");
    quest::say("I happened to have foraged one from the carrion of the swamp floor. Anything for an ally.");
    quest::summonitem(13311);
    }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 1892 => 1)) { # Empty Jar (Non-Container)
     quest::summonitem(13376); # Ochre Liquid
     quest::say("Ah, the plan is coming to fruition. Groak will be free soon with this foul acid.");
     quest::emote("hands you a jar of vile, swirling ochre liquid.");
     quest::say("Take this back to Groak. He'll need this, the sooner the better.  Be careful and discrete, and all will be revealed.");
     quest::faction(66,-50); #Da Bashers don't like this.   
      }
   else {
    quest::say("I like to collect stuff, but even I can't use this right now.");
    plugin::return_items(\%itemcount); 
     }
     
}