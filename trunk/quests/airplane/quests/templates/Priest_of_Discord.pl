#Zone: Global
#Short Name: All Zones
#Angelox
#NPC Name: Priest_of_Discord
#NPC ID: All

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Ah, another who admits that the path to glory and power lies in discord? Have we not always preached the truth?  We are the only ones that can give you passage to the new world of purest Discord.  Should you like to go there, tell me you [wish to go to Discord] and I will grant you passage.  If you wish to [know more] about this travel, I will tell you.");
## And, of course, if you have come to seek the way of Discord in your life, then ask me about your [Tome of Order and Discord].");
}
elsif($text=~/tome/i){
quest::say("The Tome of Order and Discord was penned by the seventh member of the Tribunal and has become the key to a life of Discord. in spite of the author's pitiful warnings.  Do you not have one. child of Order?  Would you [like to read] it?");
}
elsif($text=~/know more/i){
quest::say("We have been given a unique magic to pass through realms and we believe it to be the influence of Discord itself granting this gift upon its faithful followers. Only we can send you back and forth to the realm touched by Discord, a world called Kuua. You will find priests on the other side that will send you directly back to me, where your travel originated. And, if you are of the right ilk, I may be able to grant you [additional information].");
}
elsif($text=~/additional information/i){
quest::say("There is a magic in Kuua that is blessed with the power of Discord itself. We have found we can use that magic to help those who help us. If you return three [discordant crystal shards] and a [magic parchment], we will imbue it with our power so you may travel there alone. Obviously, you must be a master of teleportation yourself -- a wizard or druid, is what I mean.");
quest::say("If you are not a wizard or druid, and are seeking this power for your mercenaries, seek out the Priests when you arrive in Discord.");
}
elsif($text=~/discordant crystal/i){
quest::say("The crystal shards are very unique and bear a magic that brims with the power of Discord. We found we can use them to create spells on a specific type of discordant parchment that allows wizards and druids to pass through to the other realm.");
quest::say("If you are not a wizard or druid, and are seeking these spells for your mercenaries, seek out the Priests when you arrive in Discord.");
}
elsif($text=~/magic parchment/i){
quest::say("We are not certain what the parchments were meant for, but they burn hot and cold and are imbued with a magic that protects it from destroying itself. We need one of these parchments to make a travel spell to Kuua in the Realm of Discord.");
}
#elsif($text=~/read/i){
#quest::say("Very well.  Here you go.  Simply return it to me to be released from the chains of Order.");
#quest::summonitem("18700");
#}
elsif(($text=~/wish to go to Discord/i)&&($ulevel>=45)){ #note: should be 45 when enabled
quest::movepc(302,-1491,-1325,224.2);
}
elsif(($text=~/wish to go to Discord/i)&&($ulevel<=45)){ #note: should be 45 when enabled
  quest::say ("Sorry, you're to low in level to enter.");
}
}



sub EVENT_ITEM { 
 if($item1=="18700"){
 quest::say("Sorry, no PVP on this server, but I'll give you the experience for your effort.");
	## quest::say("I see you wish to join us in Discord! Welcome! By turning your back on the protection of Order you are now open to many more opportunities for glory and power. Remember that you can now be harmed by those who have also heard the call of Discord.");
	## quest::pvp("on"); Angelox; no PVP for now.
	 quest::ding(); quest::exp(100);
 }
  elsif (($itemcount{77765} == 3 && $itemcount{77766} == 1) && ($class eq 'Druid')) { #Druid spells
    quest::emote('takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.');
    quest::say('You may now travel further into Discord, true power awaits!');
    quest::summonitem("77662");
    quest::summonitem("77663");
  }
  elsif (($itemcount{77765} == 3 && $itemcount{77766} == 1)  && ($class eq 'Wizard')) { #Wizard spells
    quest::emote('takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.');
    quest::say('You may now travel further into Discord, true power awaits!');
    quest::summonitem("77659");
    quest::summonitem("77660");
    quest::summonitem("77661");
  }else{
    quest::say("I can't use this.");
    quest::say("if you are seeking teleportation power for you or your  mercenaries, seek out the Priests when you arrive in Discord");
     }
    plugin::return_items(\%itemcount);
     if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
   }
 }

## Night and Day checker
##Angelox's
#This script will re-sync zone time
#sub EVENT_SPAWN
#{quest::settime($shifter,0);}
## End of checker
