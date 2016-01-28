##South Village Delay respawn check against Grimlings##
sub EVENT_SIGNAL{
if ($signal == 7001) {
   quest::settimer("delay_grimlings_south_village_timer",300);
  }
elsif($signal == 7002){
   quest::depop(166177);
  }
elsif($signal == 7003){
   quest::depop(166777);
  }
elsif($signal == 7004){
   quest::depop(166829);
	}
elsif($signal == 7005){
   quest::depop(166830);
	}
elsif($signal == 7006){
   quest::depop(166831);
  }
elsif($signal == 7007){
   quest::depop(166832);
	}
elsif($signal == 7008){   
   quest::depop(166833);
	}
elsif($signal == 7009){   
   quest::depop(166834);
	}
elsif($signal == 7010){   
   quest::depop(166835);
	}
elsif($signal == 7011){   
   quest::depop(166836);
	}
elsif($signal == 7012){   
   quest::depop(166837);
  }
elsif($signal == 7013){
   quest::depop(166838);
  }
elsif($signal == 7014){
   quest::depop(166839);
  }
elsif($signal == 7015){
   quest::depop(166840);
  }
elsif($signal == 7016){
   quest::depop(166841);
  }
elsif($signal == 7017){
   quest::depop(166842);
  }
elsif($signal == 7018){
   quest::depop(166843);
  }
elsif($signal == 7019){
   quest::depop(166844);
  }
elsif($signal == 7020){
   quest::depop(166845);
  }
elsif($signal == 7021){
   quest::depop(166846);
  }
elsif($signal == 7022){
   quest::depop(166847);
  }
elsif($signal == 7023){
   quest::depop(166848);
  }
elsif($signal == 7024){
   quest::depop(166849);
  }
elsif($signal == 7025){
   quest::depop(166850);
  }
elsif($signal == 7026){
   quest::depop(166851);
	}
elsif($signal == 7027){
   quest::depop(166852);
  }
elsif($signal == 7028){
   quest::depop(166853);
	}
elsif($signal == 7029){
   quest::depop(166854);
  }
elsif($signal == 7030){
   quest::depop(166855);
  }
elsif($signal == 7031){
   quest::depop(166856);
  }
elsif($signal == 7032){
   quest::depop(166857);
  }
elsif($signal == 7033){
   quest::depop(166858);
  }
elsif($signal == 7034){
   quest::depop(166859);
  }
elsif($signal == 7035){
   quest::depop(166860);
  }
elsif($signal == 7036){
   quest::depop(166861);
  }
elsif($signal == 7037){
   quest::depop(166862);
  }
elsif($signal == 7038){
   quest::depop(166863);
  }
elsif($signal == 7039){
   quest::depop(166864);
  }
elsif($signal == 7040){
   quest::depop(166865);
  }
elsif($signal == 7041){
   quest::depop(166175);
  }
elsif($signal == 7042){
   quest::depop(166170);
  }
elsif($signal == 3043){
   quest::depop(166210);
  }
elsif($signal == 7044){
   quest::depop(166209);
  }
else {
    #do nothing
 }
}
 sub EVENT_TIMER{
 if($timer eq "delay_grimlings_south_village_timer"){
     quest::stoptimer("delay_grimlings_south_village_timer");
   quest::depop();
   }
 }  
