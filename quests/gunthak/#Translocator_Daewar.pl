sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. I can't seem to find the PoK book for Gunthak. The Academy of Arcane Sciences has sent a small team of us to investigate this. If you need to [travel to] Plane of Knowledge [pok] in the meantime, I can transport you to my companion there."); 
}
if($text=~/travel to pok/i){
quest::movepc(202,1208.54,-752.00,-157.87); }
}