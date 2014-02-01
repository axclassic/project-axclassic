sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Allo dere $name. how does ye fare today? Are ye a priest of the great Brell Serilis? If ye are not I mean nothin against yar but I am on a mission to administer guidance to a holy priest of milord Brell Serilis.");
}
if($text=~/i am a priest/i){
quest::say("Well now were talkin $name. I think if ye have been doing well in your training then ye will be ready to assist me in with the problem we been havin with those dern good fer nothin [green rascals].");
}
if($text=~/what green rascals/i){
quest::say("Well of course I be talkin bout dose goblins that have tried to storm our front gates fer some time. I reckon dey are up to no good sense I hear dey just be a few from a well trained horde of goblin invaders that are planning an attack me thinks. Will ye [help] us in finding and slaying these [goblins]?");
}
if($text=~/i will help goblins/i){
quest::say("Dats great to hear $name! To prove to me that you have found and slain these beasts bring 4 sets of the beads that dey carry around their necks. I don't know much about dem but id reckon dey have set up camp close bye ere. The night watch that haulted the first attack by these goblins described the fighting style to be of the highest goblin caliber. I hope this helps. good luck to ye.");
}
if($text=~/i will help you to find the goblins/i){
quest::say("Dats great to hear $name! To prove to me that you have found and slain these beasts bring 4 sets of the beads that dey carry around their necks. I don't know much about dem but id reckon dey have set up camp close bye ere. The night watch that haulted the first attack by these goblins described the fighting style to be of the highest goblin caliber. I hope this helps. good luck to ye."); }
}
sub EVENT_ITEM { 
if($itemcount{2396} == 4){
quest::summonitem("1430");
quest::faction("10803","1");
quest::faction("Not_Found","1");
quest::faction("Not_Found","1"); }
}
#END of FILE Zone:kaladima  ID:60011 -- Bronlor_Lightblade 

