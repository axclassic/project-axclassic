##Master of the Gaurd_event##

 sub EVENT_SIGNAL {
    if($signal == 12820) { ##signal 12820 is that MotG is being attacked##
    quest::settimer("Firstround",60); 
	}
    elsif($signal == 12821) {
    quest::depopall(128151);
    quest::depop();	
    }
	  else{
	   #Do Nothing;
	}
  }	
sub EVENT_TIMER{
   if($timer eq "Firstround"){
   quest::stoptimer("Firstround");
   quest::spawn2(128151,0,0,593.6,-811,2,173);
   quest::spawn2(128151,0,0,450.3,-802.4,2,69);
   quest::settimer("Secondround",120);
   }
   elsif($timer eq "Secondround"){
   quest::stoptimer("Secondround");
   quest::spawn2(128151,0,0,323,-822.4,2,181);
   quest::spawn2(128151,0,0,223.9,-822.4,2,102.5);
   quest::settimer("Thirdround",120);
   }
   elsif($timer eq "Thirdround"){
   quest::stoptimer("Thirdround");
   quest::spawn2(128151,0,0,527.8,-744.4,2,129);
   quest::spawn2(128151,0,0,286.6,-744.4,2,129);
   quest::settimer("Forthround",120);
   }
   elsif($timer eq "Forthround"){
   quest::stoptimer("Forthround");
   quest::spawn2(128151,0,0,593.6,-811,2,173);
   quest::spawn2(128151,0,0,450.3,-802.4,2,69);
   quest::settimer("Fithround",120);
   }
   elsif($timer eq "Fithround"){
   quest::stoptimer("Fithround");
   quest::spawn2(128151,0,0,323,-822.4,2,181);
   quest::spawn2(128151,0,0,223.9,-822.4,2,102.5);
   quest::settimer("Sixthround",120);
   }
   elsif($timer eq "Sixthround"){
   quest::stoptimer("Sixthround");
   quest::spawn2(128151,0,0,527.8,-744.4,2,129);
   quest::spawn2(128151,0,0,286.6,-744.4,2,129);
   quest::settimer("Seventhround",120);
   }
   elsif($timer eq "Seventhround"){
   quest::stoptimer("Seventhround");
   quest::spawn2(128151,0,0,593.6,-811,2,173);
   quest::spawn2(128151,0,0,450.3,-802.4,2,69);
   quest::settimer("Eighthround",120);
   }
    elsif($timer eq "Eighthround"){
   quest::stoptimer("Eighthround");
   quest::spawn2(128151,0,0,593.6,-811,2,173);
   quest::spawn2(128151,0,0,450.3,-802.4,2,69);
   quest::settimer("Ninthround",120);
   }
   elsif($timer eq "Ninthround"){
   quest::stoptimer("Ninthround");
   quest::spawn2(128151,0,0,323,-822.4,2,181);
   quest::spawn2(128151,0,0,223.9,-822.4,2,102.5);
   quest::settimer("Tenthround",120);
   }
   elsif($timer eq "Tenthround"){
   quest::stoptimer("Tenthround");
   quest::spawn2(128151,0,0,527.8,-744.4,2,129);
   quest::spawn2(128151,0,0,286.6,-744.4,2,129);
   quest::depop();
   }
     else{
	 #Do Nothing;
	 }
   }