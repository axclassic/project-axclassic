sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. Welcome!!  Time to train.  Time to fight.  Time to serve the Iksar Empire.  You will need weapons.  I have the [footman pike] for all new recruits to earn.");
}
if($text=~/footman pike/i){
quest::say("A footman pike is what you need.  A footman pike is what you get. but earn it you will.  You must [slay many beasts] to prove to us that you are a true warrior.  Fail and you will be exiled to live with the Forsaken.");
}
if($text=~/many beasts/i){
quest::say("Yes.  You will slay or you will be slain.  Take this footman's pack and fill it you will.  Fill it with [weapons of our foes].  When all are combined. the full footman's pack shall be returned to me along with your militia pike.  Do this and earn your footman pike and then we may have a true mission for you.");
}
if($text=~/weapons of our foes/i){
quest::say("Yes.  You need to know the weapons required.  Fill the pack with javelins.  Froglok bounder and goblin hunter javelins.  Two of each."); }
}
#END of FILE Zone:cabeast  ID:1113 -- Drill_Master_Kyg 

