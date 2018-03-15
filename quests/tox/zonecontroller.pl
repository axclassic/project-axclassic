##zonecontroller.pl ID 38235 in Toxxulia Forest##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(38214,0,0,276.7,2373,-48.5,125.4); ##Peter Cottontail
		quest::unique_spawn(38236,0,0,1081.8,565.5,-46.2,156.8);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(38215); 
		quest::depopall(38216);
		quest::depopall(38217);
		quest::depopall(38218);
		quest::depopall(38219);
		quest::depopall(38220);
		quest::depopall(38221);
		quest::depopall(38222);
		quest::depopall(38223);
		quest::depopall(38224);
		quest::depopall(38225);
		quest::depopall(38226);
		quest::depopall(38227);
		quest::depopall(38228);
		quest::depopall(38229);
		quest::depopall(28230);
		quest::depopall(38231);
		quest::depopall(38232);
		quest::depopall(38233);
		quest::depopall(38234);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(38215,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38216,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38216,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38216,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38216,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(38217,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38218,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38218,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38218,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38218,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(38219,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38220,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38220,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38220,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38220,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(38221,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38222,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38222,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38222,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38222,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(38223,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38224,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38224,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38224,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38224,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(38225,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38226,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38226,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38226,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38226,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(38227,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38228,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38228,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38228,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38228,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(38229,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38230,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38230,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38230,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38230,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(38231,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38232,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38232,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38232,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38232,0,0,1148.6,549.6,-52.4,197.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(38233,0,0,1142.6,589.8,-51.8,176.5);
		quest::spawn2(38234,0,0,1138,627.2,-41.3,165.1);
		quest::spawn2(38234,0,0,1102.7,591.4,-49.9,188.4);
		quest::spawn2(38234,0,0,1103,547.1,-47,180.9);
		quest::spawn2(38234,0,0,1148.6,549.6,-52.4,197.5);
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