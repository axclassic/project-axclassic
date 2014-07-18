sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail!  I am the jail clerk of Highkeep.  How may I be of service?"); 
}
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 18935 => 1)) {
quest::say("That little halfling has escaped our prison. No doubt he will travel back to the safety of Rivervale. He left this cracked emerald. It appears he must have broken off a piece of it. I believe it belongs to Kaladim. You may take it, but I am sure your master will not be satisfied until you combine the final piece with this one. Of course, first you will have to find Bronin and ask him of the missing emerald shard.");
quest::summonitem(17927);
quest::ding();
quest::exp(5000);
}
}
#END of FILE Zone:highkeep  ID:6058 -- Jail_Clerk_Maryl 

