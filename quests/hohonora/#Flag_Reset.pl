##Flag_Reset 211202##
sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("So you think you screwed up the Collections eh? Ok Resetting your globals to Final Bosses Collection. Speak with Drizmun Ak'Tel for further instructions.");
quest::delglobal("Djinnone");
quest::delglobal("Djinntwo");
quest::delglobal("Djinnthree");
quest::delglobal("Djinnfour");
quest::delglobal("Djinnfive");
quest::delglobal("Djinnsix");
quest::delglobal("Djinnseven");
quest::delglobal("Djinneight");
quest::delglobal("Djinnnine");
quest::setglobal("Djinnnine", 1, 5, "F");

}
}