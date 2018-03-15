##zonecontroller.pl ID 4223 in Qeynos Hills qeytoqrg##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(4224,0,0,561.3,4254.1,13.3,169);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(4203); 
		quest::depopall(4204);
		quest::depopall(4205);
		quest::depopall(4206);
		quest::depopall(4207);
		quest::depopall(4208);
		quest::depopall(4209);
		quest::depopall(4210);
		quest::depopall(4211);
		quest::depopall(4212);
		quest::depopall(4213);
		quest::depopall(4214);
		quest::depopall(4215);
		quest::depopall(4216);
		quest::depopall(4217);
		quest::depopall(4218);
		quest::depopall(4219);
		quest::depopall(4220);
		quest::depopall(4221);
		quest::depopall(4222);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(4203,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4204,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4204,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4204,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4204,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(4205,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4206,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4206,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4206,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4206,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(4207,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4208,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4208,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4208,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4208,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(4209,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4210,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4210,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4210,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4210,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(4211,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4212,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4212,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4212,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4212,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(4213,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4214,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4214,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4214,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4214,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(4215,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4216,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4216,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4216,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4216,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(4217,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4218,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4218,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4218,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4218,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(4219,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4220,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4220,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4220,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4220,0,0,546.6,4180.5,-2.9,198.1);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(4221,0,0,542,4242.8,-1.7,165.8);
		quest::spawn2(4222,0,0,445.8,4249.1,-6.2,155.6);
		quest::spawn2(4222,0,0,496.6,4250.2,-4.2,159.6);
		quest::spawn2(4222,0,0,545.2,4207.4,0.9,183.8);
		quest::spawn2(4222,0,0,546.6,4180.5,-2.9,198.1);
		  }
   }
    else {
         $client->Message(14, "There is another Norrathian doing the Easter Event in this zone. Try back in a little while.");
       } # end EasterInProgress check
   } # end event8 check
   $event8=undef;
    $EasterInProgress=undef;
} # end EVENT_ENTER


sub EVENT_SIGNAL {
   if ($signal == 600){
     quest::depop();
    }
}
