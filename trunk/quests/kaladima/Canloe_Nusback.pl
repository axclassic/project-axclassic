sub EVENT_SAY { 
my $serve = quest::saylink("serve", 1);
my $orcs = quest::saylink("orcs", 1);
my $Trondle = quest::saylink("Trondle", 1);
my $Mudtoes = quest::saylink("Mudtoes", 1);
if($text=~/Hail/i){
quest::say("Step forward and speak up. young $name! Kaladim can always use another warrior. Are you ready to $serve Kaladim or has a yellow streak appeared down your back?");
}
if($text=~/serve/i){
quest::say("Then serve you shall. Let your training begin on the battlefields of Faydwer. Seek out and destroy all Crushbone $orcs. Return their belts to me.  I shall also reward you for every two orc legionnaire shoulder pads returned.  A warrior great enough to slay one legionnaire shall surely have no problem with another.  Go. and let the cleansing of Faydwer begin.");
}
if($text=~/orcs/i){
quest::say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great $Trondle Ogrebane. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
}
if($text=~/Trondle/i){
quest::say("Trondle Ogrebane is the legendary dwarven warrior who single-handedly exterminated the ogre clan called the $Mudtoes. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
}
if($text=~/Mudtoes/i){
quest::say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
}
}


sub EVENT_ITEM { 
 if($itemcount{13318} == 1){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2124");
	quest::givecash("0","8","0","0");
	 quest::ding(); quest::exp(4000);
} elsif($itemcount{13318} == 2){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2120");
	 quest::ding(); quest::exp(8000);
	quest::givecash("0","16","0","0");
} elsif($itemcount{13318} == 3){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2120");
	 quest::ding(); quest::exp(12000);
	quest::givecash("0","32","0","0");
 } elsif($itemcount{13318} == 4){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	 quest::ding(); quest::exp(17000);
	quest::summonitem("2113");
	quest::givecash("0","48","0","0");
 } elsif($itemcount{13319} == 2){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2117");
	 quest::ding(); quest::exp(20000);
	quest::givecash("0","4","0","0");
 } elsif($itemcount{13319} == 4){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2117");
	 quest::ding(); quest::exp(40000);
	quest::givecash("0","8","0","0");
 } elsif($itemcount{13318} == 2 && $itemcount{13319} == 2){
	quest::say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
	quest::summonitem("2117");
	 quest::ding(); quest::exp(28000);
	quest::givecash("0","20","0","0");
 } elsif($itemcount{13319} == 1 && $itemcount{13917} == 1){
	quest::say("Aha!! You have downed a Crushbone legionnaire!! You have shown yourself to be a strong warrior. Take this. This is more becoming of a great warrior such as yourself. Let no creature stand in the way of the Stormguard!");
	quest::summonitem("10017","1");
	 quest::ding(); quest::exp(20000);
	quest::givecash("0","0","1","0");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
  quest::say("I have no need of this, take it back.");
 }
}
#END of FILE Zone:kaladima  ID:60005 -- Canloe_Nusback 

