sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, young one. If you are here for training you must first present to me the note you were given.");
}
if(($text=~/application/i) && ($qglobals{Shar_Vahl_Cit} == 1)){
  quest::say("Luckily for you someone found it.");
  quest::summonitem(2873);}
if(($text=~/cloak/i) && ($qglobals{Shar_Vahl_Cit} == 7)){
  quest::say("Someone found a grimling wearing this in the pit. Try not to lose it this time.");
  quest::summonitem(2878);}
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("I know many of the taverns and eateries have their own barrels, but you may want to try Jakhal and Kahala's Brewery. You can find it in the southwestern section of the Merchant's Quarter, or Corridor of Heroes, as I like to call it..");
}
 }

sub EVENT_ITEM { 
if(plugin::check_handin(\%itemcount,30962 => 1)){
quest::summonitem("15225","1");
}
if(plugin::check_handin(\%itemcount,18551 => 1)){
quest::say("Welcome, $name! We are glad you have come to us for training, and so we should not waste any time. However, in order to join the Dar Khura, you must first become a citizen. Here, take this citizen application and visit Registrar Bindarah. Once you are a full citizen, return here with your citizenship papers, and we will continue.");
quest::setglobal("Shar_Vahl_Cit",1,5,"F");
quest::summonitem("2873");
}
if (plugin::check_handin(\%itemcount, 2897 => 1)) {

quest::say("Welcome back, $name! I see that your documents are in order and you are an official citizen of Shar Vahl, which is great news! Let me be the first to welcome you to the ranks of the Dar Khura! Here, take this cloak and wear it with pride.");
quest::say("Present your acrylia slate to spiritist Fehril and he will guide you through your early training. May the strongest of our ancestral spirits be your inspiration.");
quest::summonitem(2878);
quest::setglobal("Shar_Vahl_Cit",7,5,"F");
}
plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155167 -- Elder_Spiritist_Grawleh 

