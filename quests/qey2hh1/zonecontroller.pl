##zonecontroller.pl ID 12215 in West Karana qey2hh1##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(12216,0,0,-1502.2,576.1,-1.2,174.1);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(12195); 
		quest::depopall(12196);
		quest::depopall(12197);
		quest::depopall(12198);
		quest::depopall(12199);
		quest::depopall(12200);
		quest::depopall(12201);
		quest::depopall(12202);
		quest::depopall(12203);
		quest::depopall(12204);
		quest::depopall(12205);
		quest::depopall(12206);
		quest::depopall(12207);
		quest::depopall(12208);
		quest::depopall(12209);
		quest::depopall(12210);
		quest::depopall(12211);
		quest::depopall(12212);
		quest::depopall(12213);
		quest::depopall(12214);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(12195,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12196,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12196,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12196,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12196,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(12197,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12198,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12198,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12198,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12198,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(12199,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12200,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12200,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12200,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12200,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(12201,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12202,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12202,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12202,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12202,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(12203,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12204,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12204,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12204,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12204,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(12205,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12206,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12206,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12206,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12206,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(12207,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12208,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12208,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12208,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12208,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(12209,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12210,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12210,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12210,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12210,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(12211,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12212,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12212,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12212,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12212,0,0,-1567,567.1,-11.3,178.4);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(12213,0,0,-1528.4,564.9,-11.1,183.8);
		quest::spawn2(12214,0,0,-1502.2,542.9,-9,172.1);
		quest::spawn2(12214,0,0,-1532,531.9,-8,158.4);
		quest::spawn2(12214,0,0,-1554.3,594.9,-14,156);
		quest::spawn2(12214,0,0,-1567,567.1,-11.3,178.4);
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