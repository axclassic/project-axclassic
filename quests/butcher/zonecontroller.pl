##zonecontroller.pl ID 68347 in Butcherblock##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(68326,0,0,-329.1,2909.8,-2.2,122.4); ##Peter Cottontail
		quest::unique_spawn(68348, 0, 0, 1916.2,1717,21,177.4);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
   if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(68327); 
	    quest::depopall(68328);
	    quest::depopall(68329);
	    quest::depopall(68330);
	    quest::depopall(68331);
	    quest::depopall(68332);
	    quest::depopall(68333);
	    quest::depopall(68334);
	    quest::depopall(68335);
	    quest::depopall(68336);
	    quest::depopall(68337);
	    quest::depopall(68338);
	    quest::depopall(68339);
	    quest::depopall(68340);
	    quest::depopall(68341);
	    quest::depopall(68342);
	    quest::depopall(68343);
	    quest::depopall(68344);
	    quest::depopall(68345);
	    quest::depopall(68346);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(68327,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68328,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68328,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68328,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68328,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(68330,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68330,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68330,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68330,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68330,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(68331,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68332,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68332,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68332,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68332,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(68333,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68334,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68334,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68334,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68334,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(68335,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68336,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68336,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68336,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68336,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(68337,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68338,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68338,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68338,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68338,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(68339,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68340,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68340,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68340,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68340,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(68341,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68342,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68342,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68342,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68342,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(68343,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68344,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68344,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68344,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68344,0,0,1869.1,1634.3,-2.9,102.9);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(68345,0,0,1898.7,1710.6,4.6,155.4);
	    quest::spawn2(68346,0,0,1899,1667.8,-0.4,169.5);
	    quest::spawn2(68346,0,0,1855.1,1715.1,-0.3,142.4);
	    quest::spawn2(68346,0,0,1836.2,1659.8,-4.2,111.2);
	    quest::spawn2(68346,0,0,1869.1,1634.3,-2.9,102.9);
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