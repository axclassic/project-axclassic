sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What!!? You [Craknek] or you [pest]?");
}
if($text=~/craknek/i){
quest::say("Good. Me not bash you.  You help Horgus and Crakneks.  Go smash lizards.  Bring four tails.  Greenbloods think they get all lizard tails.  We take first.  Taste good.  You bring four tails.  Me give you tings.  Me gives armur.  Now go!!");
}
if($text=~/pest/i){
quest::say("Bah!! You go join Greenbloods. You weak."); }
}

sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 13354 => 4)) && ($race eq "Ogre") && ($class eq "Warrior")) {
    quest::emote("smiles an almost toothless ogre smile.");
    quest::say("Heh. More for Crakneks. Less for Greenbloods. Keep 'em coming, just watch out for those dumb Greenbloods.");
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
#END of FILE Zone:oggok  ID:49042 -- Horgus 
