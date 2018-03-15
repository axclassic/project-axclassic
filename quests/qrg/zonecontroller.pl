##zonecontroller.pl ID 3086 in Surefall Glades qrg##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 150, $x + 150, $y - 150, $y + 150);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(3065,0,0,107.3,62.4,1,164.1); ##Peter Cottontail
		quest::unique_spawn(3087,0,0,140.3,255.1,1.9,139.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
if((defined $event8) && ($event8 == 1)) {
    if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(3072); 
		quest::depopall(3073);
		quest::depopall(3074);
		quest::depopall(3075);
		quest::depopall(3076);
		quest::depopall(3077);
		quest::depopall(3078);
		quest::depopall(3079);
		quest::depopall(3080);
		quest::depopall(3081);
		quest::depopall(3082);
		quest::depopall(3083);
		quest::depopall(3084);
		quest::depopall(3085);
		quest::depopall(3066);
		quest::depopall(3067);
		quest::depopall(3068);
		quest::depopall(3069);
		quest::depopall(3070);
		quest::depopall(3071);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(3072,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3073,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3073,0,0,183.6,304,1,147.1);
		quest::spawn2(3073,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3073,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(3074,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3075,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3075,0,0,183.6,304,1,147.1);
		quest::spawn2(3075,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3075,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(3076,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3077,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3077,0,0,183.6,304,1,147.1);
		quest::spawn2(3077,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3077,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(3078,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3079,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3079,0,0,183.6,304,1,147.1);
		quest::spawn2(3079,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3079,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(3080,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3081,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3081,0,0,183.6,304,1,147.1);
		quest::spawn2(3081,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3081,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(3082,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3083,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3083,0,0,183.6,304,1,147.1);
		quest::spawn2(3083,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3083,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(3084,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3085,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3085,0,0,183.6,304,1,147.1);
		quest::spawn2(3085,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3085,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(3066,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3067,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3067,0,0,183.6,304,1,147.1);
		quest::spawn2(3067,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3067,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(3068,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3069,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3069,0,0,183.6,304,1,147.1);
		quest::spawn2(3069,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3069,0,0,144.2,293.6,1,157.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(3070,0,0,178.1,324.6,1,144.9);
		quest::spawn2(3071,0,0,182.9,288.8,1,141.4);
		quest::spawn2(3071,0,0,183.6,304,1,147.1);
		quest::spawn2(3071,0,0,163.3,315.2,1,157.5);
		quest::spawn2(3071,0,0,144.2,293.6,1,157.5);
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