##zonecontroller.pl ID 189520 in tutorialb Mines ofGlooming Deep##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
       if((defined $event8) && ($event8 == 1)) {
         quest::unique_spawn(189521, 0, 0, -592.5,-32.9,4,193.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(189500); 
		quest::depopall(189501);
		quest::depopall(189502);
		quest::depopall(189503);
		quest::depopall(189504);
		quest::depopall(189505);
		quest::depopall(189506);
		quest::depopall(189507);
		quest::depopall(189508);
		quest::depopall(189509);
		quest::depopall(189510);
		quest::depopall(189511);
		quest::depopall(189512);
		quest::depopall(189513);
		quest::depopall(189514);
		quest::depopall(189515);
		quest::depopall(189516);
		quest::depopall(189517);
		quest::depopall(189518);
		quest::depopall(189519);
	if($ulevel >= 1 && $ulevel <= 5) {
	    quest::spawn2(189500,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189501,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189501,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189501,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189501,0,0,-652.6,-26.2,17.1,137.3);
		}
    elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(189502,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189503,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189503,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189503,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189503,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
        quest::spawn2(189504,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189505,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189505,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189505,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189505,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(189506,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189507,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189507,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189507,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189507,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(189508,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189509,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189509,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189509,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189509,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(189510,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189511,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189511,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189511,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189511,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(189512,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189513,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189513,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189513,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189513,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(189514,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189515,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189515,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189515,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189515,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(189516,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189517,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189517,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189517,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189517,0,0,-652.6,-26.2,17.1,137.3);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(189518,0,0,-613.8,-60.2,7.4,205.4);
		quest::spawn2(189519,0,0,-620.8,-94,7,230.4);
		quest::spawn2(189519,0,0,-637.7,-106.6,12.9,250.1);
		quest::spawn2(189519,0,0,-624.5,-40.8,6.4,172);
		quest::spawn2(189519,0,0,-652.6,-26.2,17.1,137.3);
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