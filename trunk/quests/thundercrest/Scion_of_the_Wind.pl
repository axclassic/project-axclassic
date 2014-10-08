sub EVENT_SAY {
if ($text=~/Kor Lal Lir Toval/i) {
quest::say("You should not know those words! You will perish by my claw!");
quest::spawn2(340120,0,0,-2385,-397,293.6,95.4);
quest::depop();
}
}