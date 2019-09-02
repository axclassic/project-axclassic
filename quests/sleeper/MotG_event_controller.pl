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
   quest::depop(128005);
   quest::depop(128155);
   quest::spawn2(128151,0,0,575,-800,1,253);
   quest::spawn2(128151,0,0,325,-800,1,253);
   quest::settimer("Secondround",120);
   }
   elsif($timer eq "Secondround"){
   quest::stoptimer("Secondround");
   quest::depop(128004);
   quest::depop(128160);
   quest::spawn2(128151,0,0,475,-800,1,253);
   quest::spawn2(128151,0,0,225,-800,1,253);
   quest::settimer("Thirdround",120);
   }
   elsif($timer eq "Thirdround"){
   quest::stoptimer("Thirdround");
   quest::depop(128000);
   quest::depop(128156);
   quest::spawn2(128151,0,0,475,-750,1,253);
   quest::spawn2(128151,0,0,325,-750,1,253);
   quest::settimer("Forthround",120);
   }
   elsif($timer eq "Forthround"){
   quest::stoptimer("Forthround");
   quest::depop(128161);
   quest::depop(128007);
   quest::spawn2(128151,0,0,225,-750,1,253);
   quest::spawn2(128151,0,0,575,-750,1,253);
   quest::settimer("Fithround",120);
   }
   elsif($timer eq "Fithround"){
   quest::stoptimer("Fithround");
   quest::depop(128006);
   quest::depop(128162);
   quest::spawn2(128151,0,0,575,-700,1,253);
   quest::spawn2(128151,0,0,225,-700,1,253);
   quest::settimer("Sixthround",120);
   }
   elsif($timer eq "Sixthround"){
   quest::stoptimer("Sixthround");
   quest::depop(128157);
   quest::depop(128002);
   quest::spawn2(128151,0,0,325,-700,1,253);
   quest::spawn2(128151,0,0,475,-700,1,253);
   quest::settimer("Seventhround",120);
   }
   elsif($timer eq "Seventhround"){
   quest::stoptimer("Seventhround");
   quest::depop(128158);
   quest::depop(128153);
   quest::spawn2(128151,0,0,325,-650,1,253);
   quest::spawn2(128151,0,0,475,-650,1,253);
   quest::settimer("Eighthround",120);
   }
    elsif($timer eq "Eighthround"){
   quest::stoptimer("Eighthround");
   quest::depop(128003);
   quest::depop(128163);
   quest::spawn2(128151,0,0,575,-650,1,253);
   quest::spawn2(128151,0,0,225,-650,1,253);
   quest::settimer("Ninthround",120);
   }
   elsif($timer eq "Ninthround"){
   quest::stoptimer("Ninthround");
   quest::depop(128154);
   quest::depop(128159);
   quest::spawn2(128151,0,0,475,-600,1,253);
   quest::spawn2(128151,0,0,325,-600,1,253);
   quest::settimer("Tenthround",120);
   }
   elsif($timer eq "Tenthround"){
   quest::stoptimer("Tenthround");
   quest::depop(128164);
   quest::depop(128001);
   quest::spawn2(128151,0,0,225,-600,1,253);
   quest::spawn2(128151,0,0,575,-600,1,253);
   quest::depop();
   }
     else{
	 #Do Nothing;
	 }
   }