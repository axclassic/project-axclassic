#Wong_Li killable#
sub EVENT_SAY {
if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("Congratulations for finding me adventurer. I simply could not resist meeting the one who had found the perfect Cherry Blossom. I know your side wishes to unlock the secrets that lay within these temple walls but you must earn my trust before I will part with its treasures. Lately a sickness of the spirit has infected some of my brethren. Those few of us able to resist this illness are too weak to seek the cause of this malady and thus we need you to help us in this endeavor. We think that the new goblin tending to the bath house, Nethran may have something to do with this. Find him and see if he has any clues on his person. Alas, I can not tell you exactly how to bring him out of hiding except to say that he is easily angered. Perhaps you can use this to lure him out. . .");
   }
   }
   sub EVENT_ITEM {
   if ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 36212 => 1)) {
   quest::say("Nethran had this on him, you say? This is very dire news indeed. This note speaks of an ancient and powerful curse that long ago descended upon this temple and its inhabitants. I can not translate all of the glyphs though but perhaps if you spoke with the temple librarian we might be able to uncover more about this plague. I will send word ahead so he will be expecting you.");
   quest::spawn(338227,0,0,-213.,954.3,41.7,125.4);
   quest::ding();
   quest::exp(3000000);
   }
   elsif ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 36213 => 1)) {
   quest::say("Very good adventurer, very good indeed! You have played your part in my plan most brilliantly but now I am forced to slay you, outsider. You see, I can not risk you upsetting my plans.");
   quest::spawn2(338231,0,0,904.9,524.2,13.7,64.9);
   quest::depop();
   }
   }