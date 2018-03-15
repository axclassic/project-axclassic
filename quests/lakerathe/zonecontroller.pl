##zonecontroller.pl ID 51175 in Lake Rathetear##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(57167,0,0,-1351.4,3517.2,33.4,95.6);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(51155); 
		quest::depopall(51156);
		quest::depopall(51157);
		quest::depopall(51158);
		quest::depopall(51159);
		quest::depopall(51160);
		quest::depopall(51161);
		quest::depopall(51162);
		quest::depopall(51163);
		quest::depopall(51164);
		quest::depopall(51165);
		quest::depopall(51166);
		quest::depopall(51167);
		quest::depopall(51168);
		quest::depopall(51169);
		quest::depopall(51170);
		quest::depopall(51171);
		quest::depopall(51172);
		quest::depopall(51173);
		quest::depopall(51174);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(51155,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51156,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51156,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51156,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51156,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(51157,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51158,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51158,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51158,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51158,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(51159,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51160,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51160,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51160,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51160,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(51161,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51162,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51162,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51162,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51162,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(51163,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51164,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51164,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(5116,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51164,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(51165,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51166,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51166,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51166,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51166,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(51167,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51168,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51168,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51168,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51168,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(51169,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51170,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51170,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51170,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51170,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(51171,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51172,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51172,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51172,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51172,0,0,-1289.1,3476,-2.2,100.1);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(51173,0,0,-1339.1,3509.3,11.7,104.4);
		quest::spawn2(51174,0,0,-1328.8,3452.8,-3.3,95.8);
		quest::spawn2(51174,0,0,-1343,3485.6,6.3,88.5);
		quest::spawn2(51174,0,0,-1301.4,3508.4,6.2,115.1);
		quest::spawn2(51174,0,0,-1289.1,3476,-2.2,100.1);
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