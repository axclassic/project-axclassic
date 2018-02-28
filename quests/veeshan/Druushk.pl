sub EVENT_SPAWN {
   quest::setnexthpevent(80);
}

sub EVENT_HP {
   if($hpevent == 80) {
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::setnexthpevent(60);
   }
   elsif($hpevent == 60) {
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::setnexthpevent(40);
   }
   elsif($hpevent == 40) {
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::setnexthpevent(20);
   }
   elsif($hpevent == 20) {
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
      quest::spawn2(108818, 0, 0, $x, $y, $z, $h);
   }
}

sub EVENT_AGGRO {
   my $annoyer = $client->GetID();
   quest::signalwith(108016,$annoyer,10);
}

sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::say("Who steps in my lair?! Ah, 'tis but a soft-flesh nuisance. I must say I am amazed at the idiocy you adventurers must boast to explore these areas, especially when we're trying to keep you out. Since you are here, I will tell you of a story and a [dilemma] I am having if you wish. You might become more enlightened.");
   }
   if($text=~/dilemma/i) {
      quest::say("In previous years, we, the Ring of Scale, have had one of our own sitting on the Overking Bathezid Di'Zok's council, well disguised. Our friend has also been spying on the council itself. He was our voice when we needed the Sarnaks to listen to reason. Unfortunately, we have lost contact with him. I had a personal affinity to our friend, because he was one of my personal assistants. I could sense his presence elsewhere on this continent and now it has dissipated. I fear he may have been killed, though I am not sure by whom. I would like you to investigate this further and bring back the remains of my assistant to me, so I can learn of his fate.");
   }
}

sub EVENT_ITEM {
   if($faction == 1) {
      if(plugin::check_handin(\%itemcount, 69339 => 1, 69338 => 1, 69337 => 1)) {
         quest::say("My worst fears are true. My assistant has been slain. I will have my servants investigate this heinous crime. Here is your reward for this deed mortal. If you do not like it, I can provide you with a different reward.");
         quest::summonitem ("69383");
      }
      if(plugin::check_handin(\%itemcount, 69383 => 1)) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem ("69384");
      }
      if(plugin::check_handin(\%itemcount, 69384 => 1)) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem ("69383");
      }
   }
   else { # less than ally faction
      quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander.");
   }
   plugin::return_items(\%itemcount); # return unused items
}
#End of File, Zone:veeshan  NPC:108012 -- Druushk

