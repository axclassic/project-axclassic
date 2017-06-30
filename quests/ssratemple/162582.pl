##Emp_Event_Controller 162582##

sub EVENT_SPAWN {
my $empevent = 0;
  $counter = undef;
}
sub EVENT_SIGNAL {
if($signal == 162) {
  $counter += 1;
if($counter == 7) {
quest::settimer("spawnemp",900);
quest::signalwith(162581,91,0);
quest::signalwith(162580,92,0);
 $counter = undef;
quest::depop();
}
}
}
sub EVENT_TIMER {
if($timer eq "spawnemp"){
quest::stoptimer("spawnemp")
quest::depop(165227);
quest::depopall(162210);
quest::depop(162130);
quest::depop(162123);
quest::depop(162127);
quest::depop(162124);
quest::depop(162126);
quest::depop(162128);
quest::depop(162129);
 $counter = undef;
quest::depop();
}
}
