######################################
## NPC: River Source                ##
## Zone: Warrens                    ##
## Created by Congdar               ##
## Quests:                          ##
##  Tunic of Riddosan               ##
######################################

sub EVENT_SPAWN {
    quest::set_proximity($x - 35, $x + 35, $y - 35, $y + 35);
}

sub EVENT_ENTER {
   if(plugin::check_hasitem($client, 1799)) {
      $client->NukeItem(1799);#Harbinger of Bertoxxulous
      $client->Message(14, "As your reach the source of the river, you take out the Harbinger of Bertoxxulous and empty it into the water, leaving you with an Empty Jar.");
      quest::summonitem(1892);#Empty Jar
      quest::exp(1000);
      quest::ding();
   }
}

