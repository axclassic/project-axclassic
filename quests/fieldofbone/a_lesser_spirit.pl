# Shaman Epic 1.0
# A Lesser Spirit
# Ocean of Tears
# Aramid September 2006

sub EVENT_SAY {
 if($text=~/hail/i) {
  quest::settimer("depop",320);
  quest::say("Did you take this person's life, $class?");
  }
 if($text=~/yes/i) {
   quest::say("Why have you taken this person's life, $name? Did he threaten your life? Did you dislike him? Or was his death a profit to you in some way?");
  }
 if($text=~/threatened/i) {
   quest::say("I see. It brings me sadness to see another die, but his heart was black and a great nothingness. His body will become the grass now. Thank you for what you have done, shaman.");
  }
 if($text=~/are you/i) {
   quest::say("What, or who, I am isn't as important as what, or who, WE are. Do you wish to know more, shaman?");
  }
 if($text=~/know more/i) {
   quest::say("That is good, $name. Take this gem. It is a part of us like the clouds to the sky and is a wonderful gift from the grandfather. Take this gem to where the humans gather to spoil the land and water. Some call it a port. There you will find one of us, a shaman like yourself. Give him the gem and perhaps he will tell you more of the spirits.");
   quest::summonitem(1665);
  }
}

sub EVENT_TIMER {
   quest::depop();
   quest::stoptimer("depop");
}


# End of File - NPCID 69149 - A_Lesser_Spirit

