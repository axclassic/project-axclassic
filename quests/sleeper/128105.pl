sub EVENT_SAY {
if($text=~/hail/i && defined $qglobals{"Sleeperawake"} == 1){
quest::say ("deleting the global.");
quest::delglobal("Sleeperawake");
}
if($text=~/hail/i && !defined $qglobals{"Sleeperawake"}){
quest::say("Setting Global.");
quest::setglobal("Sleeperawake", 0, 3, "F");

}
}