sub EVENT_SAY {
   if ($ulevel <= 40 && $ulevel >= 31 && $text=~/Hail/i){
   quest::say("Should we all perform to Chieftain Aderi's expectations, the races of good and light will bring an end to the threat of evil upon Norrath.");
   quest::say("Relae must have told you that Gimblax plans to extract vengeance upon you for killing the goblins in the temple. We have learned roughly where this foul goblin is and highly recommend you find your way to him before he finds you.");
   quest::say("Gimblax was said to be holding up in Tirranun's Delve, that would be a good place to start your search, return to Chieftain Relae Aderi with the Uncut Goshenite as proof of your victory.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("A necromancer by the name of Zebeker came through camp a while ago, said he had lost his pet. Not so sure about him he had an ill favored look about him.");
   quest::say("Perhaps he didnt loose his pet as much as the pet ran away. Either way I told him I would send someonr to look for his pet. It was last seen in the Nest. If you find it tell it that its master is looking for it.");
   quest::say("According to reports from our preliminary scouting expeditions, we believe that someone, or something, unleashed a curse within the Nest shortly before our soldiers first arrived. Venture into the Nest and see if you can uncover any clues as to the nature of this curse.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("You may recall the kirin ally that the chieftain mentioned and that you protected. Well, this same kirin has shied away from us since it felt the anger of its kin. Many have tried and failed to win this kirin's heart to our side once again. Now, we ask that you make an offer of peace as you are the one that protected it. If we can secure this, we might be able to gain an upper hand against the Dark Reign. Within the courtyard of Stillmoon Temple is the keeper of the cherry blossom forest. He will summon the kirin for you if you help him in his quest to find the perfect cherry blossom. You may have luck in finding this blossom upon certain goblins tending the cherry blossom grove.");
  quest::say("Return to me with an agreement with the Stillmoon Temple residents, or proof that they have turned against us.");
  }
  if ($ulevel >= 61 && $text=~/Hail/i){
  quest::say("We've uncovered documents that lead us to believe that the history of Thundercrest Isles is hidden in the walls deep within the confines of one of the islands. Within these walls are several coves where the very secrets of Yar`Lir, the storm dragon, are stored. If you're ever going to see Yar`Lir, you're going to need to read what these walls say.");
  quest::say("You must go forth into the storm dragon Yar`Lir's Halls of History, within her lair atop the Thundercrest Isles, to uncover the secrets -- indeed, the very essence -- of the dragon's history");
  quest::say("Return to me with what you find for your reward.");
}
}
sub EVENT_ITEM {
if ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 92812 => 1)) {
quest::say("Surprisingly, the sly Kirin turned to betrayal. Though this journey has ended on a sour note, perhaps there are still others willing to listen to offers of peace.");
quest::ding();
quest::exp(30000000);
quest::givecash(0,0,0,66);
}
elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 60264 => 1)) {
quest::say("You have bested beasts of incredible power against all odds to recover long-protected artifacts of the great storm dragon, Yar`Lir. You are on a path to uncovering the mysteries of the Nest and why it was kept hidden in front of your very eyes for so long.");
quest::ding();
quest::exp(15000000);
quest::givecash(0,0,0,75);
}
 } 
