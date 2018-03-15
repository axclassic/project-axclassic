##zonecontroller.pl ID 44135 in Najena##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
   quest::set_proximity($x - 100, $x + 100, $y - 100, $y + 100);
   if((defined $event8) && ($event8 == 1)) {
       quest::unique_spawn(44136,0,0,713,-98.9,4.2,38.5);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
   }
   }
   
sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
      if(!defined($EasterInProgress)) {
        quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global for all npc's, all players, this zone if nobody else has it.
		quest::depopall(44115); 
		quest::depopall(44116);
		quest::depopall(44117);
		quest::depopall(44118);
		quest::depopall(44119);
		quest::depopall(44120);
		quest::depopall(44121);
		quest::depopall(44122);
		quest::depopall(44123);
		quest::depopall(44124);
		quest::depopall(44125);
		quest::depopall(44126);
		quest::depopall(44127);
		quest::depopall(44128);
		quest::depopall(44129);
		quest::depopall(44130);
		quest::depopall(44131);
		quest::depopall(44132);
		quest::depopall(44133);
		quest::depopall(44134);
	if($ulevel >= 1 && $ulevel <= 5) {
		quest::spawn2(44115,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44116,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44116,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44116,0,0,774,-58.4,3,97);
		quest::spawn2(44116,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 6 && $ulevel <= 10) {
		quest::spawn2(44117,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44118,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44118,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44118,0,0,774,-58.4,3,97);
		quest::spawn2(44118,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 11 && $ulevel <= 15) {
		quest::spawn2(44119,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44120,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44120,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44120,0,0,774,-58.4,3,97);
		quest::spawn2(44120,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 16 && $ulevel <= 20) {
		quest::spawn2(44121,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44122,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44122,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44122,0,0,774,-58.4,3,97);
		quest::spawn2(44122,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 21 && $ulevel <= 25) {
		quest::spawn2(44123,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44124,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44124,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44124,0,0,774,-58.4,3,97);
		quest::spawn2(44124,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 26 && $ulevel <= 30) {
		quest::spawn2(44125,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44126,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44126,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44126,0,0,774,-58.4,3,97);
		quest::spawn2(44126,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 31 && $ulevel <= 35) {
		quest::spawn2(44127,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44128,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44128,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44128,0,0,774,-58.4,3,97);
		quest::spawn2(44128,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 36 && $ulevel <= 40) {
		quest::spawn2(44129,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44130,6,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44130,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44130,0,0,774,-58.4,3,97);
		quest::spawn2(44130,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 41 && $ulevel <= 45) {
		quest::spawn2(441315,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44132,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44132,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44132,0,0,774,-58.4,3,97);
		quest::spawn2(44132,0,0,751.9,-50.9,3,90.1);
		}
	elsif($ulevel >= 46 && $ulevel <= 49) {
		quest::spawn2(44133,0,0,738.9,-71.3,3,70.1);
		quest::spawn2(44134,0,0,775.3,91.6,3,30.5);
		quest::spawn2(44134,0,0,739.8,-98.8,3,56.1);
		quest::spawn2(44134,0,0,774,-58.4,3,97);
		quest::spawn2(44134,0,0,751.9,-50.9,3,90.1);
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