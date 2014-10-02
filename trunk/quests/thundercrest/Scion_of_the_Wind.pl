sub EVENT_SAY (
if ($text=~/Kor Lal Lir Toval/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::attack($name);
}
}