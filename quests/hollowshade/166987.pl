##North Cave Delay respawn check against Grimlings##
sub EVENT_SIGNAL{
if ($signal == 3001) {
   quest::settimer("delay_grimlings_north_cave_timer",180);
  }
if($signal == 3002){
   quest::depop(166496);
  }
if($signal == 3003){
   quest::depop(166979);
  }
if($signal == 3004){
   quest::depop(166527);
	}
if($signal == 3005){
   quest::depop(166538);
	}
if($signal == 3006){
   quest::depop(166497);
  }
if($signal == 3007){
   quest::depop(166989);
	}
if($signal == 3008){   
   quest::depop(166511);
	}
if($signal == 3009){   
   quest::depop(166529);
	}
if($signal == 3010){   
   quest::depop(166540);
	}
if($signal == 3011){   
   quest::depop(166499);
	}
if($signal == 3012){   
   quest::depop(166981);
  }
if($signal == 3013){
   quest::depop(166530);
  }
if($signal == 3014){
   quest::depop(166541);
  }
if($signal == 3015){
   quest::depop(166501);
  }
if($signal == 3016){
   quest::depop(166513);
  }
if($signal == 3017){
   quest::depop(166982);
  }
if($signal == 3018){
   quest::depop(166542);
  }
if($signal == 3019){
   quest::depop(166502);
  }
if($signal == 3020){
   quest::depop(166514);
  }
if($signal == 3021){
   quest::depop(166532);
  }
if($signal == 3022){
   quest::depop(166544);
  }
if($signal == 3023){
   quest::depop(166503);
  }
if($signal == 3024){
   quest::depop(166515);
  }
if($signal == 3025){
   quest::depop(166533);
  }
if($signal == 3026){
   quest::depop(166545);
	}
if($signal == 3027){
   quest::depop(166516);
  }
if($signal == 3028){
   quest::depop(166983);
	}
if($signal == 3029){
   quest::depop(166546);
  }
if($signal == 3030){
   quest::depop(166495);
  }
if($signal == 3031){
   quest::depop(166494);
  }
if($signal == 3032){
   quest::depop(166553);
  }
if($signal == 3033){
   quest::depop(166554);
  }
if($signal == 3034){
   quest::depop(166505);
  }
if($signal == 3035){
   quest::depop(166535);
  }
if($signal == 3036){
   quest::depop(166547);
  }
if($signal == 3037){
   quest::depop(166572);
  }
if($signal == 3038){
   quest::depop(166573);
  }
if($signal == 3039){
   quest::depop(166506);
  }
if($signal == 3040){
   quest::depop(166517);
  }
if($signal == 3041){
   quest::depop(166536);
  }
if($signal == 3042){
   quest::depop(166548);
  }
if($signal == 3043){
   quest::depop(166507);
  }
if($signal == 3044){
   quest::depop(166518);
  }
if($signal == 3045){
   quest::depop(166537);
  }
if($signal == 3046){
   quest::depop(166243);
  }
if($signal == 3047){
   quest::depop(166797);
  }
if($signal == 3048){
   quest::depop(166555);
  }
if($signal == 3049){
   quest::depop(166558);
  }
if($signal == 3050){
   quest::depop(166556);
  }
if($signal == 3051){
   quest::depop(166559);
  }
if($signal == 3052){
   quest::depop(166549);
  }
if($signal == 3053){
   quest::depop(166667);
  }
if($signal == 3054){
   quest::depop(166520);
  }
if($signal == 3055){
   quest::depop(166563);
  }
if($signal == 3056){
   quest::depop(166596);
  }
if($signal == 3057){
   quest::depop(166566);
  }
if($signal == 3058){
   quest::depop(166984);
  }
if($signal == 3059){
   quest::depop(166522);
  }
if($signal == 3060){
   quest::depop(166523);
  }
if($signal == 3061){
   quest::depop(166524);
  }
if($signal == 3062){
   quest::depop(166525);
  }
if($signal == 3063){
   quest::depop(166526);
  }
if($signal == 3064){
   quest::depop(166550);
  }
if($signal == 3065){
   quest::depop(166552);
  }
  if($signal == 3066){
   quest::depop(166950);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_grimlings_north_cave_timer"){
     quest::stoptimer("delay_grimlings_north_cave_timer");
   quest::depop();
   }
 }  
