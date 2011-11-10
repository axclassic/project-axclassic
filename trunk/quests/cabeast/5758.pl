sub EVENT_SAY { 
if($text=~/Rile/i){
quest::say("Very good. We are smiths for the Crusaders of the Greenmist and I shall make [armor] for you. provided you prove your worth. Fail these simple tasks. and you shall not be worthy to bear the title of crusader!");
}
if($text=~/armor/i){
quest::say("I will make [helms]. [gauntlets]. [boots]. and [vambraces]. My broodmate shall make the bracers. greaves. masks. and breastplate.");
}
if($text=~/helm/i){
quest::say("The sarnak are a mockery of the Iksar. They are nothing more than beasts fit only to do our bidding! I require you to bring me the sword of one of their Order of Knights and the head of a sarnak berserker. These beasts have been attacking our patrols of late. I also require a stone called a ruby and a banded helm. Do this and I shall make a helm for you.");
}
if($text=~/boots/i){
quest::say("Cactus quills can be very lethal. I seek to work them into my new boots. Find me these quills. a pair of skeletal feet. an emerald of fire. and some banded boots so that I may start working on them. Why are you still here?! Begone!");
}
if($text=~/gauntlets/i){
quest::say("I currently have need of a complete skeletal hand. for the research I am conducting. I wish to study its properties and form so that I can make gauntlets befitting our station. I also require two rubies that holds stars within and some banded gauntlets to complete my ritual. Do that and the gauntlets are yours to keep.");
}
if($text=~/ vambraces/i){
quest::say("The hideous Golra are hardy creatures. The tales indicate their ferocity almost matches our own. I wish to gain a trophy of one of these beasts. Bring me the skin of one. two blue sapphires. and banded sleeves. Then I shall give you these fine vambraces.");
}
if($text=~/rile/i){
quest::say("Very good. We are smiths for the Crusaders of the Greenmist and I shall make [armor] for you. provided you prove your worth. Fail these simple tasks. and you shall not be worthy to bear the title of crusader!");
}
if($text=~/armor/i){
quest::say("I will make [helms]. [gauntlets]. [boots]. and [vambraces]. My broodmate shall make the bracers. greaves. masks. and breastplate."); }
}
#END of FILE Zone:cabeast  ID:5758 -- Sirtha_Scarscale 

