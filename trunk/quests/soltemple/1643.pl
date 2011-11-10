sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("May the fires of Solusek Ro warm your innards! I am Gavel the Temperant. I work with Sister Blaize to forge the most elegant finery for clerics known to man or beast. Because we have no need for material wealth here in the temple. we ask that you retrieve [ingots and icons] from the lost or fallen brothers and sisters of our order. When mixed with some enchanted. [galvanized]. [vulcanized]. or [magnetized] platinum into an alloy. the items I can forge are splendid indeed!");
}
if($text=~/what ingots and icons/i){
quest::say("The ingots and icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [reverent]. the [constant]. and the [devout].");
}
if($text=~/what reverent/i){
quest::say("Regis the Reverent fell in love with a gypsy girl named Lianna Ferasa who lives in the Rathe Mountains. Ask her what has become of him. Bring me the ingot of the Reverent. the icon of the Reverent. and 2 enchanted platinum bars and I will forge them into a reward for you.");
}
if($text=~/what constant/i){
quest::say("Althuryn the Constant was brutally slain by two aqua goblins. The one called Sludge fled to Runnyeye. the one called Dwigus lives in Dagnor's Cauldron. Bring me the ingot of the Constant. the icon of the Constant. and 2 galvanized platinum bars and I will forge them into a reward for you.");
}
if($text=~/what devout/i){
quest::say("Nebbletob the Devout was once a slave in the mines of Meldrath. The Minotaur Sentry there was particularly cruel to him. He was in the expedition to Everfrost when Brother Theo drowned. When trying to rescue Theo. he came upon some caves under the river. He also narrowly escaped death when a great white beast attacked him. He never saw what the beast was. but it shredded his pack where he kept his icon. Bring me the ingot of the Devout. the icon of the Devout. and 2 vulcanized platinum bars and I will forge them into a reward for you.");
}
if($text=~/what galvanized/i){
quest::say("Enchanted platinum bars can be galvanized by Genni. vulcanized by Vilissia. and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
}
if($text=~/what vulcanized/i){
quest::say("Enchanted platinum bars can be galvanized by Genni. vulcanized by Vilissia. and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest.");
}
if($text=~/what magnetized/i){
quest::say("Enchanted platinum bars can be galvanized by Genni. vulcanized by Vilissia. and magnetized by Ostorm. Just give them the enchanted platinum bar and they will do the rest."); }
}
sub EVENT_ITEM { 
if($itemcount{19009} == 1 && $itemcount{19010} == 1 && $itemcount{16507} == 2){
quest::say("Impressive. do you have the rest?");
quest::say("Impressive. do you have the rest?");
quest::say("Impressive. do you have the rest?");
quest::say("Wear this with pride!");
quest::summonitem("4925"); }
}
#END of FILE Zone:soltemple  ID:1643 -- Gavel_the_Temperant 

