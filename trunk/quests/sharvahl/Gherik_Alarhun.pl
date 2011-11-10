sub EVENT_ITEM { 
if($itemcount{2877} == 1){
quest::say("Good day $name. I've been expecting you. It is both my duty and my pleasure to oversee this early stage of your training. To begin. you must display basic combat capability. To this end. return to me with three shells of scorpions and I will instruct you further.");
quest::summonitem("2877");
}
if($itemcount{3648} == 3){
quest::say("Grind the femur bone of four grimlings in this container. Take the resulting powder and. in the same container. combine water and xakra worm bile. The resulting clay will yield a special bowl when spun with this sketch and a flask of water on a pottery wheel. Bring the unfired bowl to me.");
quest::summonitem("17235");
}
if($itemcount{16915} == 1){
quest::summonitem("3653");
}
if($itemcount{3655} == 1 && $itemcount{3661} == 1 && $itemcount{2878} == 1){
quest::summonitem("3657"); }
}
#END of FILE Zone:sharvahl  ID:155075 -- Gherik_Alarhun 

