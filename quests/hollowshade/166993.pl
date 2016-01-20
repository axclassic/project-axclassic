##South Village Delay respawn check againstSonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 9001) {
   quest::settimer("delay_wolves_south_village_timer",180);
  }
if($signal == 9002){
   quest::depop(166);
  }
if($signal == 9003){
   quest::depop(166);
  }
if($signal == 9004){
   quest::depop(166);
	}
if($signal == 9005){
   quest::depop(166);
	}
if($signal == 9006){
   quest::depop(166);
  }
if($signal == 9007){
   quest::depop(166);
	}
if($signal == 9008){   
   quest::depop(166);
	}
if($signal == 9009){   
   quest::depop(166);
	}
if($signal == 9010){   
   quest::depop(166);
	}
if($signal == 9011){   
   quest::depop(166);
	}
if($signal == 9012){   
   quest::depop(166);
  }
if($signal == 9013){
   quest::depop(166);
  }
if($signal == 9014){
   quest::depop(166);
  }
if($signal == 9015){
   quest::depop(166);
  }
if($signal == 9016){
   quest::depop(166);
  }
if($signal == 9017){
   quest::depop(166);
  }
if($signal == 9018){
   quest::depop(166);
  }
if($signal == 9019){
   quest::depop(166);
  }
if($signal == 9020){
   quest::depop(166);
  }
if($signal == 9021){
   quest::depop(166);
  }
if($signal == 9022){
   quest::depop(166);
  }
if($signal == 9023){
   quest::depop(166);
  }
if($signal == 9024){
   quest::depop(166);
  }
if($signal == 9025){
   quest::depop(166);
  }
if($signal == 9026){
   quest::depop(166);
	}
if($signal == 9027){
   quest::depop(166);
  }
if($signal == 9028){
   quest::depop(166);
	}
if($signal == 9029){
   quest::depop(166);
  }
if($signal == 9030){
   quest::depop(166);
  }
if($signal == 9031){
   quest::depop(166);
  }
if($signal == 9032){
   quest::depop(166);
  }
if($signal == 9033){
   quest::depop(166);
  }
if($signal == 9034){
   quest::depop(166);
  }
if($signal == 9035){
   quest::depop(166);
  }
if($signal == 9036){
   quest::depop(166);
  }
if($signal == 9037){
   quest::depop(166);
  }
if($signal == 9038){
   quest::depop(166);
  }
if($signal == 9039){
   quest::depop(166);
  }
if($signal == 9040){
   quest::depop(166);
  }
if($signal == 9041){
   quest::depop(166);
  }
if($signal == 9042){
   quest::depop(166);
  }
if($signal == 9043){
   quest::depop(166);
  }
if($signal == 9044){
   quest::depop(166);
  }
if($signal == 9045){
   quest::depop(166);
  }
if($signal == 9046){
   quest::depop(166);
  }
if($signal == 9047){
   quest::depop(166);
  }
if($signal == 9048){
   quest::depop(166);
  }
if($signal == 9049){
   quest::depop(166);
  }
if($signal == 9050){
   quest::depop(166);
  }
if($signal == 9051){
   quest::depop(166);
  }
if($signal == 9052){
   quest::depop(166);
  }
if($signal == 9053){
   quest::depop(166);
  }
if($signal == 9054){
   quest::depop(166);
  }
if($signal == 9055){
   quest::depop(166);
  }
if($signal == 9056){
   quest::depop(166);
  }
if($signal == 9057){
   quest::depop(166);
  }
if($signal == 9058){
   quest::depop(166);
  }
if($signal == 9059){
   quest::depop(166);
  }
if($signal == 9060){
   quest::depop(166);
  }
if($signal == 9061){
   quest::depop(166);
  }
if($signal == 9062){
   quest::depop(166);
  }
if($signal == 9063){
   quest::depop(166);
  }
if($signal == 9064){
   quest::depop(1662);
  }
if($signal == 9065){
   quest::depop(166);
  }
if($signal == 9066){
   quest::depop(166);
  }
if($signal == 9067){
   quest::depop(166);
  }
if($signal == 9068){
   quest::depop(166);
  }
if($signal == 9069){
   quest::depop(166);
  }
if($signal == 9070){
   quest::depop(166);
  }
if($signal == 9071){
   quest::depop(166);
  }
if($signal == 9072){
   quest::depop(166);
  }
if($signal == 9073){
   quest::depop(166);
  }
if($signal == 9074){
   quest::depop(166);
  }
if($signal == 9075){
   quest::depop(166);
  }
if($signal == 9076){
   quest::depop(166);
  }
if($signal == 9077){
   quest::depop(166);
  }
if($signal == 9078){
   quest::depop(166);
  }
if($signal == 9079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_south_village_timer"){
     quest::stoptimer("delay_wolves_south_village_timer");
   quest::depop();
   }
 }  
