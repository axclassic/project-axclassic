##zonecontroller.pl ID 46126 in Innothule Swamp##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
	quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(46127,0,0,805.3,-195.3,-23.4,160.8);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(46106); 
		quest::depopall(46107);
		quest::depopall(46108);
		quest::depopall(46109);
		quest::depopall(46110);
		quest::depopall(46111);
		quest::depopall(46112);
		quest::depopall(46113);
		quest::depopall(46114);
		quest::depopall(46115);
		quest::depopall(46116);
		quest::depopall(46117);
		quest::depopall(46118);
		quest::depopall(46119);
		quest::depopall(46120);
		quest::depopall(46121);
		quest::depopall(46122);
		quest::depopall(46123);
		quest::depopall(46124);
		quest::depopall(46125);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(46106,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46107,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46107,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46107,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46107,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(46108,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46109,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46109,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46109,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46109,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(46110,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46111,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46111,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46111,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46111,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(46112,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46113,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46113,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46113,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46113,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(46114,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46115,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46115,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46115,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46115,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(46116,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46117,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46117,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46117,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46117,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(46118,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46119,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46119,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46119,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46119,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(46120,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46121,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46121,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46121,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46121,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(46122,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46123,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46123,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46123,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46123,0,0,816.7,-297.6,-24.2,58);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(46124,0,0,794,-218.6,-21.9,87.9);
		quest::spawn2(46125,0,0,826.6,-202.3,-23.7,98.1);
		quest::spawn2(46125,0,0,879.6,-236.5,-21.5,114.6);
		quest::spawn2(46125,0,0,799.3,-254.3,-20.2,81.2);
		quest::spawn2(46125,0,0,816.7,-297.6,-24.2,58);
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