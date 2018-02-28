# Veeshan's Peak Xygoz 108053
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
   quest::settimer("LeashXygoz",5);
   my $annoyer = $client->GetID();
   quest::signalwith(108020,$annoyer,10);
}

sub EVENT_TIMER {
   if($timer eq "LeashXygoz") {
      my $distanceCHK = $npc->CalculateDistance($leashX, $leashY, $leashZ);
      if($distanceCHK >= 20) {
         $npc->GMMove($leashX, $leashY, $leashZ, $leashH);
         $npc->HateSummon(1);
      }
   }
}

sub EVENT_DEATH {
   quest::stoptimer("LeashXygoz");
}

sub EVENT_SAY {
   if($text=~/hail/i) {
      quest::say("Well, I must say it is refreshing to find a new being in my lair after so many years. I have lived a long and fruitful life, yet I yearn for the past and a time when some of us were still whelps, where we learned everything we knew from our masters. My mentor was of the first brood, an ancient dragon, older than any of the other dragons save Veeshan herself. She was and still is a very powerful dragon and I yearn to speak with her. Her name is Lendiniara the Keeper and was the best teacher any dragon could ever have. How would you like to connect me with her great mind? You could perhaps [deliver] a message for me, since I cannot travel these days.");
   }
   if($text=~/deliver/i && $faction == 1) {
      quest::say("This is indeed a fortunate day for me. Take this letter to Lendiniara for me. It is no ordinary letter. My message is scribed with a magic only she can see. She will be proud I have used a magic she taught to me to greet her again. Thank you for the assistance mortal.");
      quest::summonitem(69333);
   }
   if($text=~/deliver/i && $faction != 1) { # less than ally faction
      quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander.");
   }
}

sub EVENT_ITEM {
   if($faction == 1) {
      if($itemcount{69335} == 1) {
         quest::say("Is this trinket truly meant for me? Lendiniara was not one for giving gifts. Oh, how I miss her. I must thank you again. Once again I'm brimming with pride because of my mentor. Here is your reward. If it doesn't suit you, please give it back and I will find something that does. Farewell.");
         quest::summonitem(69385);
         quest::ding();
         quest::exp(1000);
      }
      if($itemcount{69385} == 1) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem(69386);
      }
      if($itemcount{69386} == 1) {
         quest::say("How utterly obtuse and arrogant. How about this one then?");
         quest::summonitem(69385);
      }
   }
   else { # less than ally faction
      quest::say("You still need to prove your loyalty to us. I do not feel we can trust you yet, outlander.");
   }
   plugin::return_items(\%itemcount);
}
# Quest by mystic414

