#Silverwing NPCID: 108050
my $leashX = 0;
my $leashY = 0;
my $leashZ = 0;
my $leashH = 0;

sub EVENT_SPAWN {
   $leashX = $x;
   $leashY = $y;
   $leashZ = $z;
   $leashH = $h;
}

sub EVENT_AGGRO {
   quest::settimer("LeashSilverwing",5);
}

sub EVENT_TIMER {
   if($timer eq "LeashSilverwing") {
      my $distanceCHK = $npc->CalculateDistance($leashX, $leashY, $leashZ);
      if($distanceCHK >= 20) {
         $npc->GMMove($leashX, $leashY, $leashZ, $leashH);
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("LeashSilverwing");
}

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("So, young one, you have come to seek an audience with me. What do you want? Hurry up and speak carefully. I'm not known for my patience or trust of your kind. Perhaps you can [" . quest::saylink("I will assist you",0,"assist") . "] me by collecting a few items, then I may learn to be more trusting.");
   }
   if($text=~/I will assist you/i && $faction == 1) {
      quest::say("Very well. One of my scouts has been attempting to acquire the locations of powerful, yet inscribable words for me, but has not returned as soon as I'd like. I've grown impatient -- as you might guess. These words contain great magic, I'm sure of it, and when incanted correctly, create a fabled spell of extraordinary power. I had obtained some, but more are missing. Here is my lexicon and a list of found words so far. Go quickly and acquire all eight of the words I need and the spell scroll.");
      quest::summonitem(69347);
      quest::summonitem(69323);
   }
   if($text=~/I will assist you/i && $faction != 1) { # less than ally faction
      quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander.");
   }
}

sub EVENT_ITEM {
   if($faction == 1) {
      if(plugin::check_handin(\%itemcount, 69324 => 1)) {
         quest::say("I'm somewhat impressed, stranger. You cannot imagine the power this spell may unleash. Take this reward and leave me. If the reward I have given you is not pleasing, hand it back and I will give you a different one. Make haste and leave me be, for I will need to recite this spell in private.");
         quest::summonitem(69381);
         quest::exp(10000);
      }
      if (plugin::check_handin(\%itemcount, 69381 => 1)) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem(69382);
      }
      elsif(plugin::check_handin(\%itemcount, 69382 => 1)) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem(69381);
      }
   }
   else { # less than ally faction
      quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander.");
   }
   plugin::return_items(\%itemcount);
}
