sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Leave this place or find yourself [bound to this land] as I am.");
}
if($text=~/what bound to this land/i){
quest::say("I was torn to pieces for failure to complete a task for my master.  I lost my life. my precious [shadowknight armor] and most of all. my [lower body]!!");
}
if($text=~/what shadowknight armor/i){
quest::say("My darkforge armor!!  It was taken  into the land of lizards by the lizardmen crusaders!!  It is worthless decayed armor now!! I cannot even wear it any more. but perhaps you can!!  Would you like me to [make you darkforge armor]?");
}
if($text=~/what make you darkforge armor/i){
quest::say("Darkforge helms require my decayed helm and visor as well as two Freeport militia helms.  The breastplate requires the decayed breastplate. decayed mail and two enchanted platinum bars. Vambraces need both decayed vambraces and a Qeynos Guard kite shield.  The bracers require both decayed bracers and a broken horn from a minotaur lord.");
}
if($text=~/what lower body/i){
quest::say("My lower body was taken from me. along with my hands.  I was pieced together using portions of other failed champions.  Now I can only [create darkforge armor] in the form of helms. breastplates. vambraces and bracers.");
}
if($text=~/what create darkforge armor/i){
quest::say("Darkforge helms require my decayed helm and visor as well as two Freeport militia helms.  The breastplate requires the decayed breastplate. decayed mail and two enchanted platinum bars. Vambraces need both decayed vambraces and a Qeynos Guard kite shield.  The bracers require both decayed bracers and a broken horn from a minotaur lord."); }
}
#END of FILE Zone:soltemple  ID:113201 -- an_undead_knight_ 

