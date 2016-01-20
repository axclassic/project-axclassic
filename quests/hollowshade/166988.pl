##East Cave Delay respawn check against Sonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 4001) {
   quest::settimer("delay_wolves_east_cave_timer",180);
  }
if($signal == 4002){
   quest::depop(166);
  }
if($signal == 4003){
   quest::depop(166);
  }
if($signal == 4004){
   quest::depop(166);
	}
if($signal == 4005){
   quest::depop(166);
	}
if($signal == 4006){
   quest::depop(166);
  }
if($signal == 4007){
   quest::depop(166);
	}
if($signal == 4008){   
   quest::depop(166);
	}
if($signal == 4009){   
   quest::depop(166);
	}
if($signal == 4010){   
   quest::depop(166);
	}
if($signal == 4011){   
   quest::depop(166);
	}
if($signal == 4012){   
   quest::depop(166);
  }
if($signal == 4013){
   quest::depop(166);
  }
if($signal == 4014){
   quest::depop(166);
  }
if($signal == 4015){
   quest::depop(166);
  }
if($signal == 4016){
   quest::depop(166);
  }
if($signal == 4017){
   quest::depop(166);
  }
if($signal == 4018){
   quest::depop(166);
  }
if($signal == 4019){
   quest::depop(166);
  }
if($signal == 4020){
   quest::depop(166);
  }
if($signal == 4021){
   quest::depop(166);
  }
if($signal == 4022){
   quest::depop(166);
  }
if($signal == 4023){
   quest::depop(166);
  }
if($signal == 4024){
   quest::depop(166);
  }
if($signal == 4025){
   quest::depop(166);
  }
if($signal == 4026){
   quest::depop(166);
	}
if($signal == 4027){
   quest::depop(166);
  }
if($signal == 4028){
   quest::depop(166);
	}
if($signal == 4029){
   quest::depop(166);
  }
if($signal == 4030){
   quest::depop(166);
  }
if($signal == 4031){
   quest::depop(166);
  }
if($signal == 4032){
   quest::depop(166);
  }
if($signal == 4033){
   quest::depop(166);
  }
if($signal == 4034){
   quest::depop(166);
  }
if($signal == 4035){
   quest::depop(166);
  }
if($signal == 4036){
   quest::depop(166);
  }
if($signal == 4037){
   quest::depop(166);
  }
if($signal == 4038){
   quest::depop(166);
  }
if($signal == 4039){
   quest::depop(166);
  }
if($signal == 4040){
   quest::depop(166);
  }
if($signal == 4041){
   quest::depop(166);
  }
if($signal == 4042){
   quest::depop(166);
  }
if($signal == 4043){
   quest::depop(166);
  }
if($signal == 4044){
   quest::depop(166);
  }
if($signal == 4045){
   quest::depop(166);
  }
if($signal == 4046){
   quest::depop(166);
  }
if($signal == 4047){
   quest::depop(166);
  }
if($signal == 4048){
   quest::depop(166);
  }
if($signal == 4049){
   quest::depop(166);
  }
if($signal == 4050){
   quest::depop(166);
  }
if($signal == 4051){
   quest::depop(166);
  }
if($signal == 4052){
   quest::depop(166);
  }
if($signal == 4053){
   quest::depop(166);
  }
if($signal == 4054){
   quest::depop(166);
  }
if($signal == 4055){
   quest::depop(166);
  }
if($signal == 4056){
   quest::depop(166);
  }
if($signal == 4057){
   quest::depop(166);
  }
if($signal == 4058){
   quest::depop(166);
  }
if($signal == 4059){
   quest::depop(166);
  }
if($signal == 4060){
   quest::depop(166);
  }
if($signal == 4061){
   quest::depop(166);
  }
if($signal == 4062){
   quest::depop(166);
  }
if($signal == 4063){
   quest::depop(166);
  }
if($signal == 4064){
   quest::depop(1662);
  }
if($signal == 4065){
   quest::depop(166);
  }
if($signal == 4066){
   quest::depop(166);
  }
if($signal == 4067){
   quest::depop(166);
  }
if($signal == 4068){
   quest::depop(166);
  }
if($signal == 4069){
   quest::depop(166);
  }
if($signal == 4070){
   quest::depop(166);
  }
if($signal == 4071){
   quest::depop(166);
  }
if($signal == 4072){
   quest::depop(166);
  }
if($signal == 4073){
   quest::depop(166);
  }
if($signal == 4074){
   quest::depop(166);
  }
if($signal == 4075){
   quest::depop(166);
  }
if($signal == 4076){
   quest::depop(166);
  }
if($signal == 4077){
   quest::depop(166);
  }
if($signal == 4078){
   quest::depop(166);
  }
if($signal == 4079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_east_cave_timer"){
     quest::stoptimer("delay_wolves_east_cave_timer");
   quest::depop();
   }
 }  
