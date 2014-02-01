#############
#NPC: Yendar_Starpyre
#Quest Name: Ragebringer, Rogue Epic Quest
#Quest by: Solid11
#Revised: Olhadon
#NPCs Involved: Eldreth, Renux Herkanor
#Items Involved: Scribbled Parchment ID:28053, Tattered Parchment ID: 28055, Book of souls ID:28016
#zone: steamfont

sub EVENT_SAY {
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 50) {
    if($text=~/hail/i) {
      quest::say("Hail, traveler! I sense you did not simply chance upon my isolation here, but are instead seeking me for something.");
    }
    if($text=~/eldreth sent me/i) {
      quest::say("Eldreth, Eldreth, hmm, was that a rather shabby Erudite? I have dealt with him in the past, I am sure. What does he want of me?");
    }
    if(($text=~/translate this document/i) || ($text=~/translate this parchment/i)){
      quest::say("Oh, if it is written in Eder Teir'Dal, most likely I can translate it. I will be happy to try, in any case. Let me see it, please.");
    }
    if($text=~/what key/i) {
      quest::say("In the Plane of Hate, where dwell Innoruuk and his minions, there is a tome. This tome is called the Book of Souls.");
    }
    if($text=~/book of souls/i) {
      quest::say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, $name?'");
    }
  }
}

sub EVENT_ITEM {
  # To make Rogue only, add in ($class eq "Rogue") to the if statement
  if($ulevel >= 50) {
    #Scribbled Parchment ID:28053
    if($itemcount{28053} == 1) {
      quest::say("I say, this is indeed a challenge. This is written in what I'm sure is the language of the High Priesthood of Innoruuk. I've often wished I could read this, but I have never had the key to unlock the language. Take this for now.");
      quest::ding(); quest::exp(50000);
      #Tattered Parchment ID: 28055
      quest::summonitem(28055);
    }
    #Tattered Parchment ID: 28055, Book of souls ID:28016
    elsif($itemcount{28055} == 1 && $itemcount{28016} == 1) {
      my $x = $npc->GetX();
      my $y = $npc->GetY();
      my $z = $npc->GetZ();
      my $h = $npc->GetHeading();
      quest::say("My, this is quite a large list! Yes, I can use the names and dates recorded here to help me understand the script. It should be a simple matter now. A moment, please. Aha, yes, there we go. Translated as best I can! I do hope you're not involved in what is described here, as it is quite fiendish. Oi! You, woman! Give that back! $name, that woman there took your letter! I think I should leave you to discuss it with her. Best of luck!.");
      #Renux Herkanor
      quest::spawn2(12032,0,0,$x - 10,$y + 10,$z,$h);
      quest::depop();
    }
    else {
      quest::emote("will not accept this item.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
      quest::emote("will not accept this item.");
      plugin::return_items(\%itemcount);
  }
}

#END of FILE  Quest by: Solid11  Zone:steamfont  ID:56012 -- Yendar_Starpyre

