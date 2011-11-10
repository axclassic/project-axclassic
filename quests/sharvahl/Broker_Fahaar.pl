sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name. if you know any citizens looking for work please tell them to show me their acrylia slate."); }
}
sub EVENT_ITEM { 
if($itemcount{2877} == 1){
quest::say("Excellent. I can always use someone eager to work. I require young rockhopper hides to stretch for some special tailoring projects. Combine in this sack the hides of four young rockhoppers and return to me the full hopperhide sack. I will give you a stretched hide in return.");
quest::summonitem("17236");
}
if($itemcount{3653} == 1){
quest::say("Very nice. I thank you $name. Here is the stretched hide I promised. and a leather cord I made from the scraps. If you have no need for the hide itself. any merchant will purchase it from you. If you desire to become my apprentice. save four of the cords that you earn from me and return them when you desire to learn more.  May the spirits guide and protect you!");
quest::summonitem("3655"); }
}
#END of FILE Zone:sharvahl  ID:155074 -- Broker_Fahaar 

