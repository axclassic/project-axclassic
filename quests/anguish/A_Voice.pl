## A_Voice 317127##

sub EVENT_SIGNAL {
   if($signal == 900) {
   quest::emote(' echoes from behind the shield');
   quest::signalwith(317000,904,2);
   }
   elsif($signal == 901) {
   quest::emote(' echoes from behind the shield');
   quest::signalwith(317000,905,2);
   }
   elsif($signal == 903) {
   quest::emote(' echoes from behind the shield');
   quest::signalwith(317000,906,2);
   }
   elsif($signal == 904) {
   quest::depop(317000);
   quest::spawn2(317109,0,0,507,4969,294.3,128.4);
   quest::signalwith(317109,968,50);
   }
   else {
   #quest::shout(do nothing);
   }
  }  