##zonecontroller.pl ID 56228 in Steamfont Mountains##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	quest::unique_spawn(56229,0,0,-1134.2,-1929.5,-88.5,43.9);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(56208); 
		quest::depopall(56209);
		quest::depopall(56210);
		quest::depopall(56211);
		quest::depopall(56212);
		quest::depopall(56213);
		quest::depopall(56214);
		quest::depopall(56215);
		quest::depopall(56216);
		quest::depopall(56217);
		quest::depopall(56218);
		quest::depopall(56219);
		quest::depopall(56220);
		quest::depopall(56221);
		quest::depopall(56222);
		quest::depopall(56223);
		quest::depopall(56224);
		quest::depopall(56225);
		quest::depopall(56226);
		quest::depopall(56227);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(56208,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56209,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56209,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56209,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56209,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(56210,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56211,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56211,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56211,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56211,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(56212,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56213,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56213,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56213,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56213,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(56214,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56215,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56215,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56215,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56215,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(56216,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56217,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56217,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56217,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56217,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(56218,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56219,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56219,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56219,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56219,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(56220,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56221,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56221,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56221,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56221,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(56222,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56223,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56223,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56223,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56223,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(56224,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56225,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56225,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56225,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56225,0,0,-1107.9,-1887.7,-109.8,27);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(56226,0,0,-1110.5,-1923.2,-106.7,26.5);
		quest::spawn2(56227,0,0,-1044.6,-1938.3,-110.9,35.3);
		quest::spawn2(56227,0,0,-1050.5,-1902.6,-110.6,49.3);
		quest::spawn2(56227,0,0,-1069.9,-1864.1,-110.9,20.1);
		quest::spawn2(56227,0,0,-1107.9,-1887.7,-109.8,27);
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