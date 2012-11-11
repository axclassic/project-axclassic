sub EVENT_SAY {
my $fig = quest::saylink("fight");
if($text=~/Hail/i) {
quest::say("I am for hire, $name, and I'm currently charging 5pp per hour, Want me to fight for you $class?, just pass me 5pp");
}
sub EVENT_ITEM {
if(($platinum == 5)) {
quest::depop;
$client->MakePet(null, Trillion, "Trillion");
}
}



sub EVENT_TIMER {
if($timer eq "payme") {
quest::say("Time for my payment, $name");
quest::stoptimer("payme");
}
sub EVENT_ITEM {
if(($platinum == 5)) {
}
else {
quest::depop;
}
quest::settimer("payme", 60);
}
}
}