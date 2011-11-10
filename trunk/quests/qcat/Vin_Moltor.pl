#############
#NPC: Vin_Moltor
#Quest Name: Paw of Opolla
#Quest by:
#Revised: Olhadon
#NPCs Involved: Gynok_Moltor, Rephas, 
#Items Involved: Severed Paw ID:17014, Bottle of Kalish ID:13016, Rat Ear Pie ID:13192, Copper Ring ID:13733, Silver Ring ID:13731, Gold Ring ID:13732, Platinum Ring ID:13734
#zone: qcat

sub EVENT_SAY {
    if($text=~/hail/i){
      quest::say("Heh??..<BURRP!>..Leave me be, will ya?!");
	}
	elsif($text=~/what paw/i) {
	  quest::say("Paw, ya say? Yeah.. I got this ratty old thing still. you want it? Its yours for a bottle of Kaluish and hmm... How bad you want it? Hmm.. two.. No, no.. three gold.. er .. NO! Wait. Pie.. Yes! Rat ear pie is what I want.. Three bottles of Kalish and a rat ear pie. If you want the paw, that is my price!");
	}
	elsif($text=~/what.*?rings/i){
	  quest::say("Rings? I don't know anything about no rings.. My [father] prob'ly sold them or lost them. They could be anywhere.");
	}
	elsif($text=~/wh(o|at|ere).*?father/i){
      #Antonica is mispelled on Live
	  quest::say("My father was a drunk and a loser just like me. He traveled all of Antoinca, though, He even went to Odus once or twice, I think. He died a long time ago.");
	}
}

sub EVENT_ITEM {
  #Bottle of Kalish ID:13016, Rat Ear Pie ID:13192
  if(plugin::check_handin(\%itemcount, 13016 => 3, 13192 => 1)){
    quest::say("Ah. Come to ol'Vin my dear sweet Kalish. Mmmm.. And Rat Ear Pie.. I am going to eat and drink like a KING! Huh? Oh.. The Paw.. Here you go.. Hope it brings you more luck than it did me.");
    #Severed Paw ID:17014
	quest::summonitem(17014);
	quest::ding(); quest::exp(200);
	quest::faction(217,10); #Merchants of Qeynos
	quest::faction(33,-10); #Circle of Unseen Hands
	quest::faction(9,10);	#Antonius Bayle
	quest::faction(47,10);	#Coalition of Tradefolk
	quest::faction(135,10); #Guards of Qeynos
  }
  else {
    quest::emote("I have no need for this $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:qcat  ID:45111 -- Vin_Moltor 

