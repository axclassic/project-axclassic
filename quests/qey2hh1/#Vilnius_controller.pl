#Vilnius_controller#
sub EVENT_SPAWN {
    quest::settimer("vilniusswitch",30);
 }
sub EVENT_TIMER {
  if($timer eq "vilniusswitch") {
  my $a = quest::ChooseRandom(12019,12123,12139);
  quest::spawn2($a,17,0,-6695.9,166.9,260.9,209.5);
    quest::stoptimer("vilniusswitch");
    quest::depop();
  }
}