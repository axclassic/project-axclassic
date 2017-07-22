##Flag_Reset 211202##
sub EVENT_SAY {
my $Mini = quest::saylink("Mini", 1);
my $Big = quest::saylink("Big", 1);
my $Final = quest::saylink("Final", 1);
if($text=~/Hail/i){
quest::say("So you think you screwed up the Collections eh? Ok tell me where you wish to start from. $Mini Boss Collection, $Big Boss Collection or $Final Boss.");
}
if($text=~/Mini/i){
quest::delglobal("Djinnthree");
quest::delglobal("Djinnfour");
quest::delglobal("Djinnfive");
quest::delglobal("Djinnsix");
quest::delglobal("Djinnseven");
quest::delglobal("Djinneight");
quest::delglobal("Djinnnine");
quest::setglobal("Djinnntwo", 1, 5, "F");
quest::say("Very well. Return to Arch Mage Driya Vicun for further instructions.");
}
if($text=~/Big/i){
quest::delglobal("Djinnthree");
quest::delglobal("Djinnfour");
quest::delglobal("Djinnfive");
quest::delglobal("Djinnsix");
quest::delglobal("Djinnseven");
quest::delglobal("Djinneight");
quest::delglobal("Djinnnine");
quest::setglobal("Djinnnfive", 1, 5, "F");
quest::say("Very well. Return to High Archon Mage Baein Udersith for further instructions.");
}
if($text=~/Final/i){
quest::delglobal("Djinnthree");
quest::delglobal("Djinnfour");
quest::delglobal("Djinnfive");
quest::delglobal("Djinnsix");
quest::delglobal("Djinnseven");
quest::delglobal("Djinneight");
quest::delglobal("Djinnnine");
quest::setglobal("Djinnsix", 1, 5, "F");
quest::say("Very well. Return to Drizmun Ak'Tel for further instructions.");
}
}