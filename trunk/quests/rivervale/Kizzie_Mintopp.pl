#############
#NPC: Kizzie_Mintopp
#Quest Name: Honey Jum
#Quest by: Shaznito
#Revised: Olhadon
#NPCs Involved: Lil Honeybugger
#Items Involved: Honeycomb ID:13953, 30 gold, Honey Jum ID:13952
#zone: rivervale

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Enough talk there. chatterbox.  You buy lots of herbs.  I gotta make a living. not more friends.");
  }
  elsif($text=~/what is honey jum recipe/i){
    quest::say("It's a secret!!  I get the honeycombs and combine them with the secret sauce and..presto.. honey jum!!  It is used by only the wisest as a component.  And you can only get it from Kizzie.  It is also good on batwing crunchies.  If you like.. Kizzie can [make honey jum] for you?");
  }
  elsif($text=~/make honey jum for me/i){
    quest::say("No, no, no!!  You will not get honey jum until you give Kizzie three honeycombs and thirty gold coins.  Honey jum is valuable.  Kizzie raised the fee!!  That is how it works.");
  }
}

sub EVENT_ITEM {
	#Honeycomb ID:13953
	if ($itemcount{0} == 1 && $itemcount{13953} == 3 && $gold == 30) {
		quest::say ("You are one lucky bixie buster. I just made a batch of honey jum. Here. No waiting for you.  One jar for your good work. Bye, now!");
		#Honey Jum ID:13952
		quest::summonitem(13952);
		quest::faction(218,5);
		quest::faction(77,5);
		quest::faction(133,5);
		quest::faction(208,5);
		quest::faction(48,-5);
		quest::ding(); quest::exp(50);
	}
	elsif ($itemcount{13953} > 0 || $copper != 0 || $silver != 0 || $gold != 0 || $platinum != 0) {
		#Only gives cash if it was detected on hand-in.
		if($copper != 0 || $silver != 0 || $gold != 0 || $platinum != 0){
			quest::givecash($copper, $silver, $gold, $platinum);
		}
		quest::say("This is not all!! Kizzie says, three honeycombs and thirty gold coins!!  Oooh!!  They never listen.");
		plugin::return_items(\%itemcount);
	}
	else {
		plugin::return_items(\%itemcount);
		quest::say("I have no need for this $name, you can have it back.");
	}
}

#END of FILE Zone:rivervale  ID:19066 -- Kizzie_Mintopp

