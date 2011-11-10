sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. I can't seem to find the Portal Stone to Gunthak. The Academy of Arcane Sciences has sent a small team of us to investigate this. If you need to [travel to] Gulf of Gunthank [gunthak] in the meantime, I can transport you to my companion there."); 
}
if($text=~/travel to gunthak/i){
quest::movepc(224,-978.10,1717.51,42.37); }
}