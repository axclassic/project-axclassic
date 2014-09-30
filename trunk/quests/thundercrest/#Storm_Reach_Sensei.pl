sub EVENT_SIGNAL {
if($signal == 114) { #signal 114 signal from controller to speak#
quest::shout("Congratulations! You have defeated the Disciples of the Five Elements. You have proven yourself worthy to face the Four Emotions. They have mastered their emotions and from them they gain strength. Each has become a conduit for the emotions of our kind, a paradigm, if you will. Certainly you shall defeat them, for you are the champions of your people and they are slaves. We shall begin again in two minutes. Rest and consult with each other, if you have need.");
quest::signalwith(340049,223,96000); #tell controller round 2 in two minutes#
}
if($signal == 116) { #signal 116 signal from controller to speak#
quest::shout("Well Done. It is rare that an opponent is able to defeat the goblin Emotions. Your next test will be greater, I fear. You must face our three Animals. These are grandmasters of our arts and have never suffered defeat against opponents outside of these grand islands of the sky. You look weary. You shall have three minutes to prepare for the next contest.");
quest::signalwith(340049,224,144000); #tell controller round 3 in three minutes#
}
if($signal == 118) { #signal 118 signal from controller to speak#
quest::shout("Amazing, simply amazing! Never before have our grandmasters been defeated by anyone other than your next opponents. Prepare yourself, for next you must face Silk and Steel. You have four minutes to prepare, use those minutes wisely.");
quest::signalwith(340049,225,192000); #tell controller round 4 in four minutes#
}
if($signal == 120) { #signal 120 signal from controller to speak#
quest::say("Wonderful! You have defeated all of the students of the Storm Reach Dojo! Celebrate your victory. Remember this day."); 
quest::signalwith(340049,121,8000); #tell controller needed a pause before next line#
}
elsif($signal == 122) { #signal 122 signal from controller to speak#
quest::say("You have only had an advantage in numbers. Experience has taught me that such advantages usually lead to disaster caused by overconfidence or reliance on the lesser skills of others. Today you have proven that my experience is not always correct, a humbling moment.");
quest::signalwith(340049,123,4000); #tell controller needed a pause before next line#
}
if($signal == 124) { #signal 124 signal from controller to speak#
quest::say("You should return to those that sent you and tell them of your success. It will be a moment of shame for me to return to my mistress and explain the defeat of my students. I offer you my humble congratulations."); 
quest::signalwith(340049,125,4000); #tell controller needed a pause before next line#
}
if($signal == 126) { #signal 124 signal from controller to speak#
quest::say("However, our challenge is not over. You were to defeat all of the members of the Storm Reach Dojo to prove your worth. You have indeed defeated all of the students of my humble dojo, but you have not defeated the master of this insignificant school. To complete the challenge, you must defeat the school's master."); 
quest::spawn2(340039,0,0,-92.5,-336.1,253.2,2.8);  #spawn killable Storm_Reach_sensei#
quest::depop();
}
}


