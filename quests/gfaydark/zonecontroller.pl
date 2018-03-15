##zonecontroller.pl ID 54330 in Gfaydark##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(54309,0,0,210.6,81.2,-2.8,237.9); ##Peter Cottontail
		quest::unique_spawn(54331,0,0,-2039.5,2148.3,-25.9,80.6);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(54310); 
		quest::depopall(54311);
		quest::depopall(54312);
		quest::depopall(54313);
		quest::depopall(54314);
		quest::depopall(54315);
		quest::depopall(54316);
		quest::depopall(54317);
		quest::depopall(54318);
		quest::depopall(54319);
		quest::depopall(54320);
		quest::depopall(54321);
		quest::depopall(54322);
		quest::depopall(54323);
		quest::depopall(54324);
		quest::depopall(54325);
		quest::depopall(54326);
		quest::depopall(54327);
		quest::depopall(54328);
		quest::depopall(54329);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(54310,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54311,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54311,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54311,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54311,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(54312,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54313,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54313,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54313,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54313,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(54314,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54315,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54315,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54315,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54315,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(54316,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54317,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54317,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54317,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54317,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(54318,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54319,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54319,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54319,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54319,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(54320,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54321,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54321,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54321,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54321,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(54322,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54323,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54323,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54323,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54323,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(54324,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54325,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54325,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54325,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54325,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(54326,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54327,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54327,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54327,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54327,0,0,-1908.2,2160.9,-42.5,117.9);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(54328,0,0,-1999.7,2158.1,-43.4,110.1);
		quest::spawn2(54329,0,0,-2012.8,2070.2,-43.2,106.8);
		quest::spawn2(54329,0,0,-2003.9,2110.2,-42.7,99.4);
		quest::spawn2(54329,0,0,-1960.1,2157.7,-41.6,117);
		quest::spawn2(54329,0,0,-1908.2,2160.9,-42.5,117.9);
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