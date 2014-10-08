sub EVENT_SAY {
if ($text=~/vek lal lir qualal/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::spawn2(340118,0,0,-2573,-684,292.3,0.0);
quest::depop();
}
}