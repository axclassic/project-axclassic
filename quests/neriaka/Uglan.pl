sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I got no time for games. Who sent you?  Braga?  Luga? Dem big ladies gonna be big problems soon.");
quest::emote("stares at you impatiently.");
quest::say("Well? Spit it out!");
  }
if($text=~/Lork/i){
quest::say("Ha!!  Good ol' Lork! He and his brother Nork always help Uglan carry tings back in the old days. Did you bring any Lork-stuff?");
quest::emote("chuckles...well, for an ogre, anyway.");
  }
if($text=~/orc runner/i){
    quest::say("Ug!  He's probably all the way in Dwarfy Mountains by now. You better get to him before he gets to the Orc Castle!");
  }
}

sub EVENT_ITEM {

  if (plugin::check_handin(\%itemcount, 13357 => 1)) { #Cracked Stein
   quest::say("Oh, this no good. I already sent the note. You better find the orc runner and give the note back to Lork. He'll know what to do.");
    }
   
   else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriaka  ID:40030 -- Uglan 

