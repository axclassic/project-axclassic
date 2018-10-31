##Death_Controller 14235##
sub EVENT_SPAWN {
      if((defined $event9) && ($event9 == 1)) {
       quest::spawn2(14194,110,0,633,485,-1.9,69.1);    ##Spawns Corny Scarecrow for Thanksgiving Event
   }
   }
sub EVENT_SIGNAL {
    if($signal == 743) { ##signal that player died##
    quest::depopall(14197);	
	quest::depop(14196);
	}
	elsif($signal == 744) { ##signal that player died##
    quest::depopall(14199);	
	quest::depop(14198);
	}
	elsif($signal == 745) { ##signal that player died##
    quest::depopall(14201);	
	quest::depop(14200);
	}
	elsif($signal == 746) { ##signal that player died##
    quest::depopall(14203);	
	quest::depop(14202);
	}
	elsif($signal == 747) { ##signal that player died##
    quest::depopall(14205);	
	quest::depop(14204);
	}
	elsif($signal == 748) { ##signal that player died##
    quest::depopall(14207);	
	quest::depop(14206);
	}
	elsif($signal == 749) { ##signal that player died##
    quest::depopall(14209);	
	quest::depop(14208);
	}
	elsif($signal == 750) { ##signal that player died##
    quest::depopall(14211);	
	quest::depop(14210);
	}
	elsif($signal == 751) { ##signal that player died##
    quest::depopall(14213);	
	quest::depop(14212);
	}
	elsif($signal == 752) { ##signal that player died##
    quest::depopall(14215);	
	quest::depop(14214);
	}
	elsif($signal == 753) { ##signal that player died##
    quest::depopall(14217);	
	quest::depop(14216);
	}
	elsif($signal == 754) { ##signal that player died##
    quest::depopall(14219);	
	quest::depop(14218);
	}
    elsif($signal == 755) { ##signal that player died##
    quest::depopall(14221);	
	quest::depop(14220);
	}
	elsif($signal == 756) { ##signal that Corny Scarecrow has reached end of path and needs to be respawned##
    quest::spawn2(14194,110,0,633,4
	}
	else{
	#Do Nothing;
	}
  }	