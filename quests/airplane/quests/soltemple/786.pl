sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail and good day to you.  I am Cryssia Stardreamer of the League of Antonican Bards.  My colleague Walthin and I are here while we deal in [lambent stones] with the followers of Solusek Ro.  If you are interested. my partner and I also deal in [lambent armor]... the perfect armor for a bard of note.");
}
if($text=~/what lambent stones/i){
quest::say("Lambent stones are gemstones of great power.  They are midnight blue in color - if you want more information on them you should ask Genni.");
}
if($text=~/what lambent armor/i){
quest::say("Lambent armor is custom crafted armor. made especially for bards.  It is forged by the MeadowGreen brothers and then enchanted by the followers of Solusek Ro.  If you are interested. I can tell you about the [lambent helm]. the [lambent breastplate]. [lambent vambraces] or [lambent bracers].  My colleague Walthin can tell you about other lambent armor pieces.");
}
if($text=~/what lambent helm/i){
quest::say("I can give you a lambent helm. but you will need to fetch me a few items I need for later trades with the followers of Solusek Ro.  I require an opoline helm from a Deepwater goblin and a mudwater rune from Cazic-Thule.  Finally. you will also need to see Genni about getting me a lambent star ruby.  Bring me these items. and I will give you a lambent helm.");
}
if($text=~/what lambent breastplate/i){
quest::say("Lambent breastplates are not cheap. but I can get you one if you bring me a few items I need for later trades with the followers of Solusek Ro.  Bring me a basalt carapace from the caverns of Guk and a gypsy lute from the Castle of Mistmoore.  You will also need to see Genni about getting me a lambent ruby.  Collect these items for me. and I will give you a lambent breastplate.");
}
if($text=~/what lambent vambraces/i){
quest::say("I will give you lambent vambraces if you can acquire the following items for me - fiery vambraces from a Solusek champion and the top portion of the Rune of the One Eye from Choon.  You will also need to see Genni about getting me a lambent sapphire.  Acquire these items for me and I will give you lambent vambraces.");
}
if($text=~/what lambent bracers/i){
quest::say("Lambent bracers are nice armor. and do not have the same level of complexity that other lambent armor pieces possess.  If you can fetch for me a dark boned bracelet from a greater dark boned skeleton. a griffenne charm and a lambent fire opal. I will give you a lambent bracer."); }
}
sub EVENT_ITEM { 
if($itemcount{4099} == 1 && $itemcount{10559} == 1){
quest::say("Wait. $name. are you not forgetting something?");
quest::say("Wait. $name. are you not forgetting something?");
quest::say("Well done. $name. here is your lambent helm.  Wear it with the praises of the League of Antonican Bards.");
quest::summonitem("4153");
quest::faction("Not_Found","1");
quest::faction("Not_Found","-1"); }
}
#END of FILE Zone:soltemple  ID:786 -- Cryssia_Stardreamer 

