############################
##    Edited by Aardil    ##
##     Added dialogue     ##
##      11-25-2013        ##
############################
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail $name, I am much to busy for idol chat, Places to go, things to do. If you have something for me, then hand it to me. Others are waiting for me.");
}
sub EVENT_ITEM { 
if($itemcount{18896} == 1){
}
if($itemcount{13867} == 1){
quest::givecash("7","0","0","0");
quest::faction("322","1");
quest::faction("304","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","1");
quest::faction("10103","1");
}
if($itemcount{1004} == 1){
quest::summonitem("13865");
quest::faction("322","1");
quest::faction("304","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","1");
quest::faction("10103","1"); }
}
}
#END of FILE Zone:ecommons  ID:22058 -- Altunic_Jartin 

