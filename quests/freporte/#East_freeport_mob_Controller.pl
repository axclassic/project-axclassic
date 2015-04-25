#East_freeport_mob_Controller#
sub EVENT_SPAWN {
    quest::settimer(999,30);
 }
sub EVENT_TIMER {
  if($timername == 999) {
  my $a = quest::ChooseRandom(10156,10157,10160,10163,10164,10179,10186);
  quest::spawn2($a,0,0,-855,-236,-55,-246.5);
    quest::stoptimer(999);
    quest::depop();
  }
}