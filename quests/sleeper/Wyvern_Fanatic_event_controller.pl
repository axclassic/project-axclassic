sub EVENT_SIGNAL {
    if($signal == 1290) { ##signal 1290 is that Sinister Gargoyle is dead##
    quest::settimer("Fanatic",60); 
	}
 }
sub EVENT_TIMER{
   if($timer eq "Fanatic"){
   quest::stoptimer("Fanatic");
   quest::spawn2(128071,0,0,212,-2383,-698,64);
   }
}   