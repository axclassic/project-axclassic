##Dolgrem_Counter 211160##
sub EVENT_SPAWN {
my $dolgrem_event = 0;
 $counter = undef;
 quest::settimer("Dolgrempop",900);
    }
sub EVENT_SIGNAL {
   if($signal == 230) { ##signal 230 is from each mob who dies##
         $counter += 1;
   if($counter == 8) {
   quest::depop(211157);
   quest::spawn2(211159,0,0,-941.4,1085.2,1,23.4);
   quest::signalwith(211159,250,0);
     $counter = 0;
   quest::depop();	 
   }
   }
   }
sub EVENT_TIMER {
  if($timer eq "Dolgrempop") {
   quest:;depopall(211127);
   quest::depop(211157);
   quest::depop(211159);
   quest::depop();
  }
}	   