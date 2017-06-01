##Frozen_Table_Trigger 211158##
sub EVENT_SPAWN {
my $Twins_event = 0;
 $counter = undef;
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 80, $x + 80, $y - 80, $y + 80);
	}
sub EVENT_ENTER {
    quest::ze(15, "As you approach the alter,you feel an odd sense of power surge through you as the elements og Fire and Ice combine and summon Dolgrem, Guardian of the Elements.");
	quest::spawn2(211157,0,0,-941.4,1085.2,1,23.4);
	quest::spawn2(211160,0,0,-940.6,152.7,3.9,27.6);
	quest::setimer("Twinspop,900");
	}
sub EVENT_SIGNAL {
   if($signal == 702) { ##signal 702 is from each of the twins that dies##
         $counter += 1;	 
   if($counter == 2) {
    quest::stoptimer("Twinspop");
	quest::spawn2(211194,0,0,-875.4,1146,1,162.1);
	$counter += 0;
	quest::depop();
	}
  }
}
Sub EVENT_TIMER {
if($timer eq "Twinspop"){
quest::stoptimer("Twinspop");
quest::depopall(211127);
quest::depop(211157);
quest::depop(211159);
quest::depop(211125);
quest::depop(211126);
quest::depop();
}
}