sub EVENT_SIGNAL {
    if($signal == 1290) { ##signal 1290 is that Furious Phantasm is dead##
    quest::settimer("Fanatic",30); 
	}
 }
sub EVENT_TIMER{
   if($timer eq "Fanatic"){
   quest::stoptimer("Fanatic");
   quest::spawn2(128071,0,0,1298,-1808,-127,129);
   quest::depop();
   }
}   