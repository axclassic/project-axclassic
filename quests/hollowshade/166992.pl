##South Village Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 8001) {
   quest::settimer("delay_owlbears_south_village_timer",300);
  }
elsif($signal == 8002){
   quest::depop(166908);
  }
elsif($signal == 8003){
   quest::depop(166811);
  }
elsif($signal == 8004){
   quest::depop(166909);
	}
elsif($signal == 8005){
   quest::depop(166912);
	}
elsif($signal == 8006){
   quest::depop(166913);
  }
elsif($signal == 8007){
   quest::depop(166914);
	}
elsif($signal == 8008){   
   quest::depop(166915);
	}
elsif($signal == 8009){   
   quest::depop(166916);
	}
elsif($signal == 8010){   
   quest::depop(166917);
	}
elsif($signal == 8011){   
   quest::depop(166918);
	}
elsif($signal == 8012){   
   quest::depop(166919);
  }
elsif($signal == 8013){
   quest::depop(166920);
  }
elsif($signal == 8014){
   quest::depop(166921);
  }
elsif($signal == 8015){
   quest::depop(166922);
  }
elsif($signal == 8016){
   quest::depop(166923);
  }
elsif($signal == 8017){
   quest::depop(166924);
  }
elsif($signal == 8018){
   quest::depop(166925);
  }
elsif($signal == 8019){
   quest::depop(166926);
  }
elsif($signal == 8020){
   quest::depop(166927);
  }
elsif($signal == 8021){
   quest::depop(166928);
  }
elsif($signal == 8022){
   quest::depop(166929);
  }
elsif($signal == 8023){
   quest::depop(166930);
  }
elsif($signal == 8024){
   quest::depop(166931);
  }
elsif($signal == 8025){
   quest::depop(166932);
  }
elsif($signal == 8026){
   quest::depop(166933);
	}
elsif($signal == 8027){
   quest::depop(166934);
  }
elsif($signal == 8028){
   quest::depop(166935);
	}
elsif($signal == 8029){
   quest::depop(166936);
  }
elsif($signal == 8030){
   quest::depop(166937);
  }
elsif($signal == 8031){
   quest::depop(166938);
  }
elsif($signal == 8032){
   quest::depop(166939);
  }
elsif($signal == 8033){
   quest::depop(166940);
  }
elsif($signal == 8034){
   quest::depop(166941);
  }
elsif($signal == 8035){
   quest::depop(166942);
  }
elsif($signal == 8036){
   quest::depop(166943);
  }
elsif($signal == 8037){
   quest::depop(166944);
  }
elsif($signal == 8038){
   quest::depop(166945);
  }
elsif($signal == 8039){
   quest::depop(166948);
  }
elsif($signal == 8040){
   quest::depop(166949);
  }
elsif($signal == 8041){
   quest::depop(166946);
  }
elsif($signal == 8042){
   quest::depop(166947);
  }
else {
    #do nothing
 }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_south_village_timer"){
     quest::stoptimer("delay_owlbears_south_village_timer");
   quest::depop();
   }
 }  
