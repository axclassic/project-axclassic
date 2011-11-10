sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. adventurer!!  Stand tall and fight for the forest folk and all good races of Norrath.  We shall claim this land for the kingdom of Thex!  My warriors shall not fail.  Already we patrol deep in the wilds of Kunark.  We welcome all mercenaries and urge adventurers to [join the defense of the outpost].");
}
if($text=~/i wish to join the defense of the outpost/i){
quest::say("I salute you!!  Join the hunt.  Reports from the front line indicate a rise in the drolvarg population.  Abandon your fear and slay these beasts for the greater good.  Already. they have taken far too many lives. even my sibling's!!  I shall pay you your wages upon the return of four drolvarg teeth."); }
}
sub EVENT_ITEM { 
if($itemcount{12977} == 4){
quest::summonitem("13155","7");
quest::givecash("7","12","3","0");
quest::faction("320","1");
quest::faction("10401","1");
quest::faction("Not_Found","1");
quest::faction("11501","-1");
quest::faction("403","-1"); }
}
#END of FILE Zone:firiona  ID:84151 -- Captain_Nealith 

