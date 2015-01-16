sub EVENT_SPAWN {
quest::emote(" stops moving and, with obvious effort, becomes more like mist than water. The elemental spirit remains in this position as it struggles to maintain control of its own will.");
   }
sub EVENT_SAY {
   if($text=~/Hail/i){
   quest::say("Thank you for freeing me, $name. I am not sure how it is that you broke the power that commanded me, but for that I am very grateful.");
   quest::emote(" looks at you carefully before speaking again.");
   quest::say("I sense that you will need my aid in the future. To repay my debt to you I give you my blessing. This is no mean thing, it carries with it a portion of my own power. Mine is the cool rain and soft mist. I am the essence of morning dew and the lazy fog. I have no doubt that you will use it wisely. There are more of my kin enslaved by these beasts and others like them. You appear to have the power to rescue them as you have me. I am not a being of foresight or far-seeing, mine is the realm of small, gentle things, but even I can see that you are a being of portent. I am honored to have met you. I must return to my realm. I shall never forget this place and what it has made me do, nor shall I forget the one thing that freed me.");   
   quest::summonitem(62621);
   quest::spawn2(301060,0,0,1596.8,-490.4,437.8,57.6);
   quest::depop(280086);
   quest::depop();
   }
 }