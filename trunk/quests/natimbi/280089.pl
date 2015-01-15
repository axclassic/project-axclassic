sub EVENT_SPAWN {
quest::emote(" stops moving and, with obvious effort, becomes more like mist than water. The elemental spirit remains in this position as it struggles to maintain control of its own will.");
   }
sub EVENT_SAY {
   if($text=~/Hail/i){
   quest::say("'Thank you for freeing me,$name. I am not sure how it is that you broke the power that commanded me, but for that I am very grateful."):
   quest::emote(" looks at you carefully before speaking again.");
   quest::say("I sense that you will need my aid in the future. As for now I have nothing to give you, it seems that somewhere along the way, I lost the blessing I would bestow upon you for freeing me. All I can do is offer my thanks and wish you safe travels $name");
   quest::depop(280086);
   quest::depop();
   }
 }