##East Cave Delay respawn check against Grimlings##
sub EVENT_SIGNAL{
if ($signal == 6001) {
   quest::settimer("delay_grimlings_east_cave_timer",180);
  }
if($signal == 6002){
   quest::depop(166);
  }
if($signal == 6003){
   quest::depop(166);
  }
if($signal == 6004){
   quest::depop(166);
	}
if($signal == 6005){
   quest::depop(166);
	}
if($signal == 6006){
   quest::depop(166);
  }
if($signal == 6007){
   quest::depop(166);
	}
if($signal == 6008){   
   quest::depop(166);
	}
if($signal == 6009){   
   quest::depop(166);
	}
if($signal == 3010){   
   quest::depop(166);
	}
if($signal == 6011){   
   quest::depop(166);
	}
if($signal == 6012){   
   quest::depop(166);
  }
if($signal == 6013){
   quest::depop(166);
  }
if($signal == 6014){
   quest::depop(166);
  }
if($signal == 6015){
   quest::depop(166);
  }
if($signal == 6016){
   quest::depop(166);
  }
if($signal == 6017){
   quest::depop(166);
  }
if($signal == 6018){
   quest::depop(166);
  }
if($signal == 6019){
   quest::depop(166);
  }
if($signal == 6020){
   quest::depop(166);
  }
if($signal == 6021){
   quest::depop(166);
  }
if($signal == 6022){
   quest::depop(166);
  }
if($signal == 6023){
   quest::depop(166);
  }
if($signal == 6024){
   quest::depop(166);
  }
if($signal == 6025){
   quest::depop(166);
  }
if($signal == 6026){
   quest::depop(166);
	}
if($signal == 6027){
   quest::depop(166);
  }
if($signal == 6028){
   quest::depop(166);
	}
if($signal == 6029){
   quest::depop(166);
  }
if($signal == 6030){
   quest::depop(166);
  }
if($signal == 6031){
   quest::depop(166);
  }
if($signal == 6032){
   quest::depop(166);
  }
if($signal == 6033){
   quest::depop(166);
  }
if($signal == 6034){
   quest::depop(166);
  }
if($signal == 6035){
   quest::depop(166);
  }
if($signal == 6036){
   quest::depop(166);
  }
if($signal == 6037){
   quest::depop(166);
  }
if($signal == 6038){
   quest::depop(166);
  }
if($signal == 6039){
   quest::depop(166);
  }
if($signal == 6040){
   quest::depop(166);
  }
if($signal == 6041){
   quest::depop(166);
  }
if($signal == 6042){
   quest::depop(166);
  }
if($signal == 6043){
   quest::depop(166);
  }
if($signal == 6044){
   quest::depop(166);
  }
if($signal == 6045){
   quest::depop(166);
  }
if($signal == 6046){
   quest::depop(166);
  }
if($signal == 6047){
   quest::depop(166);
  }
if($signal == 6048){
   quest::depop(166);
  }
if($signal == 6049){
   quest::depop(166);
  }
if($signal == 6050){
   quest::depop(166);
  }
if($signal == 6051){
   quest::depop(166);
  }
if($signal == 6052){
   quest::depop(166);
  }
if($signal == 6053){
   quest::depop(166);
  }
if($signal == 6054){
   quest::depop(166);
  }
if($signal == 6055){
   quest::depop(166);
  }
if($signal == 6056){
   quest::depop(166);
  }
if($signal == 6057){
   quest::depop(166);
  }
if($signal == 6058){
   quest::depop(166);
  }
if($signal == 6059){
   quest::depop(166);
  }
if($signal == 6060){
   quest::depop(166);
  }
if($signal == 6061){
   quest::depop(166);
  }
if($signal == 6062){
   quest::depop(166);
  }
if($signal == 6063){
   quest::depop(166);
  }
if($signal == 6064){
   quest::depop(1662);
  }
if($signal == 6065){
   quest::depop(166);
  }
if($signal == 6066){
   quest::depop(166);
  }
if($signal == 6067){
   quest::depop(166);
  }
if($signal == 6068){
   quest::depop(166);
  }
if($signal == 6069){
   quest::depop(166);
  }
if($signal == 6070){
   quest::depop(166);
  }
if($signal == 6071){
   quest::depop(166);
  }
if($signal == 6072){
   quest::depop(166);
  }
if($signal == 6073){
   quest::depop(166);
  }
if($signal == 6074){
   quest::depop(166);
  }
if($signal == 6075){
   quest::depop(166);
  }
if($signal == 6076){
   quest::depop(166);
  }
if($signal == 6077){
   quest::depop(166);
  }
if($signal == 6078){
   quest::depop(166);
  }
if($signal == 6079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_grimlings_east_cave_timer"){
     quest::stoptimer("delay_grimlings_east_cave_timer");
   quest::depop();
   }
 }  
