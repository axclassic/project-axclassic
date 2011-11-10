#############
#NPC: Blinza_Toepopal
#Quest Name: Jillin's Stew, Reebo's Carrots
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Deputy_Lowmot
#Items Involved: Carrot Stew ID:13959, Crate of Carrots ID:13958, Crate of Fine Carrots ID:13957, Crate of Rotten Carrots ID:13971, Crate of Rotten Carrots ID:13972
#zone: rivervale

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hello. $name.  Welcome to the Fool's Gold!  Cards are upstairs. drinks are down here.  Have fun!"); 
  }
  elsif($text=~/who.*?jillin/i) {
    quest::say("Jillin is my courier. He was supposed to take this pot of [stew] over to Deputy Lowmot in Guardian Stronghold. It is just about ready and Mayor Gubbin hates cold stew!"); 
  }
  elsif($text=~/take.*?stew/i) {
    quest::say("Here. Take it to Lowmot. The stew is already paid for but the good Deputy usually tips Jillin quite well. Hurry! It's getting cold!");
    #Carrot Stew ID:13959
	quest::summonitem(13959);
  }
}

sub EVENT_ITEM {
  #Crate of Carrots ID:13958
  if (plugin::check_handin(\%itemcount, 13958 => 1)) {
    quest::say("Well it is about time!  The mayor gets very upset if he does not have the freshest of carrots in his stew.  Here is the money for the carrots.  Be off with you.  Now. where the heck did [Jillin] go?");
	quest::givecash(5,0,0,0);
	quest::faction(77, 2);	 #DeepPockets
	quest::faction(33, 2);	 #Circle of Unseen Hands
	quest::faction(218, -4); #Merchants of Rivervale 
	quest::faction(48, 2);	 #Coalition of Tradefolk Underground
	quest::faction(31, 2);	 #Carson McCabe
	quest::ding(); quest::exp(100);
  }
  #Crate of Fine Carrots ID:13957
  elsif (plugin::check_handin(\%itemcount, 13957 => 1)){
	quest::say("Oh excellent! These carrots are perfect! The finest Reebo has ever sent us. The mayor will be so pleased. Here is the payment for the carrots. Excuse me, but I must finish preparing the stew. Hmm. Where the heck did [Jillin] go?");
	quest::givecash(10,0,0,0);
	quest::faction(77, 2);	 #DeepPockets
	quest::faction(33, 2);   #Circle of Unseen Hands
	quest::faction(218, -4); #Merchants of Rivervale 
	quest::faction(48, 2);   #Coalition of Tradefolk Underground
	quest::faction(31, 2);   #Carson McCabe
	quest::ding(); quest::exp(200);
  }
  #Crate of Rotten Carrots ID:13971
  elsif (plugin::check_handin(\%itemcount, 13971 => 1)){
	quest::say("What are these?! I am trying to make stew for the mayor and you bring me ROTTEN CARROTS?! Have you no sense?? Take these back to Reebo.");
	#Crate of Rotten Carrots ID:13972
	quest::summonitem(13972);
	quest::faction(77, -4);	 #DeepPockets
	quest::faction(33, 2);	 #Circle of Unseen Hands
	quest::faction(218, 2);  #Merchants of Rivervale 
	quest::faction(48, -4);	 #Coalition of Tradefolk Underground
	quest::faction(31, -4);	 #Carson McCabe	
  }
  else {
    plugin::return_items(\%itemcount);
    quest::say("I have no need for this $name, you can have it back.");
  }
}

#END of FILE Zone:rivervale  ID:19088 -- Blinza_Toepopal
