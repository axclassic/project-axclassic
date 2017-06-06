##test 231736##
sub EVENT_SAY {
if ($text=~/hail/i && $ulevel <= 65 && $ulevel >= 60){
quest::say("Sending you to the Sunken Library.");
quest::setglobal("Takaten", 1, 5, "90M");
}
}