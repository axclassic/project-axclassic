#############
#NPC: Reebo_Leafsway
#Quest Name: Jillin's Stew, Reebo's Carrots, Rogue Epic 1.5 (Fatestealer)
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Blinza_Toepopal
#Items Involved: Crate of Carrots ID:13958, Crate of Fine Carrots ID:13957, Crate of Rotten Carrots ID:13971, Crate of Rotten Carrots ID:13972, Anti-Poison Amulet ID:10308, Arrow of Contagion ID:8303, Arrow of Frost ID:8304, Earring of Disease Reflection ID:10302, Earring of Fire Reflection ID:10303, Earring of Frost Reflection ID:10304, Earring of Magic Reflection ID:10305, Earring of Poison Reflection ID:10306, Eye of Disvan ID:10309, Pierce's Pouch of Storing ID:17302, Rod of Identification ID:12001,  Runners Ring ID:10301, Travelers Pack ID:17301, Travelers Pouch ID:17300, Wand of Frost Bolts ID:12002, Shakey's Dilapidated Noggin ID:52355
#zone: rivervale

sub EVENT_SPAWN {
  #Generating random number for timer.
  my $lower = 780; # ~13minutes
  my $upper = 960; # ~16minutes
  my $randnum = int($lower+rand($upper-$lower));
  quest::settimer(1,$randnum); 
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings and salutations, $name! My name is Reebo Leafsway, loyal Druid of [Karana]. I am in charge of helping young druids who wish to get started down the [trail to Karana's wisdom]. I also do my share of tending the [crops].");
  }
  elsif($text=~/who.*?shakey/i) {
    quest::say("Shakey is our protector and friend. He is just getting old. Losing his [stuffing]. His [head] is getting very cracked and dry as well.");
  }
  elsif($text=~/what stuffing/i) {
    quest::say("The hay he requires is difficult to obtain. It must have been harvested from the Plains of Karana, then cursed by a high priest of the Faceless, [Cazic-Thule]. Finally, you must cast the hay and a flask of blessed Oil of Life into an armorer's forge. Only then will the hay be ready. We Stormreapers will reward you greatly if you could accomplish this task. Remember, you must give the scarecrow stuffing to Shakey only after it has been properly prepared.");
  }
  elsif($text=~/wh(o|at).*?cazic/i){
    quest::say("Cazic-Thule is the dark diety of fear. He is worshipped by many evil beings. There is believed to be a ruined temple dedicated to him deep in the [Feerrott]. That would be a good place to look for one of his high priests.");
  }
  elsif($text=~/wh(o|at).*?ferrott/i){
    quest::say("The Feerrott is a vast rain forest in southwestern Antonica. It is home to mane lizardman tribes.");
  }
  elsif($text=~/wh(o|at).*?karana/i){
    quest::say("Karana is known as the Rainkeeper. It is through His will that our [crops] and our children grow big and healthy. He watches over us and protects us, calling down the fury of a tempest on those who wish harm upon His followers.");
  }
  elsif($text=~/what crops/i) {
    quest::say("The crops we grow here are mostly carrots, lettuce and squash. We also are the only place on all of Norrath where the soil can support the mystical Jumjum Stalk.");
  }
  elsif($text=~/what head/i) {
    quest::say("The head of a scarecrow is difficult to replace. We do not know what is needed and all of our attempts have failed. Perhaps you could [research] this for us and bring back a new head for our old friend Shakey?");
  }
  elsif($text=~/what research/i) {
    quest::say("We have heard of a great forbidden tome penned by an evil necromancer that holds the secrets of instilling life into scarecrows. We have recovered pages from that book. That is how we know about Shakey's hay. But the pages detailing the creation of a scarecrow's head are missing. We believe that the Erudites possess at least some of the pages and might know where the rest of them may be found. Start your search in their city of Erudin.");
  }
  elsif($text=~/wh(o|at).*?nillipuss/i) {
    quest::say("Nillipuss is a brownie that lives in the area who often steals and destroys our JumJum Stalk. We certainly would not ming if someone taught him a painful [lesson].");
  }
  elsif($text=~/what lesson/i){
    quest::say("He needs to be taught not to steal our jumjum! If you find some jumjum on him, I would appreciate it if you would return it to me.");
  }
  elsif($text=~/trail to Karana's wisdom/i) {
    quest::say("Good. First you should learn that Karana's work is just that.. work. Karana provides us with the tools but it is by the sweat of our brows that we prosper. Common sense and hard work are two things that are highly prized by our people. Time for you to sweat, young one. Take this crate of carrots over to Blinza Toepopal in the Fool's Gold. They need our finest carrots for Mayor Gubbin's stew. When you return I will teach you a lesson of the Rainkeeper.");
	#Crate of Rotten Carrots ID:13971
    quest::summonitem(13971); 
  }
  #Shakey's Dilapidated Noggin ID:52355
  elsif (($text=~/hail/i) && (plugin::check_hasitem($client, 52355))) {
    quest::say("You took care of our problem, $name, and for that you have my eternal thanks. With the new head you supplied, we should be able to squeeze a few more years out of Shakey. Not sure what you'd want to do with the old one. That dilapidated pumpkin is worthless. Moldy, dried out . . . doesnt hold a light. He shrugs empahtically. Go ahead and hold onto the thing if that tickles your fancy, though. May Karana watch over you in your travels!");
  }
}

sub EVENT_ITEM {
  #Crate of Rotten Carrots ID:13971
  if($itemcount{13971} == 1) {
    quest::say("Very good. Very good indeed. Karana does not need the blind obedience that so many deities require. Trust your instincts, they are more often right than not. Here, take this to Blinza. Hurry, she is expecting them. You may keep the donation she gives you in return.");
	#Crate of Carrots ID:13957
    quest::summonitem(13957);
  }
  #Crate of Rotten Carrots ID:13972
  elsif($itemcount{13972} == 1) {
    quest::say("These carrots are rotten. They were rotten when I gave them to you. Why would you waste time and energy on such a fool's errand? Because I asked you to? Many, even those you trust will ask you to do things which you should not. Use the common sense that Karana has blessed you with to know which tasks can benefit our people and which could harm them. Learn this lesson well. You will need it if you plan to adventure beyond the vale. Now take these fresh carrots to Blinza and apologize for your error. You may keep the donation she gives you as payment.");
	#Crate of Fine Carrots ID:13958
    quest::summonitem(13958);
  }
 
  #JumJum Stalk ID:13974
  elsif($itemcount{13974} == 4) {
    quest::say("Excellent!! You must have taught ol' Nillipuss a great deal! But he never seems to learn.. Oh well. The Stormreapers and all of Rivervale owe you a debt of gratitude. Please accept this token of our appreciation.");
    #Anti-Poison Amulet ID:10308, Arrow of Contagion ID:8303, Arrow of Frost ID:8304, Earring of Disease Reflection ID:10302, Earring of Fire Reflection ID:10303, Earring of Frost Reflection ID:10304, Earring of Magic Reflection ID:10305, Earring of Poison Reflection ID:10306, Eye of Disvan ID:10309, Pierce's Pouch of Storing ID:17302, Rod of Identification ID:12001,  Runners Ring ID:10301, Travelers Pack ID:17301, Travelers Pouch ID:17300, Wand of Frost Bolts ID:12002
    quest::summonitem(quest::ChooseRandom(10308,8303,8304,10302,10303,10304,10305,10306,10309,17302,12001,10301,17301,17300,12002));
    quest::ding(); quest::exp(27440);
	quest::givecash(0,15,0,0);
  }
  #JumJum Stalk ID:13974
  elsif($itemcount{13974} > 0) {
    quest::say("Oh good! I see you have taugh that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?");
    plugin::return_items(\%itemcount);
  }
  else {
    plugin::try_tome_handins(\%itemcount, $class, 'Druid');
    plugin::return_items(\%itemcount); # return unused items
	quest::say("I have no need for this $name, you can have it back.");
  }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Old [Shakey] hasn't been feeling like himself lately, I'm afraid.");
 }
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::emote("whistles a hafling tune.");
    quest::stoptimer(1);
    #Generating random number for timer.
    my $lower = 780; # ~13minutes
    my $upper = 960; # ~16minutes
    my $randnum = int($lower+rand($upper-$lower));
    quest::settimer(1,$randnum);
  }
}
#END of FILE Zone:rivervale  ID:19052 -- Reebo_Leafsway

