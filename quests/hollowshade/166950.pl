sub EVENT_SPAWN{
   quest::signalwith(166971,816,0); ## North_Cave_Respawn_check_wolves
   quest::signalwith(166972,818,0); ## North_Cave_Respawn_check_owlbears
   quest::signalwith(166987,3070,0); ## North_Cave_Respawn_check_Delay_grimlings
 }
 sub EVENT_DEATH{
 quest::signalwith(166582,516,250000);#War_Event_Respawner
 }
 ## #Wiknak_Grimglom script
