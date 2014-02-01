#############
#NPC: Lieutenant_Dagarok
#Quest Name: The Crate (evil)
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Nesiff_Tallaherd, Guard_Weleth
#Items Involved: Slip of Parchment ID:18824
#zone: qeynos2

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("How dare you disturb me! You people need to just mind your pathetic lives and leave the rest to us. Leave me now!");
  }
  if (($text=~/who Guard Weleth/i)||($text=~/who is Guard Weleth/i)) {
    quest::say("Guard Weleth? What is there to tell about that coward? He is inept and derelict in his duties. If Commander Kane were in charge, soldiers like him would be chopped up and fed to the beetles.");
  }
  if (($text=~/who Commander Kane/i)||($text=~/who is Commander Kane/i)){
    quest::say("Commander Kane Bayle is the commander of all the Qeynos Guard. He is second only to his brother, Antonius Bayle. His post is in the guard house at the city gates. Mind you, do not bother him, he has a bit of a temper.");
  }
}

sub EVENT_ITEM {
  # Slip of Parchment ID:18824
  if (plugin::check_handin(\%itemcount, 18824 => 1)) {
    quest::say("What is this? Hmmm. It seems Weleth has a problem with following orders. I will deal with him. Good work in bringing this to my attention. Our job here would be much nore difficult without the help of loyal citizens like yourself. Take this as a token of Commander Kane's appreciation.");
    quest::faction(53,10);	 #corrupt qeynos guards
	quest::faction(135,-30); #guards of qeynos
    quest::faction(164,10);	 #kane bayle
	quest::faction(33,10);	 #circle of unseen hands
    quest::faction(218,10);  #merchants of qeynos
	quest::faction(21,10);	 #bloodsabers
	quest::ding(); quest::exp(250);
    quest::givecash(6,2,0,0);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qeynos2 ID: 2020 NPC: Lieutenant_Dagarok

