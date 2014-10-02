sub EVENT_SAY (
if ($text=~/vek lal lir qualal/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::attack($name);
}
}