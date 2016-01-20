##East Cave Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 5001) {
   quest::settimer("delay_owlbears_east_cave_timer",180);
  }
if($signal == 5002){
   quest::depop(166);
  }
if($signal == 5003){
   quest::depop(166);
  }
if($signal == 5004){
   quest::depop(166);
	}
if($signal == 5005){
   quest::depop(166);
	}
if($signal == 5006){
   quest::depop(166);
  }
if($signal == 5007){
   quest::depop(166);
	}
if($signal == 5008){   
   quest::depop(166);
	}
if($signal == 5009){   
   quest::depop(166);
	}
if($signal == 5010){   
   quest::depop(166);
	}
if($signal == 5011){   
   quest::depop(166);
	}
if($signal == 5012){   
   quest::depop(166);
  }
if($signal == 5013){
   quest::depop(166);
  }
if($signal == 5014){
   quest::depop(166);
  }
if($signal == 5015){
   quest::depop(166);
  }
if($signal == 5016){
   quest::depop(166);
  }
if($signal == 5017){
   quest::depop(166);
  }
if($signal == 5018){
   quest::depop(166);
  }
if($signal == 5019){
   quest::depop(166);
  }
if($signal == 5020){
   quest::depop(166);
  }
if($signal == 5021){
   quest::depop(166);
  }
if($signal == 5022){
   quest::depop(166);
  }
if($signal == 5023){
   quest::depop(166);
  }
if($signal == 5024){
   quest::depop(166);
  }
if($signal == 5025){
   quest::depop(166);
  }
if($signal == 5026){
   quest::depop(166);
	}
if($signal == 5027){
   quest::depop(166);
  }
if($signal == 5028){
   quest::depop(166);
	}
if($signal == 5029){
   quest::depop(166);
  }
if($signal == 5030){
   quest::depop(166);
  }
if($signal == 5031){
   quest::depop(166);
  }
if($signal == 5032){
   quest::depop(166);
  }
if($signal == 5033){
   quest::depop(166);
  }
if($signal == 5034){
   quest::depop(166);
  }
if($signal == 5035){
   quest::depop(166);
  }
if($signal == 5036){
   quest::depop(166);
  }
if($signal == 5037){
   quest::depop(166);
  }
if($signal == 5038){
   quest::depop(166);
  }
if($signal == 5039){
   quest::depop(166);
  }
if($signal == 5040){
   quest::depop(166);
  }
if($signal == 5041){
   quest::depop(166);
  }
if($signal == 5042){
   quest::depop(166);
  }
if($signal == 5043){
   quest::depop(166);
  }
if($signal == 5044){
   quest::depop(166);
  }
if($signal == 5045){
   quest::depop(166);
  }
if($signal == 5046){
   quest::depop(166);
  }
if($signal == 5047){
   quest::depop(166);
  }
if($signal == 5048){
   quest::depop(166);
  }
if($signal == 5049){
   quest::depop(166);
  }
if($signal == 5050){
   quest::depop(166);
  }
if($signal == 5051){
   quest::depop(166);
  }
if($signal == 5052){
   quest::depop(166);
  }
if($signal == 5053){
   quest::depop(166);
  }
if($signal == 5054){
   quest::depop(166);
  }
if($signal == 5055){
   quest::depop(166);
  }
if($signal == 5056){
   quest::depop(166);
  }
if($signal == 5057){
   quest::depop(166);
  }
if($signal == 5058){
   quest::depop(166);
  }
if($signal == 5059){
   quest::depop(166);
  }
if($signal == 5060){
   quest::depop(166);
  }
if($signal == 5061){
   quest::depop(166);
  }
if($signal == 5062){
   quest::depop(166);
  }
if($signal == 5063){
   quest::depop(166);
  }
if($signal == 5064){
   quest::depop(1662);
  }
if($signal == 5065){
   quest::depop(166);
  }
if($signal == 5066){
   quest::depop(166);
  }
if($signal == 5067){
   quest::depop(166);
  }
if($signal == 5068){
   quest::depop(166);
  }
if($signal == 5069){
   quest::depop(166);
  }
if($signal == 5070){
   quest::depop(166);
  }
if($signal == 5071){
   quest::depop(166);
  }
if($signal == 5072){
   quest::depop(166);
  }
if($signal == 5073){
   quest::depop(166);
  }
if($signal == 5074){
   quest::depop(166);
  }
if($signal == 5075){
   quest::depop(166);
  }
if($signal == 5076){
   quest::depop(166);
  }
if($signal == 5077){
   quest::depop(166);
  }
if($signal == 5078){
   quest::depop(166);
  }
if($signal == 5079){
   quest::depop(166);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_east_cave_timer"){
     quest::stoptimer("delay_owlbears_east_cave_timer");
   quest::depop();
   }
 }  
