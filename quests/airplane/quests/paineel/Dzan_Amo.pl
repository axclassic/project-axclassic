sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Tabernacle of Terror. Perhaps you can control your fear long enough to be of [service] to us.");
}
if($text=~/service/i){
quest::say("I need some things fetched from the creatures just outside our city for a new ritual. Bring me two tufts of bat fur and two fire beetle legs and I will school you in the ways of terror."); }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 13069=>2, 13250=>2 )) { #Bat Fur x2, Fire Beetle Legs x2
      quest::say("Well done, I suppose.");
                          # Happy Sound (FanFare)
       quest::ding(); quest::exp(1000);                 # Experience
      quest::summonitem(quest::ChooseRandom(15201,15207,15208,15207,15205,15209,15210)); #Random 1st-Level Cleric Spell
      quest::faction("56","-5");        # Craftkeepers
      quest::faction("60","-5");        # Crimson Hands
      quest::faction("143","2");        # Heretics
      quest::faction("79","-5");        # Deepwater Knights
      quest::faction("112","-5");       # Gate Callers
      }
  else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75018 -- Dzan_Amo 

