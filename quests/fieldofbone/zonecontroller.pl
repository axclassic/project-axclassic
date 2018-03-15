##zonecontroller.pl ID 78250 in Fiels of Bone##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(78229,0,0,2679.4,-2122.4,12.2,4.6); ##Peter Cottontail	
		quest::unique_spawn(78251,0,0,-81.2,-1668.1,-49.7,121.1);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(78230); 
		quest::depopall(78231);
		quest::depopall(78232);
		quest::depopall(78233);
		quest::depopall(78234);
		quest::depopall(78235);
		quest::depopall(78236);
		quest::depopall(78237);
		quest::depopall(78238);
		quest::depopall(78239);
		quest::depopall(78240);
		quest::depopall(78241);
		quest::depopall(78242);
		quest::depopall(78243);
		quest::depopall(78244);
		quest::depopall(78245);
		quest::depopall(78246);
		quest::depopall(78247);
		quest::depopall(78248);
		quest::depopall(78249);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(78230,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78231,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78231,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78231,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78231,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(78232,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78233,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78233,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78233,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78233,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(78234,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78235,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78235,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78235,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78235,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(78236,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78237,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78237,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78237,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78237,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(78238,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78239,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78239,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78239,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78239,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(78240,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78241,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78241,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78241,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78241,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(78242,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78243,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78243,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78243,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78243,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(78244,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78245,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78245,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78245,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78245,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(78246,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78247,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78247,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78247,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78247,0,0,-23.2,-1722.4,-54.5,49.8);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(78248,0,0,-85.5,-1677.4,-51,82.5);
		quest::spawn2(78249,0,0,-29.5,-1657.4,-54,93);
		quest::spawn2(78249,0,0,-52.8,-1676.8,-52.5,83.4);
		quest::spawn2(78249,0,0,-90.4,-1713.3,-53.4,57.3);
		quest::spawn2(78249,0,0,-23.2,-1722.4,-54.5,49.8);
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