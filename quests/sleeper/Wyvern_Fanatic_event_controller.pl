sub EVENT_SIGNAL {
    if($signal == 1290) { ##signal 1290 is that Furious Phantasm is dead##
    quest::settimer("Fanatic",30); 
	}
 }
sub EVENT_TIMER{
   if($timer eq "Fanatic"){
   quest::stoptimer("Fanatic");
   quest::spawn2(128071,0,0,623.2,-1335.3,-445.8,4.5);
   quest::depop();
   }
}   