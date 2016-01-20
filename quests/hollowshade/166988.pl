##East Cave Delay respawn check against Sonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 4001) {
   quest::settimer("delay_wolves_east_cave_timer",180);
  }
if($signal == 4002){
   quest::depop(166602);
  }
if($signal == 4003){
   quest::depop(166603);
  }
if($signal == 4004){
   quest::depop(166604);
	}
if($signal == 4005){
   quest::depop(166655);
	}
if($signal == 4006){
   quest::depop(166656);
  }
if($signal == 4007){
   quest::depop(166657);
	}
if($signal == 4008){   
   quest::depop(166658);
	}
if($signal == 4009){   
   quest::depop(166605);
	}
if($signal == 4010){   
   quest::depop(166606);
	}
if($signal == 4011){   
   quest::depop(166607);
	}
if($signal == 4012){   
   quest::depop(166608);
  }
if($signal == 4013){
   quest::depop(166609);
  }
if($signal == 4014){
   quest::depop(166610);
  }
if($signal == 4015){
   quest::depop(166611);
  }
if($signal == 4016){
   quest::depop(166612);
  }
if($signal == 4017){
   quest::depop(166613);
  }
if($signal == 4018){
   quest::depop(166614);
  }
if($signal == 4019){
   quest::depop(166615);
  }
if($signal == 4020){
   quest::depop(166616);
  }
if($signal == 4021){
   quest::depop(166);
  }
if($signal == 4022){
   quest::depop(166617);
  }
if($signal == 4023){
   quest::depop(166618);
  }
if($signal == 4024){
   quest::depop(166619);
  }
if($signal == 4025){
   quest::depop(166620);
  }
if($signal == 4026){
   quest::depop(166621);
	}
if($signal == 4027){
   quest::depop(166622);
  }
if($signal == 4028){
   quest::depop(166623);
	}
if($signal == 4029){
   quest::depop(166624);
  }
if($signal == 4030){
   quest::depop(166625);
  }
if($signal == 4031){
   quest::depop(166626);
  }
if($signal == 4032){
   quest::depop(166627);
  }
if($signal == 4033){
   quest::depop(166628);
  }
if($signal == 4034){
   quest::depop(166629);
  }
if($signal == 4035){
   quest::depop(166630);
  }
if($signal == 4036){
   quest::depop(166631);
  }
if($signal == 4037){
   quest::depop(166632);
  }
if($signal == 4038){
   quest::depop(166633);
  }
if($signal == 4039){
   quest::depop(166634);
  }
if($signal == 4040){
   quest::depop(166635);
  }
if($signal == 4041){
   quest::depop(166636);
  }
if($signal == 4042){
   quest::depop(166637);
  }
if($signal == 4043){
   quest::depop(166638);
  }
if($signal == 4044){
   quest::depop(166639);
  }
if($signal == 4045){
   quest::depop(166640);
  }
if($signal == 4046){
   quest::depop(166641);
  }
if($signal == 4047){
   quest::depop(166642);
  }
if($signal == 4048){
   quest::depop(166643);
  }
if($signal == 4049){
   quest::depop(166644);
  }
if($signal == 4050){
   quest::depop(166645);
  }
if($signal == 4051){
   quest::depop(166646);
  }
if($signal == 4052){
   quest::depop(166647);
  }
if($signal == 4053){
   quest::depop(166648);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_east_cave_timer"){
     quest::stoptimer("delay_wolves_east_cave_timer");
   quest::depop();
   }
 }  
