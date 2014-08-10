# Shaman Epic 1.0
# A Lesser Spirit
# Ocean of Tears
# Aramid September 2006

sub EVENT_SPAWN {
   quest::settimer("depop",300);
}

sub EVENT_SAY { 
my $life = quest::saylink("life", 1);
my $threaten = quest::saylink("threaten", 1);
my $profit = quest::saylink("profit", 1);
my $who = quest::saylink("who", 1);
my $more = quest::saylink("more", 1);
  if($text=~/hail/i) {
   quest::say("Did you take this person's $life, shaman?");
   }
  if($text=~/life/i) {
   quest::say("Why have you taken this person's life, $name? Did he $threaten your life? Did you dislike him? Or was his death a $profit to you in some way?");
   }
  if($text=~/profit/i) {
   quest::attack($name);
  }
  if($text=~/threaten/i) {
   quest::say("I see. It brings me sadness to see another die, but his heart was black and a great nothingness. His body will become the grass now. Thank you for what you have done, shaman... What? Do you not know $who I am?");
  }
  if($text=~/who/i) {
   quest::say("What, or who, I am isn't as important as what, or who, WE are. Do you wish to know $more, shaman?");
  }
  if($text=~/more/i) {
   quest::say("That is good, $name. Take this gem. It is a part of us like the clouds to the sky and is a wonderful gift from the grandfather. Take this gem to where the humans gather to spoil the land and water. Some call it a port. There you will find one of us, a shaman like yourself. Give him the gem and perhaps he will tell you more of the spirits.");
   quest::summonitem(1665);
   quest::depop();
   quest::stoptimer("depop");
  }
 }

sub EVENT_TIMER {
   quest::depop();
   quest::stoptimer("depop");
}


# End of File - NPCID 69149 - A_Lesser_Spirit

