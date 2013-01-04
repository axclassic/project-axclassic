######################################
## NPC: #Norrath Adventurer         ##
## Zone: Global Template            ##
##  Moonstones Quests               ##
## By: Qadar                        ##
## Revised by caved for AXClassic   ##
## EQWorld Server     19-12-2010    ##
######################################
sub EVENT_SAY {
my $travels = quest::saylink("travels", 1);
my $hear = quest::saylink("hear", 1);
my $first = quest::saylink("first", 1);
my $second= quest::saylink("second", 1);
my $third = quest::saylink("third", 1);
my $gems = quest::saylink("gems", 1);
my $trophy = quest::saylink("trophy", 1);
my $types = quest::saylink("types", 1);
my $color = quest::saylink("color", 1);
my $command = quest::saylink("command", 1);
  if($text=~/Hail/i){
    $client->Message(14,"Hello, $name!  What an amazing world we live in. The best advice I can give you is to take a trip, go somewhere new, enjoy some adventures. My $travels have been very exciting! I can also help you iff you wish to dye your mercenaries armor $color , or help you using the $command once you've got it, just let me know...");
  }
  if($text=~/travels/i){
    $client->Message(14,"I have traveled all across Norrath, and have experienced many of its wonders. I have seen many lands, and many creatures, some fantastic and some frightening. Would you like to $hear more?");
  }
  if($text=~/hear/i){
    $client->Message(14,"I have made many journeys. Would you like to hear about my $first trip, my $second trip, or my $third trip. Or perhaps you would like to hear more about the $gems ?");
  }
  if($text=~/first/i){
    $client->Message(14,"On my first trip, I visited Befallen, Crushbone, Warrens, Upper Guk, Najena, and Blackburrow. I would highly recommend you visit them as well. In fact, as a fellow traveler, I will give you something nice if you do. Collect a gem from each of these areas, and add them to my trophy. Once it is completed, return the Trophy of the Traveler to me for your reward. Would you like my $trophy ?");
  }
  if($text=~/second/i){
    $client->Message(14,"On my second trip, I visited Unrest, High Keep, Runnyeye Citadel, Mistmoore, Solusek's Eye, and Permafrost Keep. Quite impressive, but you must be careful in these places. I will give you something nice if you chose to explore these places. Collect a gem from each of these areas, and add them to my trophy. Once it is completed, return the Trophy of the Explorer to me for your reward. Would you like my $trophy ?");
  }
  if($text=~/third/i){
    $client->Message(14,"On my third trip, I visited Lower Guk, Nagafen's Lair, The Hole, Cazic-Thule, Infected Paw, and Kedge Keep. Highly dangerous for all but the most experienced adventurers. Of course, if you chose to brave these areas, it will be worth your while. Collect a gem from each of these areas, and add them to my trophy. Once it is completed, return the Trophy of the Adventurer to me for your reward. Would you like my $trophy ?");
  }
  if($text=~/gems/i){
    $client->Message(14,"I have found some amazing things in the places I have visited. I have collected a gem from each one of them. The gems can only be found in certain areas, so they serve as proof that you have indeed traveled to these spots. Spend enough time there, and I am sure you will come across one. I like to reward those who share my sense of adventure, and go where I have gone on my trips. Would you like to hear more about the 3 $types of gems?");
  }
  if($text=~/trophy/i){
    $client->Message(14,"Take this trophy. It is missing the gems.  Explore Norrath, find six similar gems from different areas, and add them all to this trophy. When you are done, return the completed trophy to me for your reward. BEWARE THOUGH! You MUST combine the gems into the trophy before handing it back to me! I cannot reward you unless you do this! Don't wait! Hurry up and get going!  Norrath is far too amazing to go unexplored!");
    quest::summonitem(318);   # Incomplete Trophy (6 slot quest combine container)
  }
  if($text=~/types/i){
    $client->Message(14,"There are three types of gems. The six travelers gems can be found in the areas I visited on my $first trip, the six explorer gems are in the areas I visited on my $second trip, and the six adventurer gems you will find in the areas where I visited on my $third trip.");
  }
  if($text=~/color/i){
    $client->Message(14,"I can grant you the bot command to dye your bots armor but you will have to do me a favour first. You have to travel to the Southern plains of the Karanas and visit a friend of mine a famous painter with the name Dino Blackdye, he was last seen close to Lake Rathe. Ask him to fill this vial and bring it back to me.");
quest::summonitem(10062); #Empty vial
  }
  if($text=~/command/i){
    $client->Message(14,"The command is #bot armorcolor [slot] [red] [green] [blue], if you forget you can always do #bot armorcolor help.");
  }
}
sub EVENT_ITEM {
my $types = quest::saylink("types", 1);
  if(plugin::check_handin(\%itemcount, 321 => 1)){                 # Trophy of the Traveler:  Combine items 300,301,302,303,304,305 in container 318
    $client->Message(14,"Take these Moonstones to the Spell Scriber for your reward.");
    $client->Message(6,"You have completed the Trophy of Traveler!");
    quest::summonitem(129); #Moonstones for Anita Thrall quest
    quest::summonitem(130); #Moonstones for Anita Thrall quest
  }
  elsif(plugin::check_handin(\%itemcount, 322 => 1)){           # Trophy of the Explorer:  Combine items 306,307,308,309,310,311 in container 318
    $client->Message(14,"Take these Moonstones to the Spell Scriber for your reward.");
    $client->Message(6,"You have completed the Trophy of the Explorer!");
    quest::summonitem(135); #Moonstones for Anita Thrall quest
    quest::summonitem(136); #Moonstones for Anita Thrall quest
  }
  elsif(plugin::check_handin(\%itemcount, 323 => 1)){             # Trophy of the Adventurer:  Combine items 312,313,314,315,316,317 in container 318
    $client->Message(14,"Take these Moonstones to the Spell Scriber for your reward.");
    $client->Message(6,"You have completed the Trophy of Adventurer!");
    quest::summonitem(131); #Moonstones for Anita Thrall quest
    quest::summonitem(132); #Moonstones for Anita Thrall quest;
  }
  elsif(plugin::check_handin(\%itemcount, 318 => 1)){             # If the unfinished trophy is turned in, hand it back and give more hints on the correct way to do the quest
    $client->Message(14,"This is not completed, take this back. Gather six gems of the same class, and combine them in this, then return it to me. Do you need to know more about the gem $types ?");
    # Return incomplete trophy, but contents are lost
    quest::summonitem(318); # Unfinished Trophy
  }
elsif (plugin::check_handin(\%itemcount, 119513 => 1)) {
$client->Message(14,"Wonderfull, I see you have spoken to Dino. How is he doing? Well as promissed here is your #bot armorcolor skill, enjoy...");
#Enable skill for player here and i got no clue: #bot armorcolor
quest::ding();
quest::exp(1000);
}
   else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items 
    plugin::return_items(\%itemcount);
    return 1;
  }
}
