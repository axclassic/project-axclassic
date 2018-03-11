# Whistling Fists
sub EVENT_SPAWN {
   $npc->SetAppearance(3);
}

sub EVENT_SAY {
   if($text=~/hail/i) {
      $npc->SetAppearance(0);
      quest::emote("places a foul smelling book in your hands and speaks to you slowly. 'Take this rotting book given to me by lord Cazic-Thule himself, I was given another but it has been lost. The search for the fists will be the end of me. If you are a monk of the final rung show me your Shackle of Tynnonium and I will share with you what I have found.'");
      quest::summonitem(18898); # Flayed Skin Tome
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 4199 => 1)) { # Shackle of Tynnonium
      quest::say("The search for the fists has killed many so I hope that your strength is more than mine and those in the past. I was given this satchel by the lord Cazic-Thule. I have searched for the fists in this place but they are not here. I suggest you seek audience with our lord. Tell him that I have failed in my task. I am sure that he ugnnnnnhnnn.' One last look to you is given before falling completely lifeless to the cold stone.");
      quest::summonitem(4199); # Shackle of Tynnonium
      quest::summonitem(17364); # Satchel of Flayed Skin
      npc->kill();
   }
   plugin::return_items(\%itemcount);
}
