#Bregna , Neriaka, 40012
#Bregna's Big Mistake
#Need ending statement, mine sucks
#Need factions
#Changed to accommodate the Aid Garuuk/Hoop of the Traveler quest -Kilelen, 4/19/2007

sub EVENT_SAY {
my $Darkbone = quest::saylink("Darkbone", 1);
my $mistake = quest::saylink("mistake", 1);
my $Innoruuk = quest::saylink("Innoruuk", 1);
  if($text=~/hail/i) {
    quest::say("Me says hi to you. What you want from me? Oh!! Me shaman trainer. You must be shaman. Are you shaman $Darkone or are you here to help $Innoruuk?");
  }
  if($text=~/Darkone/i) {
    quest::say("You choose rite if you bes a shaman. We's da best. You remember ta not get in Kaglari way. She get mad berry easy. She gets berry mad at Bregna if she finds out me make big $mistake.");
  }
  if($text=~/mistake/i) {
    quest::say("Kaglari make me do the tasks for her. She tolds me to take crate of speshal poshuns to sumwun in Nektoolos forust. But I make mistake. I fall asleep under da trees becuz I was so tired. I wake up and poshuns are gone! Sumwun take the poshuns frum me. Dey leave dis note wit me. Me tinks dey play trick on me. Me tinks it be da stinkin' Halflings. Me needs ta gets dem back before Kaglari find out. I need sumwun to help me find da poshuns.");
    quest::summonitem(18651); #Note to the Troll
  }
  if($text=~/Innoruuk/i) {
    quest::say("Me hears orcs nearby are trubble. Da werd frum Neriak is dey wants us ta kills dem before dey organize.");
	quest::say("Dark elf say ta looks for Deathfist Clan. Say dey called cen-tu-ri-ons. Dey try ta gets big orc army.");
	quest::say("Shows me ya can strike fear and hate inta dem orcs.. dey needs be more scared a us den dem humies. Brings me a Deathfist slashed belt.");
}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13984 => 1)) { #Crate of potions
    quest::say("Phew! Me are safe from Kaglari's beating. Dank yoo, $name.  Take dis."); #Text made up, I have no reference.
    quest::summonitem(12212); #kaglari Mana Doll
	quest::faction(70,10); #Dark Ones
    quest::faction(292,10); #Shadowknights of Night Keep
    quest::faction(106,-30); #Frogloks of Guk
    quest::ding();
    quest::exp(5000);
  }
  elsif (plugin::check_handin(\%itemcount, 26662 => 1, 29921 => 1, 26640 => 1, 26632 => 1)) {#Swirling Banshee Essence, Arachnae Fangs, A Wrulon Claw, A Blood Raven Tailfeather
    quest::say("Me been waitin for doze. Dank yoo, $name.  Take dis.");
    quest::summonitem(28740);
	quest::faction(70,10); #Dark Ones
    quest::faction(292,10); #Shadowknights of Night Keep
    quest::faction(106,-30); #Frogloks of Guk
    quest::ding();
    quest::exp(1000);
  }
  elsif (plugin::check_handin(\%itemcount, 13916 => 1)) { #Deathfist Slashed Belt
  quest::say("'Good job. Dat help lerns um. Takes dis ta help ya lerns how ta do more hateful tings. Ya gots a good starts fer Him ta be prouds a ya.");
  quest::summonitem(15272); #Spell: Spirit Pouch
  quest::faction(70,10); #Dark Ones
  quest::faction(292,10); #Shadowknights of Night Keep
  quest::faction(106,-30); #Frogloks of Guk
  quest::ding();
  quest::exp(1000);
  }
  else {
    quest::say("Me not want dis.");
    plugin::return_items(\%itemcount);
  }
} 