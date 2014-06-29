sub EVENT_SAY { 
my $knight = quest::saylink("knight", 1);
my $crusade = quest::saylink("crusade", 1);
if ($text=~/Hail/i){
quest::say("Welcome $name . This is the Temple of Marr and you must be another seeker of Passion and Valor. That is good. Become one with us and help us to defeat the $fallen knight. It is he who has caused the demise of this city."); 
}
if ($text=~/knight/i){
quest::say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the $Crusade of Tears this city would still be united in valour."); 
}
if ($text=~/crusade/i){quest::say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade Freeport was left in the care of Sir Lucan D'Lere. How unfortunate."); }
}
sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 18736 => 1)){
    quest::say("I am so thrilled you have chosen to join this regal and fearsome crew. You will find that as a member of the Ireblood Ragers, you have a strong and proud force backing you. Now you must complete your first task.");
	quest::say("Take this application to Registrah Bindarah and return to me with proof of your citizenship.");
	quest::say("I know that you may be nervous right now... after all, this should be a very exciting first step for you. If you happen to get lost while looking for the registrah, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
	quest::summonitem(13556);
	quest::ding();
	quest::faction(258,10); #Priests of Marr
    quest::faction(184,10); #Knights of Truth
    quest::faction(105,-30); #The Freeport Militia
	quest::exp(1000);	
}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Cleric');
  plugin::return_items(\%itemcount);
  }
}
  #END of FILE Zone:freportn  ID:8046 -- Tholius_Quey 

