##East Cave Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 5001) {
   quest::settimer("delay_owlbears_east_cave_timer",300);
  }
if($signal == 5002){
   quest::depop(166720);
  }
if($signal == 5003){
   quest::depop(166791);
  }
if($signal == 5004){
   quest::depop(166670);
	}
if($signal == 5005){
   quest::depop(166671);
	}
if($signal == 5006){
   quest::depop(166672);
  }
if($signal == 5007){
   quest::depop(166673);
	}
if($signal == 5008){   
   quest::depop(166674);
	}
if($signal == 5009){   
   quest::depop(166675);
	}
if($signal == 5010){   
   quest::depop(166676);
	}
if($signal == 5011){   
   quest::depop(166678);
	}
if($signal == 5012){   
   quest::depop(166679);
  }
if($signal == 5013){
   quest::depop(166680);
  }
if($signal == 5014){
   quest::depop(166681);
  }
if($signal == 5015){
   quest::depop(166682);
  }
if($signal == 5016){
   quest::depop(166683);
  }
if($signal == 5017){
   quest::depop(166684);
  }
if($signal == 5018){
   quest::depop(166685);
  }
if($signal == 5019){
   quest::depop(166686);
  }
if($signal == 5020){
   quest::depop(166687);
  }
if($signal == 5021){
   quest::depop(166688);
  }
if($signal == 5022){
   quest::depop(166689);
  }
if($signal == 5023){
   quest::depop(166690);
  }
if($signal == 5024){
   quest::depop(166691);
  }
if($signal == 5025){
   quest::depop(166692);
  }
if($signal == 5026){
   quest::depop(166693);
	}
if($signal == 5027){
   quest::depop(166694);
  }
if($signal == 5028){
   quest::depop(166695);
	}
if($signal == 5029){
   quest::depop(166696);
  }
if($signal == 5030){
   quest::depop(166697);
  }
if($signal == 5031){
   quest::depop(166698);
  }
if($signal == 5032){
   quest::depop(166699);
  }
if($signal == 5033){
   quest::depop(166700);
  }
if($signal == 5034){
   quest::depop(166701);
  }
if($signal == 5035){
   quest::depop(166702);
  }
if($signal == 5036){
   quest::depop(166703);
  }
if($signal == 5037){
   quest::depop(166704);
  }
if($signal == 5038){
   quest::depop(166705);
  }
if($signal == 5039){
   quest::depop(166706);
  }
if($signal == 5040){
   quest::depop(166707);
  }
if($signal == 5041){
   quest::depop(166708);
  }
if($signal == 5042){
   quest::depop(166709);
  }
if($signal == 5043){
   quest::depop(166710);
  }
if($signal == 5044){
   quest::depop(166711);
  }
if($signal == 5045){
   quest::depop(166712);
  }
if($signal == 5046){
   quest::depop(166713);
  }
if($signal == 5047){
   quest::depop(166714);
  }
if($signal == 5048){
   quest::depop(166715);
  }
if($signal == 5049){
   quest::depop(166716);
  }
if($signal == 5050){
   quest::depop(166717);
  }
if($signal == 5051){
   quest::depop(166718);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_east_cave_timer"){
     quest::stoptimer("delay_owlbears_east_cave_timer");
   quest::depop();
   }
 }  
