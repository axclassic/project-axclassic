# Shrieking Substances

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Ho there, who are you? Are you [reporting for duty] or just annoying me?");
   }
   if($text=~/reporting for duty/i) {
      quest::say("Outstanding, now tuck in that tunic. We are trying out some new Shadowscream armor from Barkhem, the smith in Shar Vahl, and some of his students. They will cut us a nice deal if we deliver some of the supplies, so go fill this up with shrieking substances for me. What are you staring at? Go!! And suck in that gut!");
      quest::summonitem(17497); # Sonic Receptacle
   }
   if($text=~/annoying/i) {
       quest::faction(350,-50);  # -Validus Custodus
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 29842 => 1)){ # Full Sonic Receptacle
      quest::say("Well done, $name, this should really help keep our costs down. Here, take these, and keep up the good work. Dismissed!");
      quest::summonitem(quest::ChooseRandom(10664, 10668, 10663, 10665)); # Combine Throwing Spear, Validus Custodus Flight Arrow, Combine Throwing Knife, Combine Shuriken
      quest::summonitem(quest::ChooseRandom(10664, 10668, 10663, 10665)); # Combine Throwing Spear, Validus Custodus Flight Arrow, Combine Throwing Knife, Combine Shuriken
      quest::faction(206,10);  # +Magus Conlegium
      quest::faction(168,10);  # +Katta Castellum Citizens
      quest::faction(350,10);  # +Validus Custodus
      quest::faction(284,-10); # -Seru
      quest::faction(139,-10); # -Hand of Seru
      quest::faction(96,-10);  # -Eye of Seru
      quest::faction(138,-10); # -Hand Legionnaries
      quest::faction(228,-5);  # -Nathyn Illuminnious
      quest::faction(55,-5);   # -Coterie of the Eternal Night
   }
}
#END of FILE Zone:katta  ID:160210 -- Corporal_Kent.pl

