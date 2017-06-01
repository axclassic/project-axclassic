##Portal 211194##
sub EVENT_SPAWN {
my $aid = quest::saylink("aid", 1);
    quest::ze(14,"Greeting Warriors of the Djinn. By order of the Lord Drizku I have been dispatched to $aid you in returning to the safest area in our temple.");
    quest::ze(14,"Quickly as it is not safe even for a messanger as I here.");
    quest::settimer("Portalpop",300)	
}
sub EVENT_SAY {
   if($text=~/aid/i){
   quest::say("Very well, I shalll do as asked.");
   quest::movepc(211,-2675,-385,-10);
	}
  }
sub EVENT_TIMER {
   if($timer eq "Portalpop"){
   quest::ze(14,"My time is up!");
   quest::depop();
}
}