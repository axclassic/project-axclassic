sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hmmph!!  Expect to be a great master such as I?  Maybe.  You still appear to be a [whiff].");
}
if($text=~/what is a whiff/i){
quest::say("A whiff is the sound of a tail striking air.  A whiff is you.  Inexperienced.  I can help you.  If you [want to earn the second shackle].");
}
if($text=~/yes i want to earn the second shackle/i){
quest::say("Then you shall perform the first rite.  Take this pack.  To the Outlands you will go.  You will fill and combine the pack with one of each of the following - goblin scout beads. a large scorpion pincer. a froglok skipper skipping stone and a sabertooth cub canine.  Return the full first rite pack and you shall prove yourself a monk.");
}
if($text=~/what is shackle of stone/i){
quest::say("Interested in the shackle of stone are we?  They are made for monks who have earned their first two shackles and are ready to climb up to the next rung.  A monk who feels he is ready to wear the shackle of stone must first [perform the task of cleansing].");
}
if($text=~/I want to earn the second shackle/i){
quest::say("Then you shall perform the first rite.  Take this pack.  To the Outlands you will go.  You will fill and combine the pack with one of each of the following - goblin scout beads. a large scorpion pincer. a froglok skipper skipping stone and a sabertooth cub canine.  Return the full first rite pack and you shall prove yourself a monk."); }
}
sub EVENT_ITEM { 
if($itemcount{12427} == 1){
quest::say("You have succeeded. young $name!  You have proven yourself a skilled monk.  You will now wear the shackle of clay.  You will now be required to increase your intensity of training in hopes that you may soon be able to earn your [shackle of stone].");
quest::summonitem("4191");
quest::givecash("0","0","6","0");
quest::faction("Not_Found","1");
quest::faction("11501","1"); }
}
#END of FILE Zone:cabeast  ID:3432 -- Master_Raska 

