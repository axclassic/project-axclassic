    ############################################
    # ZONE: Nektulos Forest (nektulos)
    # DATABASE: AX-Classic 3.10z
    # LAST EDIT DATE: August 6,2009
    # VERSION: 1.0
    # BASE QUEST BY: ASRAM
    # DEVELOPER: ASRAM
    #
    # *** NPC INFORMATION ***
    #
    # NAME: Lovar_N-Mare.pl
    # ID: 41105
    # TYPE: Wizard
    # RACE: Dark Elf
    # LEVEL: 61
    #
    # *** ITEMS GIVEN OR TAKEN ***
    #
    # Fuligan Soulstone of Innoruuk  - ID 10092
    # Cloudy Stone of Veeshan        - ID 10094
    #
    #
    # *** QUESTS INVOLVED IN ***
    #
    # Plane of Hate Teleport
    #
    # *** QUESTS AVAILABLE TO ***
    #
    # Everyone
    #
    # *** NPC NOTES ***
    #
    # This NPC is on Spurned faction and will aggro chumps.
    #
    ############################################

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings, traveler. The more this forest changes, the more I find it familiar and comforting. Such is the paradox of a traveler the likes of which you couldn't fathom.");
		quest::emote("looks you over with disdain.");
		quest::say("In any case, I have read all the requisite tomes in our towers, observed the world,and now I find myself most interested in [planar travel].");
  }
  if($text=~/planar travel/i){
    quest::emote("perks up as you mention the planes.");
    quest::say("It's most interesting how I have become obsessed with one plane in particular, that of our dark father, Innoruuk.  There are not words to describe the exhilarating emotions of rage, terror, and anxiety that overwhelm me while in his domain.");
    quest::say("I dare say lesser minds would crack alongside their shattered resolve. Still, you look somewhat resilient. If you would like to peer into the heart of exquisite loathing, bring me a [Fuligan Soulstone]. I'd then focus upon it with enough zeal to transport a single person to Innoruuk's realm.");
    quest::emote("sighs.");
    quest::say("Then again, I could send you to an [inferior plane], but it'd feel more like a banishment, I suppose.");
  }
  
 if($text=~/inferior plane/i){
    quest::say("Why would you want to go to the Plane of Sky when you can visit Innoruuk instead? Well,if you must go, then give me a Cloudy Stone of Veeshan to focus upon, and I can transport a single person.");
  } 
  if($text=~/Fuligan Soulstone/i){
  quest::say("See the merchant, Dvis Zexus, for such things. I know not how he alone procures them, but he seems to have an ample supply.");
  }
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 10092 => 1)) {  # Fuligan Soulstone of Innoruuk  - ID 10092
		quest::say("Enjoy the exquisite anger, $name, and give my regards to Innoruuk!");
		quest::selfcast(666);
 }
	if(plugin::check_handin(\%itemcount, 10094 => 1)) {  # Cloudy Stone of Veeshan        - ID 10094
		quest::say("Seriously? There? Bah. Off you go.");
		quest::selfcast(674);
 }
plugin::return_items(\%itemcount);
}