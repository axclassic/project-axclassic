##South Village Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 8001) {
   quest::settimer("delay_owlbears_south_village_timer",180);
  }
if($signal == 8002){
   quest::depop(166);
  }
if($signal == 8003){
   quest::depop(166);
  }
if($signal == 8004){
   quest::depop(166);
	}
if($signal == 8005){
   quest::depop(166);
	}
if($signal == 8006){
   quest::depop(166);
  }
if($signal == 8007){
   quest::depop(166);
	}
if($signal == 8008){   
   quest::depop(166);
	}
if($signal == 8009){   
   quest::depop(166);
	}
if($signal == 8010){   
   quest::depop(166);
	}
if($signal == 8011){   
   quest::depop(166);
	}
if($signal == 8012){   
   quest::depop(166);
  }
if($signal == 8013){
   quest::depop(166);
  }
if($signal == 8014){
   quest::depop(166);
  }
if($signal == 8015){
   quest::depop(166);
  }
if($signal == 8016){
   quest::depop(166);
  }
if($signal == 8017){
   quest::depop(166);
  }
if($signal == 8018){
   quest::depop(166);
  }
if($signal == 8019){
   quest::depop(166);
  }
if($signal == 8020){
   quest::depop(166);
  }
if($signal == 8021){
   quest::depop(166);
  }
if($signal == 8022){
   quest::depop(166);
  }
if($signal == 8023){
   quest::depop(166);
  }
if($signal == 8024){
   quest::depop(166);
  }
if($signal == 8025){
   quest::depop(166);
  }
if($signal == 8026){
   quest::depop(166);
	}
if($signal == 8027){
   quest::depop(166);
  }
if($signal == 8028){
   quest::depop(166);
	}
if($signal == 8029){
   quest::depop(166);
  }
if($signal == 8030){
   quest::depop(166);
  }
if($signal == 8031){
   quest::depop(166);
  }
if($signal == 8032){
   quest::depop(166);
  }
if($signal == 8033){
   quest::depop(166);
  }
if($signal == 8034){
   quest::depop(166);
  }
if($signal == 8035){
   quest::depop(166);
  }
if($signal == 8036){
   quest::depop(166);
  }
if($signal == 8037){
   quest::depop(166);
  }
if($signal == 8038){
   quest::depop(166);
  }
if($signal == 8039){
   quest::depop(166);
  }
if($signal == 8040){
   quest::depop(166);
  }
if($signal == 8041){
   quest::depop(166);
  }
if($signal == 8042){
   quest::depop(166);
  }
if($signal == 8043){
   quest::depop(166);
  }
if($signal == 8044){
   quest::depop(166);
  }
if($signal == 8045){
   quest::depop(166);
  }
if($signal == 8046){
   quest::depop(166);
  }
if($signal == 8047){
   quest::depop(166);
  }
if($signal == 8048){
   quest::depop(166);
  }
if($signal == 8049){
   quest::depop(166);
  }
if($signal == 8050){
   quest::depop(166);
  }
if($signal == 8051){
   quest::depop(166);
  }
if($signal == 8052){
   quest::depop(166);
  }
if($signal == 8053){
   quest::depop(166);
  }
if($signal == 8054){
   quest::depop(166);
  }
if($signal == 8055){
   quest::depop(166);
  }
if($signal == 8056){
   quest::depop(166);
  }
if($signal == 8057){
   quest::depop(166);
  }
if($signal == 8058){
   quest::depop(166);
  }
if($signal == 8059){
   quest::depop(166);
  }
if($signal == 8060){
   quest::depop(166);
  }
if($signal == 8061){
   quest::depop(166);
  }
if($signal == 8062){
   quest::depop(166);
  }
if($signal == 8063){
   quest::depop(166);
  }
if($signal == 8064){
   quest::depop(1662);
  }
if($signal == 8065){
   quest::depop(166);
  }
if($signal == 8066){
   quest::depop(166);
  }
if($signal == 8067){
   quest::depop(166);
  }
if($signal == 8068){
   quest::depop(166);
  }
if($signal == 8069){
   quest::depop(166);
  }
if($signal == 8070){
   quest::depop(166);
  }
if($signal == 8071){
   quest::depop(166);
  }
if($signal == 8072){
   quest::depop(166);
  }
if($signal == 8073){
   quest::depop(166);
  }
if($signal == 8074){
   quest::depop(166);
  }
if($signal == 8075){
   quest::depop(166);
  }
if($signal == 8076){
   quest::depop(166);
  }
if($signal == 8077){
   quest::depop(166);
  }
if($signal == 8078){
   quest::depop(166);
  }
if($signal == 8079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_south_village_timer"){
     quest::stoptimer("delay_owlbears_south_village_timer");
   quest::depop();
   }
 }  
