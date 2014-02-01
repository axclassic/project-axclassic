sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You be tinking you be [real tuff Craknek]?");
}
if($text=~/real tuff craknek/i){
quest::say("Me not tinking so. but maybe me wrongs.. no.. me neber wrongs.  You no tuff. only liddle Craknek is you.  You tink you be tuff Craknek. you bring me four lizard meats.  Me like lizard meats.  You no tuff.  You bringed me lizard meats.  I make you tuffer Craknek.  Me bestest Craknek."); }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 13410 => 4)) && ($race eq "Ogre") && ($class eq "Warrior")) {
    quest::emote("waves his meaty hands.");
    quest::say("Heh. See, now you tuffer Craknek.  Haha! Me bestest Craknek.  Here, take this and stay away from those Greenbloods.");
    quest::summonitem(quest::ChooseRandom(2128,2130,2132,2135,2136,2169,2164,2165));
  	quest::faction(46,10); # Clurg
    quest::faction(57,10); # Craknek Warriors
    quest::faction(128,-30); # Greenblood Knights
    quest::ding();
    quest::exp(500);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49041 -- Kogna 
