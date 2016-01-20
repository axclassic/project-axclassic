##North Cave Delay respawn check against Grimlings##
sub EVENT_SIGNAL{
if ($signal == 3001) {
   quest::settimer("delay_grimlings_north_cave_timer",180);
  }
if($signal == 3002){
   quest::depop(166);
  }
if($signal == 3003){
   quest::depop(166);
  }
if($signal == 3004){
   quest::depop(166);
	}
if($signal == 3005){
   quest::depop(166);
	}
if($signal == 3006){
   quest::depop(166);
  }
if($signal == 3007){
   quest::depop(166);
	}
if($signal == 3008){   
   quest::depop(166);
	}
if($signal == 3009){   
   quest::depop(166);
	}
if($signal == 3010){   
   quest::depop(166);
	}
if($signal == 3011){   
   quest::depop(166);
	}
if($signal == 3012){   
   quest::depop(166);
  }
if($signal == 3013){
   quest::depop(166);
  }
if($signal == 3014){
   quest::depop(166);
  }
if($signal == 3015){
   quest::depop(166);
  }
if($signal == 3016){
   quest::depop(166);
  }
if($signal == 3017){
   quest::depop(166);
  }
if($signal == 3018){
   quest::depop(166);
  }
if($signal == 3019){
   quest::depop(166);
  }
if($signal == 3020){
   quest::depop(166);
  }
if($signal == 3021){
   quest::depop(166);
  }
if($signal == 3022){
   quest::depop(166);
  }
if($signal == 3023){
   quest::depop(166);
  }
if($signal == 3024){
   quest::depop(166);
  }
if($signal == 3025){
   quest::depop(166);
  }
if($signal == 3026){
   quest::depop(166);
	}
if($signal == 3027){
   quest::depop(166);
  }
if($signal == 3028){
   quest::depop(166);
	}
if($signal == 3029){
   quest::depop(166);
  }
if($signal == 3030){
   quest::depop(166);
  }
if($signal == 3031){
   quest::depop(166);
  }
if($signal == 3032){
   quest::depop(166);
  }
if($signal == 3033){
   quest::depop(166);
  }
if($signal == 3034){
   quest::depop(166);
  }
if($signal == 3035){
   quest::depop(166);
  }
if($signal == 3036){
   quest::depop(166);
  }
if($signal == 3037){
   quest::depop(166);
  }
if($signal == 3038){
   quest::depop(166);
  }
if($signal == 3039){
   quest::depop(166);
  }
if($signal == 3040){
   quest::depop(166);
  }
if($signal == 3041){
   quest::depop(166);
  }
if($signal == 3042){
   quest::depop(166);
  }
if($signal == 3043){
   quest::depop(166);
  }
if($signal == 3044){
   quest::depop(166);
  }
if($signal == 3045){
   quest::depop(166);
  }
if($signal == 3046){
   quest::depop(166);
  }
if($signal == 3047){
   quest::depop(166);
  }
if($signal == 3048){
   quest::depop(166);
  }
if($signal == 3049){
   quest::depop(166);
  }
if($signal == 3050){
   quest::depop(166);
  }
if($signal == 3051){
   quest::depop(166);
  }
if($signal == 3052){
   quest::depop(166);
  }
if($signal == 3053){
   quest::depop(166);
  }
if($signal == 3054){
   quest::depop(166);
  }
if($signal == 3055){
   quest::depop(166);
  }
if($signal == 3056){
   quest::depop(166);
  }
if($signal == 3057){
   quest::depop(166);
  }
if($signal == 3058){
   quest::depop(166);
  }
if($signal == 3059){
   quest::depop(166);
  }
if($signal == 3060){
   quest::depop(166);
  }
if($signal == 3061){
   quest::depop(166);
  }
if($signal == 3062){
   quest::depop(166);
  }
if($signal == 3063){
   quest::depop(166);
  }
if($signal == 3064){
   quest::depop(1662);
  }
if($signal == 3065){
   quest::depop(166);
  }
if($signal == 3066){
   quest::depop(166);
  }
if($signal == 3067){
   quest::depop(166);
  }
if($signal == 3068){
   quest::depop(166);
  }
if($signal == 3069){
   quest::depop(166);
  }
if($signal == 3070){
   quest::depop(166);
  }
if($signal == 3071){
   quest::depop(166);
  }
if($signal == 3072){
   quest::depop(166);
  }
if($signal == 3073){
   quest::depop(166);
  }
if($signal == 3074){
   quest::depop(166);
  }
if($signal == 3075){
   quest::depop(166);
  }
if($signal == 3076){
   quest::depop(166);
  }
if($signal == 3077){
   quest::depop(166);
  }
if($signal == 3078){
   quest::depop(166);
  }
if($signal == 3079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_grimlings_north_cave_timer"){
     quest::stoptimer("delay_grimlings_north_cave_timer");
   quest::depop();
   }
 }  
