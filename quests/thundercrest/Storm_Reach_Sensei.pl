sub EVENT_SAY {
my $price = quest::saylink("price", 1);
my $time = quest::saylink("time", 1);
   if ($text=~/Hail/i){
   quest::say("Welcome to the Storm Reach Dojo. I am pleased that you have taken up our humble challenge. As soon as you are ready, bring at least six of your fellows into the dojo and we shall begin. Be aware that this is a contest to the death. Do not enter the dojo unless you are prepared to pay that $price.");
   }
   if ($text=~/price/i){
   quest::say("Good, you have decided to meet the challenge. I will not bore you with unworthy tales of our training methods or our meager accomplishments, certainly your own deeds far outshine our own. We are but meager servants to the Strom Mistress, Yar`Lir, and are of little consequence. We have been asked to test you and, certainly, ourselves in a battle to the death. The residents of this place are away at tasks beyond those such as we, and for a short while we have this room to ourselves. We must finish our contest before they return, and so there is little $time for pleasantries."); 
   }
   if ($text=~/time/i){
   quest::say("A winner will be declared if they are the only combatants alive in this room. Your first challenge will be to defeat the Disciples of The Five Elements. Certainly they will be easily defeated by such mighty beings, but it is within their hearts to try. Your battle will begin in one minute. Prepare yourselves.");
   quest::spawn2(340049,0,0,-205.9,-148.,251,102.9); #spawn dojo_controller#
   quest::signalwith(340049,111,1); # signal Dojo_controller to add one to spawn#
   quest::signalwith(340049,112,60); # signal Dojo_controller to begin event#
   }
}
sub EVENT_SIGNAL {
if($signal == 114) { #signal 114 signal from controller to speak#
quest::shout("Congratulations! You have defeated the Disciples of the Five Elements. You have proven yourself worthy to face the Four Emotions. They have mastered their emotions and from them they gain strength. Each has become a conduit for the emotions of our kind, a paradigm, if you will. Certainly you shall defeat them, for you are the champions of your people and they are slaves. We shall begin again in two minutes. Rest and consult with each other, if you have need.");
quest::signalwith(340049,115,120); #tell controller round 2 in two minutes#
}
elsif($signal == 116) { #signal 116 signal from controller to speak#
quest::shout("Well Done. It is rare that an opponent is able to defeat the goblin Emotions. Your next test will be greater, I fear. You must face our three Animals. These are grandmasters of our arts and have never suffered defeat against opponents outside of these grand islands of the sky. You look weary. You shall have three minutes to prepare for the next contest.");
quest::signalwith(340049,117,180); #tell controller round 3 in three minutes#
}
elsif($signal == 118) { #signal 118 signal from controller to speak#
quest::shout("Amazing, simply amazing! Never before have our grandmasters been defeated by anyone other than your next opponents. Prepare yourself, for next you must face Silk and Steel. You have four minutes to prepare, use those minutes wisely.");
quest::signalwith(340049,119,240); #tell controller round 4 in four minutes#
}
elsif($signal == 120) { #signal 120 signal from controller to speak#
quest::say("Wonderful! You have defeated all of the students of the Storm Reach Dojo! Celebrate your victory. Remember this day."); 
quest::signalwith(340049,121,10); #tell controller needed a pause before next line#
}
elsif($signal == 122) { #signal 122 signal from controller to speak#
quest::say("You have beaten all of my students, and have only had an advantage in numbers. Experience has taught me that such advantages usually lead to disaster caused by overconfidence or reliance on the lesser skills of others. Today you have proven that my experience is not always correct, a humbling moment.");
quest::signalwith(340049,123,10); #tell controller needed a pause before next line#
}
elsif($signal == 124) { #signal 124 signal from controller to speak#
quest::say("You should return to those that sent you and tell them of your success. It will be a moment of shame for me to return to my mistress and explain the defeat of my students. I offer you my humble congratulations."); 
quest::signalwith(340049,125,5); #tell controller needed a pause before next line#
}
elsif($signal == 126) { #signal 124 signal from controller to speak#
quest::say("However, our challenge is not over. You were to defeat all of the members of the Storm Reach Dojo to prove your worth. You have indeed defeated all of the students of my humble dojo, but you have not defeated the master of this insignificant school. To complete the challenge, you must defeat the school's master."); 
quest::spawn2(340039,0,0,-92.5,-336.1,253.2,2.8);  #spawn killable Storm_Reach_sensei#
quest::depop();
}
}
sub EVENT_DEATH {
quest::emote(' corpse falls slowly to the floor, a small smile on his face');
quest::ding();
quest::exp(75000000);
quest::spawn2(340050,0,0,-90.2,-242.2,248.9,2.8); ##spawn a chest##
}

