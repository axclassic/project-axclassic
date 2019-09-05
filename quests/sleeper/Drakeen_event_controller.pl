##Drakeen_event##

 
sub EVENT_SPAWN {
    quest::spawn2(128046,0,0,212,-2383,-698,64);
    }
sub EVENT_SIGNAL {
    if($signal == 12812) { ##signal 12812 is that Drakeen Apprentice is dead##
    quest::settimer("Apprentice",120); 
	}	
    elsif($signal == 12813) { ##signal 12813 is from Drakeen Protector is dead##
   quest::settimer("Protector",120);
   }
   elsif($signal == 12814) { ##signal 12814 is from Drakeen Controller is dead##
   quest::settimer("Controller",10);
   }
      else{
	  #Do Nothing;
	  }
   }
sub EVENT_TIMER{
   if($timer eq "Apprentice"){
   quest::spawn2(128071,0,0,212,-2383,-698,64);
   quest::stoptimer("Apprentice");
   }
   elsif($timer eq "Protector"){
   quest::spawn2(128096,0,0,212,-2383,-698,64);
   quest::stoptimer("Protector");
   }
   elsif($timer eq "Controller"){
   quest::stoptimer("Controller");
   quest::depop();
   }
     else{
	 #Do Nothing;
	 }
   }