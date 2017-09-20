#
# Yiln Darksly
#
# Yiln's Missing Tomes
#
sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::emote("looks up at you and tries to talk, but instead coughs up a large amount of water. He is soaking wet and covered in sand. 'Those damned trolls! They stole everything and destroyed my ship! The [House] will have my head over this!' Yiln coughs violently.");
   }
   if($text=~/house/i) {
      quest::say("I work for a trading house run by a group of nobles in Neriak. They are not known for being too forgiving when their [valuables] are lost");
   }
   if($text=~/valuables/i) {
      quest::say("We were hauling many things. The one thing in particular that I am worried about was a trunk full of tomes. I do not know what they were about exactly, but my masters explicitly told me not to let them leave my sight.' Yiln coughs. 'I have got to find those tomes!' Yiln tries to move but yells out in excruciating pain. I cannot get up. You must go to Paineel and find [Jerith]. Tell him I sent you and tell him about Osaftars. You will be rewarded well for your time. If you recover the books bring them back to me.");
   }
   if($text=~/Jerith/i) {
      quest::say("Jerith works for me. He sells many of the items that I acquire in my travels. He also is familiar with many of the pirates that sail the seas attacking merchant ships. He should hopefully know what to do.");
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 55001 =>1)) {
      quest::emote("Yiln Darksly looks a bit better now, having cleaned most of the sand from his body and drying off a bit. 'I hope you made those pirate scum pay with their lives! When I get back to Neriak, I assure you that my first priority will be planning my revenge. You're lucky, this item washed up on shore from the wreckage of my ship. You can have it. Farewell.");
      quest::summonitem(55025);
      quest::ding();
      quest::exp(10000);
      quest::faction(69,10); # +Dark Bargainers
      quest::faction(88,1);  # +Dreadguard Outer
      quest::faction(87,1);  # +Dreadguard Inner
   }
   plugin::return_items(\%itemcount);
}

