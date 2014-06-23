# mechanical pen portion of enchanter epic quest lead-in
# 

sub EVENT_SAY {
  if ($text=~/pen/i) {
    quest::say("Why do you want one of those contraptions. You will spend more time repairing it then you will writing with it. But if you insist on getting one, you are going to have to do a small favor.");
    quest::emote("tugs at your robe and grins evilly. 'Mighty nice outfit you have there. Sure beats these drab robes us three are wearing. Hmm...my favorite color is purple, in fact a shiny metallic purple would do nicely. How bad did you want that pen?'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1360 => 1)) {
    quest::say("Very nice!! It is perfect! Here take this pen. Have fun with it.");
     quest::ding(); quest::exp(50000);
    quest::summonitem(10600);
  }
  if (plugin::check_handin(\%itemcount, 18703 => 1)) { #Old Folded Letter
   quest::say("Welcome $name. I am Eonis Mornunder, enchanter guild master of the Dark Reflection. I train young gnomes that feel the calling of the Plaguelord, Bertoxxulous, and wish to serve the Dark Reflection.");
   quest::say("Take this robe and wear it proudly as a appretice in guild.");
   quest::say("Return to me  when you are in need of further instruction.");
   quest::summonitem(13524); #Dark Gold Felt Robe*
   quest::ding();
   quest::faction(71,10); #Dark Reflection
   quest::faction(76,-10); #Deep Muses
   quest::faction(91,-10); #Eldritch Collective
   quest::faction(115,-10); #Gem Choppers
   quest::exp(1000);
  }
  else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Enchanter');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }

# EOF Zone: akanon ID: 55121 NPC: Rilgor_Plegnog

