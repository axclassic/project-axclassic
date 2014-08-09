sub EVENT_SAY { 
if($text=~/hail/i){
quest::say("Welcome! Please look over my many treats. Do not think of the coin you shall spend. Heavy coin buys the finest and sweetest of treats. Feel free to ask me about any of the rare pies you see as I can tell you exactly how I make them.");
}
if($text=~/berry pie/i){
quest::say("Bixie berry pie?!!  It is no treat and is poisonous to the Iksar.  We use it to keep our froglok slaves nourished.  My apprentice baker. Bugrin. bakes them and delivers them to the slaves.  Only he has access to the bixie berry pie recipe.  All the pies are eaten by the slaves. If you think you have one. you must be mistaken.  Let me see it if you believe you have one.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12676 =>1 )) {
    quest::emote("breaks open the crust of the pie.");
    quest::say("Wait! What is this? A device of some kind? It looks kind of like some sort of lockpick. BUGRIN!! Get in here and answer some questions at once!!");
    quest::spawn(106138,57,0,120,563,4);  
    
  }
}
#END of FILE Zone:cabeast  ID:3051 -- Klok_Unlar 

