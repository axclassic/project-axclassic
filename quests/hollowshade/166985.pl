##North Cave Delay respawn check against Owlbears##
sub EVENT_SIGNAL{
if ($signal == 1001) {
   quest::settimer("delay_owlbears_north_cave_timer",180);
  }
if($signal == 1002){
   quest::depop(166413);
  }
if($signal == 1003){
   quest::depop(166426);
  }
if($signal == 1004){
   quest::depop(166445);
	}
if($signal == 1005){
   quest::depop(166457);
	}
if($signal == 1006){
   quest::depop(166414);
  }
if($signal == 1007){
   quest::depop(166427);
	}
if($signal == 1008){   
   quest::depop(166446);
	}
if($signal == 1009){   
   quest::depop(166458);
	}
if($signal == 1010){   
   quest::depop(166415);
	}
if($signal == 1011){   
   quest::depop(166428);
	}
if($signal == 1012){   
   quest::depop(166447);
  }
if($signal == 1013){
   quest::depop(166459);
  }
if($signal == 1014){
   quest::depop(166416);
  }
if($signal == 1015){
   quest::depop(166429);
  }
if($signal == 1016){
   quest::depop(166448);
  }
if($signal == 1017){
   quest::depop(166460);
  }
if($signal == 1018){
   quest::depop(166417);
  }
if($signal == 1019){
   quest::depop(166430);
  }
if($signal == 1020){
   quest::depop(166449);
  }
if($signal == 1021){
   quest::depop(166461);
  }
if($signal == 10222){
   quest::depop(166418);
  }
if($signal == 1023){
   quest::depop(166431);
  }
if($signal == 1024){
   quest::depop(166450);
  }
if($signal == 1025){
   quest::depop(166462);
  }
if($signal == 1026){
   quest::depop(166419);
	}
if($signal == 1027){
   quest::depop(166432);
  }
if($signal == 1028){
   quest::depop(166451);
	}
if($signal == 1029){
   quest::depop(166463);
  }
if($signal == 1030){
   quest::depop(166420);
  }
if($signal == 1031){
   quest::depop(166433);
  }
if($signal == 1032){
   quest::depop(166452);
  }
if($signal == 1033){
   quest::depop(166464);
  }
if($signal == 1034){
   quest::depop(166408);
  }
if($signal == 1035){
   quest::depop(166409);
  }
if($signal == 1036){
   quest::depop(166410);
  }
if($signal == 1037){
   quest::depop(166470);
  }
if($signal == 1038){
   quest::depop(166471);
  }
if($signal == 1039){
   quest::depop(166421);
  }
if($signal == 1040){
   quest::depop(166453);
  }
if($signal == 1041){
   quest::depop(166465);
  }
if($signal == 1042){
   quest::depop(166491);
  }
if($signal == 1043){
   quest::depop(166434);
  }
if($signal == 1044){
   quest::depop(166454);
  }
if($signal == 1045){
   quest::depop(166489);
  }
if($signal == 1046){
   quest::depop(166422);
  }
if($signal == 1047){
   quest::depop(166435);
  }
if($signal == 1048){
   quest::depop(166455);
  }
if($signal == 1049){
   quest::depop(166466);
  }
if($signal == 1050){
   quest::depop(166423);
  }
if($signal == 1051){
   quest::depop(166436);
  }
if($signal == 1052){
   quest::depop(166456);
  }
if($signal == 1053){
   quest::depop(166424);
  }
if($signal == 1054){
   quest::depop(166437);
  }
if($signal == 1055){
   quest::depop(166254);
  }
if($signal == 1056){
   quest::depop(166474);
  }
if($signal == 1057){
   quest::depop(166477);
  }
if($signal == 1058){
   quest::depop(166475);
  }
if($signal == 1059){
   quest::depop(166478);
  }
if($signal == 1060){
   quest::depop(166480);
  }
if($signal == 1061){
   quest::depop(166481);
  }
if($signal == 1062){
   quest::depop(166659);
  }
if($signal == 1063){
   quest::depop(166479);
  }
if($signal == 1064){
   quest::depop(166467);
  }
if($signal == 1065){
   quest::depop(166589);
  }
if($signal == 1066){
   quest::depop(166425);
  }
if($signal == 1067){
   quest::depop(166438);
  }
if($signal == 1068){
   quest::depop(166492);
  }
if($signal == 1069){
   quest::depop(166493);
  }
if($signal == 1070){
   quest::depop(166411);
  }
if($signal == 1071){
   quest::depop(166439);
  }
if($signal == 1072){
   quest::depop(166440);
  }
if($signal == 1073){
   quest::depop(166441);
  }
if($signal == 1074){
   quest::depop(166442);
  }
if($signal == 1075){
   quest::depop(166443);
  }
if($signal == 1076){
   quest::depop(166444);
  }
if($signal == 1077){
   quest::depop(166468);
  }
if($signal == 1078){
   quest::depop(166469);
  }
if($signal == 1079){
   quest::depop(166412);
  }
}
 sub EVENT_TIMER{
 if($timer eq "delay_owlbears_north_cave_timer"){
     quest::stoptimer("delay_owlbears_north_cave_timer");
   quest::depop();
   }
 }  
