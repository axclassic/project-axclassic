##Boss Control Via Player##
##If boss dies in any of the 3 areas this will respawn the area with a random set of NPCs can be either wolves owls or grimlings##
sub EVENT_SIGNAL {
  if($signal == 10){
   my $a = quest::ChooseRandom(166802,166814,166813);
   quest::spawn2($a,0,0,2975.7,956.9,109.2,3.5); #East cave respawner
   quest::signalwith(166814,11,10000);
   quest::signalwith(166802,11,10000);
   quest::signalwith(166813,11,10000);
   quest::depop(166654);
   quest::depop(166653);
   quest::depop(166652);
   quest::depop(166650);
   quest::depop(166651);
   quest::spawn2(166663,0,0,-2857.1,553.3,167,56.1);
   
   }
  if($signal == 15){
   my $a = quest::ChooseRandom(166815,166816,166817);
   quest::spawn2($a,0,0,2975.7,956.9,109.2,3.5); #North cave respawner
   quest::signalwith(166815,11,10000);
   quest::signalwith(166816,11,10000);
   quest::signalwith(166817,11,10000);
   quest::depop(166587);
   quest::depop(166586);
   quest::depop(166585);
   quest::depop(166588);
   quest::depop(166487);
   quest::spawn2(166405,0,0,1303.8,2131.1,280.9,197.5);
  
   }
  if($signal == 20){
   my $a = quest::ChooseRandom(166818,166819,166820);
   quest::spawn2($a,0,0,2975.7,956.9,109.2,3.5); #South Village respawner
   quest::signalwith(166818,11,10000);
   quest::signalwith(166819,11,10000);
   quest::signalwith(166820,11,10000);
   quest::depop(166567);
   quest::depop(166568);
   quest::depop(166569);
   quest::depop(166570);
   quest::depop(166571);
   quest::spawn2(166821,0,0,-661.2,-2902.7,101.5,15.6);
  
  }
 }


