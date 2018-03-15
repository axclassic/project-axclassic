##zonecontroller.pl ID 30190 in Everfrost##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(30155,0,0,578.1,3213.4,-63.1,35.1); ##Peter Cottontail
		quest::unique_spawn(30191,0,0,1128.9,553.9,-54,146.3);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(30170); 
		quest::depopall(30171);
		quest::depopall(30172);
		quest::depopall(30173);
		quest::depopall(30174);
		quest::depopall(30175);
		quest::depopall(30176);
		quest::depopall(30177);
		quest::depopall(30178);
		quest::depopall(30179);
		quest::depopall(30180);
		quest::depopall(30181);
		quest::depopall(30182);
		quest::depopall(30183);
		quest::depopall(30184);
		quest::depopall(30185);
		quest::depopall(30186);
		quest::depopall(30187);
		quest::depopall(30188);
		quest::depopall(30189);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(30170,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30171,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30171,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30171,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30171,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(30172,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30173,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30173,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30173,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30173,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(30174,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30175,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30175,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30175,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30175,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(30176,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30177,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30177,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30177,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30177,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(30178,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30179,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30179,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30179,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30179,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(30180,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30181,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30181,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30181,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30181,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(30182,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30183,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30183,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30183,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30183,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(30184,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30185,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30185,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30185,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30185,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(30186,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30187,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30187,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30187,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30187,0,0,1116.1,502.9,-62.9,159.4);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(30188,0,0,1075.9,545.5,-53.2,134.3);
		quest::spawn2(30189,0,0,1021.6,536.7,-51.8,145.6);
		quest::spawn2(30189,0,0,1027.9,467,-62.9,151.8);
		quest::spawn2(30189,0,0,1066,450.7,-62.9,152.8);
		quest::spawn2(30189,0,0,1116.1,502.9,-62.9,159.4);
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
