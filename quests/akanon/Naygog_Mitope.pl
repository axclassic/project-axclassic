sub EVENT_SAY { 
my $serve = quest::saylink("serve", 1);
my $armor = quest::saylink("armor", 1);
if($text=~/Hail/i){
quest::say("Hail $name. I train those young gnomes who wish to $serve as a warrior in the service of the Dark Reflection and our patron. Bertoxxulous the Plaguelord. Decay and destruction are powerful forces that influence Norrath. It is the duty of the Warriors of the Dark Reflection to bring destruction to the weak and injury to the strong so that our fellow gnomes may be reminded of their own mortality and new strong individuals may rise to power before Bertoxxulous decides it is their time to decay and be replaced like countless before them.");
}
if($text=~/serve/i){
quest::say("Ours is the duty of a martyr. to be the hated and feared hand of destruction and catalyst of change. All roads are paved with destruction and in turn are eventually destroyed. All machines are built from the rubble of broken mountains and in turn become rust and bits of metal. You must outfit yourself with the tools of a warrior. crafted from the destruction of archaic clockworks that have long since finished serving the purpose for which they were built. Take this parchment to Windlebeck Tobokog. he will assist you in the construction of a suit of armor. When you have been properly outfitted return to me for further $instruction.");
quest::summonitem(10986);
}
if($text=~/instruction/i){
quest::say("It is one thing to destroy the artificial life of a clockwork. It is another thing entirely to claim the life of another gnome. There is a member of the Dark Reflection. Yulcabis. who has been assigned to a task in the Steamfont Mountains. He has failed repeatedly in the tasks assigned to him in the past and has become a burden to the Dark Reflection. Find Yulcabis and slay him. Return to me with the weapon he carries."); }
  if($text=~/armor/i) {
    quest::say("Armor? For a warrior? Oh yes. You'll need to speak with Windlebeck for that.");
  }
}

sub EVENT_ITEM {
 #do all other handins first with plugin, then let it do disciplines
  if(plugin::check_handin(\%itemcount, 10990 => 1)) { #Yulcabis's axe
    quest::say("Excellent work. Now that we no longer have to bother with Yulcabis, I suppose we can discuss your progression as a member of the Dark Reflection. You'll need some [armor], though.");
    quest::summonitem(11077); #plague warrior battle axe
     quest::ding(); quest::exp(100);
    quest::faction(115,-10); #gem choppers
    quest::faction(71,3); #dark reflection
    quest::faction(91,-10); #eldritch collective
    quest::faction(176,-10); #King ak'anon
    quest::faction(209,3); #meldrath
  }
  elsif(plugin::check_handin(\%itemcount, 119853 => 1)) { #Old Folded Letter
 quest::say("Welcome $name, I am the guildmaster of the warriors of Dark Reflection. Our lord and master, the Plaguebringer believes you are worthy of training. It is not my place to judge but you don't look like much to me.") ;
   quest::say("You can report to me for further guidance.");
   quest::say("Take this tunic, may it serve you better than its last owner.") ; 
   quest::summonitem(119862); #Small Patched Tunic*
   quest::ding();
   quest::faction(71,10); #Dark reflection
   quest::faction(76,-10); #Deep Muses
   quest::faction(91,-10); #Eldritch Collective
   quest::faction(115,-10); #Gem Choppers
   quest::exp(1000);
}
   else
    {
	#Do all other handins first With plugin, then let it Do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    quest::say("I have no use for these $name.");
    plugin::return_items(\%itemcount);
    }
 }
#END of FILE Zone:akanon  ID:55157 -- Naygog_Mitope 
