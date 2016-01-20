##East Cave Delay respawn check against Grimlings##
sub EVENT_SIGNAL{
if ($signal == 6001) {
   quest::settimer("delay_grimlings_east_cave_timer",180);
  }
if($signal == 6002){
   quest::depop(166233);
  }
if($signal == 6003){
   quest::depop(166601);
  }
if($signal == 6004){
   quest::depop(166600);
	}
if($signal == 6005){
   quest::depop(166509);
	}
if($signal == 6006){
   quest::depop(166734);
  }
if($signal == 6007){
   quest::depop(166496);
	}
if($signal == 6008){   
   quest::depop(166735);
	}
if($signal == 6009){   
   quest::depop(166510);
	}
if($signal == 3010){   
   quest::depop(166736);
	}
if($signal == 6011){   
   quest::depop(166497);
	}
if($signal == 6012){   
   quest::depop(166737);
  }
if($signal == 6013){
   quest::depop(166738);
  }
if($signal == 6014){
   quest::depop(166739);
  }
if($signal == 6015){
   quest::depop(166740);
  }
if($signal == 6016){
   quest::depop(166512);
  }
if($signal == 6017){
   quest::depop(166531);
  }
if($signal == 6018){
   quest::depop(166743);
  }
if($signal == 6019){
   quest::depop(166744);
  }
if($signal == 6020){
   quest::depop(166745);
  }
if($signal == 6021){
   quest::depop(166746);
  }
if($signal == 6022){
   quest::depop(166500);
  }
if($signal == 6023){
   quest::depop(166747);
  }
if($signal == 6024){
   quest::depop(166534);
  }
if($signal == 6025){
   quest::depop(166748);
  }
if($signal == 6026){
   quest::depop(166749);
	}
if($signal == 6027){
   quest::depop(166750);
  }
if($signal == 6028){
   quest::depop(166751);
	}
if($signal == 6029){
   quest::depop(166752);
  }
if($signal == 6030){
   quest::depop(166753);
  }
if($signal == 6031){
   quest::depop(166754);
  }
if($signal == 6032){
   quest::depop(166728);
  }
if($signal == 6033){
   quest::depop(166729);
  }
if($signal == 6034){
   quest::depop(166755);
  }
if($signal == 6035){
   quest::depop(166730);
  }
if($signal == 6036){
   quest::depop(166731);
  }
if($signal == 6037){
   quest::depop(166732);
  }
if($signal == 6038){
   quest::depop(166756);
  }
if($signal == 6039){
   quest::depop(166757);
  }
if($signal == 6040){
   quest::depop(166758);
  }
if($signal == 6041){
   quest::depop(166733);
  }
if($signal == 6042){
   quest::depop(166759);
  }
if($signal == 6043){
   quest::depop(166760);
  }
if($signal == 6044){
   quest::depop(166761);
  }
if($signal == 6045){
   quest::depop(166762);
  }
if($signal == 6046){
   quest::depop(166763);
  }
if($signal == 6047){
   quest::depop(166764);
  }
if($signal == 6048){
   quest::depop(166765);
  }
if($signal == 6049){
   quest::depop(166767);
  }
if($signal == 6050){
   quest::depop(166521);
  }
if($signal == 6051){
   quest::depop(166768);
  }
if($signal == 6052){
   quest::depop(166769);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_grimlings_east_cave_timer"){
     quest::stoptimer("delay_grimlings_east_cave_timer");
   quest::depop();
   }
 }  
