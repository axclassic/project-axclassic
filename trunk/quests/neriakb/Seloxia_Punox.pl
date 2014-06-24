sub EVENT_SAY { 
my $young = quest::saylink("young", 1);
my $test = quest::saylink("test", 1);
if ($text=~/Hail/i)
{quest::say("You may speak if you are a member of this house of warriors. Let it be of something important. Do not waste my time. Or wait. Perhaps you are a $young warrior. If you are I have a little $test for you."); }
}
if ($text=~/young/i){
quest::say("Go find Yegek B'Larin, heis beside the Arena area in the Neriak warrior's guild building.");
quest::say("Talk to him and ask him if there is anything you can do to help him.");
}
if ($text=~/test/i){quest::say("Well then, deliver this report to Ambassador K'rynn in the Ogre city of Oggok. Be careful $name, there are many things between here and Oggok that wont want thid report delivered.");
quest::summonitem(119865);
}
sub EVENT_ITEM { 
 if ($item1=="18751"){
	quest::say("Welcome to the Indigo Brotherhood. Hmmm. you're a bit scrawny. but we'll work with it. Here's your guild tunic. Defend Neriak and all her allies. For the time being this list includes our [new friends].Go see Yegek. one of our trainers. Hopefully he can mould you into something resembling a warrior.");
	quest::summonitem(13580);
	quest::faction(155, 10); #Indigo Brotherhood
	quest::ding(); quest::exp(1000);
 } 
 elsif (plugin::check_handin(\%itemcount, 18843 => 1)) { 
      quest::say("It's about time $name, I swear you new recruits get slower every year.");
     quest::say("You did at least complete the test and for that here is your reward.");
	 quest::ding();
	 quest::givecash(1,5,0,0);
	 quest::faction(155, 10); #Indigo Brotherhood
	quest::exp(1000);
  }
 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriakb  ID:41066 -- Seloxia_Punox 

