##South Village Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 8001) {
   quest::settimer("delay_owlbears_south_village_timer",300);
  }
if($signal == 8002){
   quest::depop(166908);
  }
if($signal == 8003){
   quest::depop(166811);
  }
if($signal == 8004){
   quest::depop(166909);
	}
if($signal == 8005){
   quest::depop(166912);
	}
if($signal == 8006){
   quest::depop(166913);
  }
if($signal == 8007){
   quest::depop(166914);
	}
if($signal == 8008){   
   quest::depop(166915);
	}
if($signal == 8009){   
   quest::depop(166916);
	}
if($signal == 8010){   
   quest::depop(166917);
	}
if($signal == 8011){   
   quest::depop(166918);
	}
if($signal == 8012){   
   quest::depop(166919);
  }
if($signal == 8013){
   quest::depop(166920);
  }
if($signal == 8014){
   quest::depop(166921);
  }
if($signal == 8015){
   quest::depop(166922);
  }
if($signal == 8016){
   quest::depop(166923);
  }
if($signal == 8017){
   quest::depop(166924);
  }
if($signal == 8018){
   quest::depop(166925);
  }
if($signal == 8019){
   quest::depop(166926);
  }
if($signal == 8020){
   quest::depop(166927);
  }
if($signal == 8021){
   quest::depop(166928);
  }
if($signal == 8022){
   quest::depop(166929);
  }
if($signal == 8023){
   quest::depop(166930);
  }
if($signal == 8024){
   quest::depop(166931);
  }
if($signal == 8025){
   quest::depop(166932);
  }
if($signal == 8026){
   quest::depop(166933);
	}
if($signal == 8027){
   quest::depop(166934);
  }
if($signal == 8028){
   quest::depop(166935);
	}
if($signal == 8029){
   quest::depop(166936);
  }
if($signal == 8030){
   quest::depop(166937);
  }
if($signal == 8031){
   quest::depop(166938);
  }
if($signal == 8032){
   quest::depop(166939);
  }
if($signal == 8033){
   quest::depop(166940);
  }
if($signal == 8034){
   quest::depop(166941);
  }
if($signal == 8035){
   quest::depop(166942);
  }
if($signal == 8036){
   quest::depop(166943);
  }
if($signal == 8037){
   quest::depop(166944);
  }
if($signal == 8038){
   quest::depop(166945);
  }
if($signal == 8039){
   quest::depop(166948);
  }
if($signal == 8040){
   quest::depop(166949);
  }
if($signal == 8041){
   quest::depop(166946);
  }
if($signal == 8042){
   quest::depop(166947);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_south_village_timer"){
     quest::stoptimer("delay_owlbears_south_village_timer");
   quest::depop();
   }
 }  
