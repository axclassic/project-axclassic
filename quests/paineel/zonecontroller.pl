##zonecontroller.pl ID 75147 in Paineel##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(75171, 0, 0, -76.7,  1051.4, 1.9, 163.9);    ##Peter Cottontail
	   quest::unique_spawn(75193, 0, 0, -7629.6,1535.5,23.1,100);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
        quest::depopall(75172); 
		quest::depopall(75173);
		quest::depopall(75174);
		quest::depopall(75175);
		quest::depopall(75176);
		quest::depopall(75177);
		quest::depopall(75178);
		quest::depopall(75179);
		quest::depopall(75180);
		quest::depopall(75181);
		quest::depopall(75182);
		quest::depopall(75183);
		quest::depopall(75184);
		quest::depopall(75185);
		quest::depopall(75186);
		quest::depopall(75187);
		quest::depopall(75188);
		quest::depopall(75189);
		quest::depopall(75190);
		quest::depopall(75191);
   if($ulevel >= 1 && $ulevel <= 5) {
        quest::spawn2(75172,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75173,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75173,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75173,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75173,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 6 && $ulevel <= 10) {
        quest::spawn2(75174,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75175,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75175,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75175,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75175,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 11 && $ulevel <= 15) {
        quest::spawn2(75176,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75177,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75177,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75177,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75177,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 16 && $ulevel <= 20) {
        quest::spawn2(75178,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75179,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75179,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75179,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75179,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 21 && $ulevel <= 25) {
        quest::spawn2(75180,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75181,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75181,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75181,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75181,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 26 && $ulevel <= 30) {
        quest::spawn2(75182,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75183,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75183,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75183,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75183,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 31 && $ulevel <= 35) {
        quest::spawn2(75184,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75185,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75185,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75185,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75185,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 36 && $ulevel <= 40) {
        quest::spawn2(75186,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75187,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75187,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75187,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75187,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 41 && $ulevel <= 45) {
        quest::spawn2(75188,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75189,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75189,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75189,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75189,0,0,-592.9,1520.3,1,81.5);
      }
   elsif($ulevel >= 46 && $ulevel <= 49) {
        quest::spawn2(75190,0,0,-571.1,1575.5,1,107.8);
		quest::spawn2(75191,0,0,-549.8,1579.5,1,131.4);
		quest::spawn2(75191,0,0,-524.3,1580.5,1,136.3);
		quest::spawn2(75191,0,0,-601,1556.3,1,92.5);
		quest::spawn2(75191,0,0,-592.9,1520.3,1,81.5);
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
