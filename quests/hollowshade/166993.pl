##South Village Delay respawn check againstSonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 9001) {
   quest::settimer("delay_wolves_south_village_timer",300);
  }
if($signal == 9002){
   quest::depop(166870);
  }
if($signal == 9003){
   quest::depop(166784);
  }
if($signal == 9004){
   quest::depop(166871);
	}
if($signal == 9005){
   quest::depop(166872);
	}
if($signal == 9006){
   quest::depop(166873);
  }
if($signal == 9007){
   quest::depop(166953);
	}
if($signal == 9008){   
   quest::depop(166875);
	}
if($signal == 9009){   
   quest::depop(166876);
	}
if($signal == 9010){   
   quest::depop(166877);
	}
if($signal == 9011){   
   quest::depop(166878);
	}
if($signal == 9012){   
   quest::depop(166879);
  }
if($signal == 9013){
   quest::depop(166880);
  }
if($signal == 9014){
   quest::depop(166881);
  }
if($signal == 9015){
   quest::depop(166882);
  }
if($signal == 9016){
   quest::depop(166883);
  }
if($signal == 9017){
   quest::depop(166884);
  }
if($signal == 9018){
   quest::depop(166885);
  }
if($signal == 9019){
   quest::depop(166886);
  }
if($signal == 9020){
   quest::depop(166887);
  }
if($signal == 9021){
   quest::depop(166888);
  }
if($signal == 9022){
   quest::depop(166889);
  }
if($signal == 9023){
   quest::depop(166890);
  }
if($signal == 9024){
   quest::depop(166891);
  }
if($signal == 9025){
   quest::depop(166892);
  }
if($signal == 9026){
   quest::depop(166893);
	}
if($signal == 9027){
   quest::depop(166894);
  }
if($signal == 9028){
   quest::depop(166895);
	}
if($signal == 9029){
   quest::depop(166896);
  }
if($signal == 9030){
   quest::depop(166897);
  }
if($signal == 9031){
   quest::depop(166898);
  }
if($signal == 9032){
   quest::depop(166899);
  }
if($signal == 9033){
   quest::depop(166900);
  }
if($signal == 9034){
   quest::depop(166901);
  }
if($signal == 9035){
   quest::depop(166902);
  }
if($signal == 9036){
   quest::depop(166903);
  }
if($signal == 9037){
   quest::depop(166904);
  }
if($signal == 9038){
   quest::depop(166905);
  }
if($signal == 9039){
   quest::depop(166906);
  }
if($signal == 9040){
   quest::depop(166907);
  }
if($signal == 9041){
   quest::depop(166147);
  }
if($signal == 9042){
   quest::depop(166157);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_south_village_timer"){
     quest::stoptimer("delay_wolves_south_village_timer");
   quest::depop();
   }
 }  
