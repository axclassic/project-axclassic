##zonecontroller.pl ID 20276 in kithicor##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
 	quest::set_proximity($x - 300, $x + 300, $y - 300, $y + 300);
	if((defined $event8) && ($event8 == 1)) {
	    quest::unique_spawn(20277,0,0,4439.4,540.6,648.3,70.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
	}
	}

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(20256); 
		quest::depopall(20257);
		quest::depopall(20258);
		quest::depopall(20259);
		quest::depopall(20260);
		quest::depopall(20261);
		quest::depopall(20262);
		quest::depopall(20263);
		quest::depopall(20264);
		quest::depopall(20265);
		quest::depopall(20266);
		quest::depopall(20267);
		quest::depopall(20268);
		quest::depopall(20269);
		quest::depopall(20270);
		quest::depopall(20271);
		quest::depopall(20272);
		quest::depopall(20273);
		quest::depopall(20274);
		quest::depopall(20275);
    if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(20256,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20257,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20257,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20257,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20257,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
	    quest::spawn2(20258,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20259,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20259,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20259,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20259,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
	    quest::spawn2(20260,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20261,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20261,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20261,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20261,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(20262,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20263,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20263,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20263,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20263,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(20264,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20265,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20265,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20265,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20265,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(20266,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20267,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20267,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20267,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20267,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(20268,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20269,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20269,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20269,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20269,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(20270,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20271,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20271,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20271,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20271,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(20272,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20273,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20273,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20273,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20273,0,0,4523.8,493.2,650.9,31.5);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(20274,0,0,4464.1,527.4,645.5,53);
		quest::spawn2(20275,0,0,4448.1,597.3,652.3,45.4);
		quest::spawn2(20275,0,0,4451.6,565.1,649.3,46.6);
		quest::spawn2(20275,0,0,4489.2,505.8,647.8,52.1);
		quest::spawn2(20275,0,0,4523.8,493.2,650.9,31.5);
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
