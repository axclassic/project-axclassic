#############
#NPC: General_V`ghera ID:20205
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Stanos Herkanor, Ajuntant_D`kan, Advisor_C`zatl, Brigadier_G`tav, Coercer_Q`ioul, Ioltos_V`ghera, Tasi_V`ghera, War_Priestess_T`zan
#Items Involved: General's Pouch ID:28013, Head of Stanos ID:28058, Guise of the Coercer ID:2475
#zone: kithicor

sub EVENT_SAY {
  if($ulevel >= 50) {
    if($text=~/Stanos/i) {
      quest::say("Stanos? Stanos!! That dog, I WILL see him dead for what he cost me. outcast I am, stripped of my positionm my god has forsaken me, blaming ME for the loss of some tome. And you, $name, you have aided him. For that, you will die first. Please, struggle and beg, I do so enjoy watching my victims squirm, and I have little joy left in my life now. If you want my favor, perhaps if you came bearing Stanos' head I would be more forgiving. But I doubt it.");
    }
  }
}

sub EVENT_ITEM {
  if($ulevel >= 50) {
    #Head of Stanos ID:28058
    if(plugin::check_handin(\%itemcount, 28058 => 1)) {
      quest::say("Life is indeed sweet! Thank you, $name, you have done me a great service this day. Take this, Stanos was kind enough to return it to me, and I have no use for it now. Know that you have the blessing of Innoruuk for this deed! But of course, I leave it to you to leave here alive. A leader has to feed his minions, you know.");
	  #Guise of the Coercer ID:2475
	  quest::summonitem(2475);
	  quest::faction(98,10); #fallen of bloody kithicor
      quest::depop();
    }
  }
}

sub EVENT_SIGNAL {
  #Signal from Minions once the Sealed Box is turned in to add quest item to loot.
  if ($signal == 1) {
    #Remove item first, prevents multiple items from appearing
    $npc->RemoveItem(28013);
	#General's Pouch ID:28013
    quest::addloot(28013, 1);
  }
}

sub EVENT_DEATH {
  quest::shout("You think you have won, do you? INNORUUK, MY LORD AND MASTER, I INVOKE YOUR WRATH UPON THIS WRETCHED FOREST! Hahahahahahahahahahahahaha!");
}

#END of FILE Zone: kithicor  ID:20205 -- General_V`ghera

