sub EVENT_SAY { 
   if($text=~/Hail/i){
	quest::say("Good Day $name I can not talk while I am on watch.  ");
}
   elsif($text=~/nice hat/i){
	quest::say("Thank you, It is worn with pride and is the symbol of the Rivervale Militia");
	}
}

sub EVENT_ITEM {
	quest::say("I have no use for this, $name.");
	plugin::return_items(\%itemcount);
}
