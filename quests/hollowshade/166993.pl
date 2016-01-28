##South Village Delay respawn check againstSonic Wolves##
sub EVENT_SIGNAL{
if ($signal == 9001) {
   quest::settimer("delay_wolves_south_village_timer",300);
  }
elsif($signal == 9002){
   quest::depop(166870);
  }
elsif($signal == 9003){
   quest::depop(166784);
  }
elsif($signal == 9004){
   quest::depop(166871);
	}
elsif($signal == 9005){
   quest::depop(166872);
	}
elsif($signal == 9006){
   quest::depop(166873);
  }
elsif($signal == 9007){
   quest::depop(166953);
	}
elsif($signal == 9008){   
   quest::depop(166875);
	}
elsif($signal == 9009){   
   quest::depop(166876);
	}
if($signal == 9010){   
   quest::depop(166877);
	}
elsif($signal == 9011){   
   quest::depop(166878);
	}
elsif($signal == 9012){   
   quest::depop(166879);
  }
elsif($signal == 9013){
   quest::depop(166880);
  }
elsif($signal == 9014){
   quest::depop(166881);
  }
elsif($signal == 9015){
   quest::depop(166882);
  }
elsif($signal == 9016){
   quest::depop(166883);
  }
elsif($signal == 9017){
   quest::depop(166884);
  }
elsif($signal == 9018){
   quest::depop(166885);
  }
elsif($signal == 9019){
   quest::depop(166886);
  }
elsif($signal == 9020){
   quest::depop(166887);
  }
elsif($signal == 9021){
   quest::depop(166888);
  }
elsif($signal == 9022){
   quest::depop(166889);
  }
elsif($signal == 9023){
   quest::depop(166890);
  }
elsif($signal == 9024){
   quest::depop(166891);
  }
elsif($signal == 9025){
   quest::depop(166892);
  }
elsif($signal == 9026){
   quest::depop(166893);
	}
elsif($signal == 9027){
   quest::depop(166894);
  }
elsif($signal == 9028){
   quest::depop(166895);
	}
elsif($signal == 9029){
   quest::depop(166896);
  }
elsif($signal == 9030){
   quest::depop(166897);
  }
elsif($signal == 9031){
   quest::depop(166898);
  }
elsif($signal == 9032){
   quest::depop(166899);
  }
elsif($signal == 9033){
   quest::depop(166900);
  }
elsif($signal == 9034){
   quest::depop(166901);
  }
elsif($signal == 9035){
   quest::depop(166902);
  }
elsif($signal == 9036){
   quest::depop(166903);
  }
elsif($signal == 9037){
   quest::depop(166904);
  }
elsif($signal == 9038){
   quest::depop(166905);
  }
elsif($signal == 9039){
   quest::depop(166906);
  }
elsif($signal == 9040){
   quest::depop(166907);
  }
elsif($signal == 9041){
   quest::depop(166147);
  }
elsif($signal == 9042){
   quest::depop(166157);
  }
else {
    #do nothing
 }
}
 sub EVENT_TIMER{
 if($timer eq "delay_wolves_south_village_timer"){
     quest::stoptimer("delay_wolves_south_village_timer");
   quest::depop();
   }
 }  
