#Zone: Global
#Short Name: All Zones
#Angelox
#NPC Name: Priest_of_Discord
#NPC ID: All

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Should you wish to return from whence you came, tell me you wish to [go home] and I will send you.");
quest::say("If you wish to [know more] about travel in Discord, I will tell you.");
}
elsif($text=~/know more/i){
quest::say("We have been given a unique magic to pass through realms and we believe it to be the influence of Discord itself granting this gift upon its faithful followers. Only we can send you back and forth to this realm touched by Discord, a world called Kuua. If you are of the right ilk, I may be able to grant you [additional information].");
}
elsif($text=~/additional information/i){
quest::say("There is a magic in Kuua that is blessed with the power of Discord itself. We have found we can use that magic to help those who help us. If you return three [discordant crystal shards] and a [magic parchment], we will imbue it with our power so you may travel there alone. I will provide these spells to you, for your wizard or druid mercenary.");
}
elsif($text=~/discordant crystal/i){
quest::say("The crystal shards are very unique and bear a magic that brims with the power of Discord. We found we can use them to create spells on a specific type of discordant parchment that allows wizards and druids to pass through to the other realm.");
}
elsif($text=~/magic parchment/i){
quest::say("We are not certain what the parchments were meant for, but they burn hot and cold and are imbued with a magic that protects it from destroying itself. We need one of these parchments to make a travel spell to Kuua in the Realm of Discord.");
}
elsif(($text=~/wish to go to Discord/i)&&($ulevel>=45)){ #note: should be 45 when enabled
quest::movepc(302,-1491,-1325,224.2);
}
elsif(($text=~/wish to go to Discord/i)&&($ulevel<=45)){ #note: should be 45 when enabled
  quest::say ("Sorry, you're to low in level to enter.");
}
  elsif (($text=~/go home/i)&&($race eq 'Wood Elf')){
  quest::movepc(54,-197,27,-0.7);}
  elsif (($text=~/go home/i)&&($race eq 'Human')){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Erudite')){
  quest::movepc(24,-309.8,109.6,23.1);}
  elsif (($text=~/go home/i)&&($race eq 'High Elf')){
  quest::movepc(61,26.3,14.9,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Barbarian')){
  quest::movepc(29,12.2,-32.9,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Dark Elf')){
  quest::movepc(25,-965.3,2434.5,5.6);}
  elsif (($text=~/go home/i)&&($race eq 'Half Elf')){
  quest::movepc(9,-60.9,-61.5,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Dwarf')){
  quest::movepc(68,-214.5,2940.1,0.1);}
  elsif (($text=~/go home/i)&&($race eq 'Troll')){
  quest::movepc(52,1.1,14.5,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Ogre')){
  quest::movepc(49,520.1,235.4,59.1);}
  elsif (($text=~/go home/i)&&($race eq 'Halfling')){
  quest::movepc(19,-98.4,11.5,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Gnome')){
  quest::movepc(55,7.6,489.0,-24.9);}
  elsif (($text=~/go home/i)&&($race eq 'Froglok')){
  quest::movepc(1,198.4,14.6,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Iksar')){
  quest::movepc(106,-415.7,1276.6,3.1);}
  elsif (($text=~/go home/i)&&($race eq 'Vah Shir')){
  quest::movepc(155,105.6,-850.8,-190.4);}
}

sub EVENT_ITEM {
  if ($itemcount{77765} == 3 && $itemcount{77766} == 1){ #Removed Class Checks for bot quests
    quest::emote('takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.');
    quest::say('You may now travel further into Discord, true power awaits!');
    quest::summonitem("77662");
    quest::summonitem("77663");
    quest::summonitem("77659");
    quest::summonitem("77660");
    quest::summonitem("77661");
  }
#  elsif (($itemcount{77765} == 3 && $itemcount{77766} == 1)  && ($class eq 'Wizard')) { #Wizard spells
#    quest::emote('takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.');
#    quest::say('You may now travel further into Discord, true power awaits!');
#    quest::summonitem("77659");
#    quest::summonitem("77660");
#    quest::summonitem("77661");}
  else{
    quest::say("I can't use this.");
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
     }
   }
}

## Night and Day checker
##Angelox's
#This script will re-sync zone time
#sub EVENT_SPAWN
#{quest::settime($shifter,0);}
## End of checker
