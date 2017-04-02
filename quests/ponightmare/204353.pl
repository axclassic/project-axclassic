#Deyid_Trigger#
sub EVENT_SIGNAL {
if($signal == 204) {
quest::shout("signal recieved!");
quest::settimer("depoptimer",30);
}
}
sub EVENT_TIMER {
if($timer eq "depoptimer") {
  quest::depopall(204351);
  quest::spawn2(204352,0,0,922,1028,275.2,58.1); 
  quest::spawn2(204352,0,0,947,1117,272.5,94.4); 
  quest::spawn2(204352,0,0,1031,1164,271.3,135.8); 
  quest::spawn2(204352,0,0,1121,1154,275.3,166.8); 
  quest::spawn2(204352,0,0,1153.7,1038.4,274,207.4); 
  quest::spawn2(204352,0,0,1039.1,969.6,273.5,251.5);
quest::stoptimer("depoptimer");
quest::depop();
}
}
