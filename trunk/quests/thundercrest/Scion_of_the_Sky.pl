sub EVENT_SAY (
if ($text=~/Nil Lal Lir Keval/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::attack($name);
}
}