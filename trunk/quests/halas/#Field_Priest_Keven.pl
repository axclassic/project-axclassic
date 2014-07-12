
#File: halas/#Field_Priest_Keven.pl
#Quest: Guild master
#Note: Completed and tested on April 17, 2010 by mrhodes

sub EVENT_SAY {
   if ($text=~/Hail/i)
    {
       quest::emote("turns towards you.");
       quest::say("There you are. I have been waiting for you. Are you ready to begin your training? With my help you will be able to command a great beast to become your most trusted companion. Read the note in your inventory and hand it to me when you are ready to begin your training.");
    }
}

sub EVENT_ITEM {
   if($itemcount{18847} == 1){
       quest::say("Welcome $name! The blood of our brothers the wolves run strong through your veins. You must learn to control your spiritual link with our canine brothers. Wear this tunic so that others may recognize you as a Field Priest of the Tribunal, the claws and fangs of justice! Talk to my friend Hoyce and he can get you started.");
       quest::summonitem(13574);   # Soiled Gray Tunic
	   quest::ding();
       quest::faction(294, 10);   # Shamen of Justice
       quest::faction(213, 10);   # Merchants of Halas
       quest::faction(33, -30);   # Circle Of Unseen Hands
       quest::faction(48, -30); # Coalition of Tradefolk Underground
       quest::faction(90, -30); # Ebon Mask
       quest::exp(1000);
    }
else {
	plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
  quest::say("I have no need of this, take it back.");
  plugin::return_items(\%itemcount);
 }
 }
