sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Good to meet you. $name.  Please look around.  I have much to offer.  I am a master woodworker.  It runs in the Parsini family."); }
}
sub EVENT_ITEM { 
if($itemcount{18833} == 1){
quest::say("I have been waiting for someone to come and retrieve this staff.  Here you are.  You will have to combine it with treant resin and an Odus pearl.  You can find Odus pearls in the water in the harbor. As for the resin. I can make it if you can find me some treant shards.  Maybe another woodworker or cobbler in Qeynos has some.");
quest::summonitem("17917");
quest::faction("103","1");
quest::faction("Not_Found","1");
quest::faction("Not_Found","1"); }
}
#END of FILE Zone:tox  ID:38122 -- Emil_Parsini 

