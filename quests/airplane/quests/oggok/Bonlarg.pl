sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Shadowknight master me be!!  $name prove to me that $name be worthy to be one with Greenblood and me give $name black shadow tunic.  You [want black shadow tunic]?");
}
if(($text=~/black shadow tunic/i) && ($faction>5)) {
quest::say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust."); 
  }
elsif(($text=~/black shadow tunic/i) && ($faction<=5)) {
  quest::say("Dem Lizards make me mad wit their Do-duh-Doo pipes. They sneak around, and when I go to get them, they blow in pipes and call for reinformers.  Bring me three Do-duh-Doo pipes from those Lizards, and I'll give you real Black Shadow Tunic!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12198 => 3, 13527 => 1)) {
    quest::say("Oh, tanks. I hate dem Do-duh-Doo lizards.");
    quest::emote("breaks the pipes with a splintering crunch between his two huge ogre hands.");
    quest::say("There, much better. Take this Black Shadow Tunic and go bother someone else.");
    quest::ding();
    quest::exp(350);
    quest::summonitem(12199); # Black Shadow Tunic
    quest::faction(128,51); #Greenblood Knights
    }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:oggok  ID:49033 -- Bonlarg 
