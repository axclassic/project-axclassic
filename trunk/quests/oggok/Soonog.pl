sub EVENT_SAY { 
if(($text=~/Hail/i) && ($race eq "Ogre")) {
  quest::say("You Greenblood?"); 
  }
elsif ($text=~/Hail/i) {
  quest::say("You don't look like Greenblood. You not in Soonog army. You fight Soonog?  Big mistake!");
  quest::emote("prepares for battle.");
  }
elsif (($text=~/Greenblood/i) && ($race eq "Ogre")) {
  quest::say("Maybe you is Greenblood.  You have note? Give me note.");
  }
elsif (($text=~/Greenblood/i) && ($race eq "Ogre") && ($class eq "Shadowknight")) {
  quest::emote("looks you up and down impatiently");
  quest::say("You look like Greenblood to me. Give Soonog note to be sure.");
  quest::say("Soonog hungry. Soonog eat you unless you give me four lizard meat. Go now!");
  }
}
sub EVENT_ITEM { 
  if ((plugin::check_handin(\%itemcount, 18789 => 1)) && ($class eq "Shadowknight")) {
  quest::say("Maybe you is Greenblood. Here take this den. Soonog own you now.. fight for Soonog.. Soonog make you power.. Soonog army rule all!");
	quest::summonitem(13527); # Green Stained Skin Tunic*
  quest::faction(128,51); #Greenblood Knights
	quest::ding(); 
	quest::exp(1000);
	quest::say("Oh yeah, go see Bonlarg....NOW!");
	quest::rebind(49,-33,334,15);
  } 
  if ((plugin::check_handin(\%itemcount, 13410 => 4)) && ($race eq "Ogre") && ($class eq "Shadowknight")) {
  quest::emote("gobbles down four lizard cutlets as if in one bite.");
  quest::say("Soonog full. This is heavy. You take it.");
	quest::summonitem(5023); # Rusty Two Handed Sword
	
	quest::faction(46,10); # Clurg
  quest::faction(128,10); #Greenblood Knights
  quest::faction(292,-50); #Shadowknights of Night Keep
  quest::faction(314,-50); #Storm Guard	
	quest::ding(); 
	quest::exp(250);
	quest::say("Oh yeah, go see Bonlarg....NOW!");
  } 
 else {
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  quest::say("Me no need dis.. Take back!");
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:oggok  ID:49035 -- Soonog 

