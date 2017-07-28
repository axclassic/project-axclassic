######################################
## NPC: Keletha Nightweaver         ##
## Zone: Paineel                    ##
## Quests:                          ##
##  Cold Iron                       ##
##  Tunic of Riddosan               ##
##                                  ##
## Updated by Congdar               ##
######################################

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Hello. $name.  Interested in the art of research?  I have several tomes which may aid you in such a pursuit.");
   }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 1774 => 1)) {
       #Envelope with dust sample
       quest::emote("takes the note, dumps the dust into her hand and examines it for a moment. She looks up and chuckles, then says, 'It's amuzing how one of our Royal Guards cannot identify this substance. Do you feel how it's slightly cooler than other metals? It's called Permafrost Iron, also known as Cold Iron to laymen. Miragul wrote of its properties in his memoirs. There are much better metals at our disposal now, so its use is rare except in more primitive cultures. Here is my report.");
       quest::summonitem(1775);#Hereitics Report
       quest::ding();
       quest::exp(137180);
    }
    plugin::return_items(\%itemcount);
}
#END of FILE Zone:paineel  ID:75083 -- Keletha_Nightweaver
