sub EVENT_SAY {
if ($text=~/Nil Lal Lir Keval/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::spawn2(340119,0,0,-2486,-205,292.5,201.1);
quest::depop();
}
}