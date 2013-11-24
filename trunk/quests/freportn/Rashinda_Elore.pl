######################
## Edited responses ##
##    By Aardil     ##
##   11-24-2013     ##
######################
sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hello. I am Rashinda Elore. The city Landholder Manager. If you have business to discuss. please direct it to my two clerks downstairs. Good day.");
}
if($text=~/blades/i){
quest::say("Rashinda Elore says 'Zimel's Blades? It used to be a fine place of rare weaponry. [Ariska Zimel] was the owner. No one knows what happened to the man. He just vanished overnight. His shop used to be in East Freeport which is now a slum, er, I mean, which now has plenty of available lots for sale with plenty of potential. As for Zimel's Blades, we [condemned] it.");
}
if($text=~/Ariska Zimel/i){
quest::say("Ariska Zimel was a human blacksmith, a master when it came to making swords, I hear. He kept to himself a lot. He disappeared about one year ago. A lot of people were disappointed when we had to condemn Zimel's Blades. All the merchandise was handed over to [Groflah Steadirt]. Mostly charred junk.");
}
if($text=~/Groflah Steadirt/i){
quest::say("Groflah Steadirt is the dwarven owner of Groflah's Forge which is right near here. He was Ariska Zimel's best friend. They were apparently avid travelers before settling down here in Freeport. I guess it was during their travels that they picked up the fine arts of the forge. You should talk to Groflah about Zimel. He can tell you more than I can.");
}
if($text=~/condemned/i){
quest::say("About a week after Ariska Zimel's disappearance, strange noises were heard from his shop. Loud booms and rumbling as though the earth itself were exploding. When the militia got to the shop, they said the shop was badly burned by an exploding boiler. They had us condemn the building due to its unsafe structure.");
}
plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8002 -- Rashinda_Elore