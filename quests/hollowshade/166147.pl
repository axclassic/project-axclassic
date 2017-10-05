sub EVENT_SPAWN{
  quest::signalwith(166975,813,0); #South_Village_Respawn_check_owlbears
  quest::signalwith(166976,815,0); #South_Village_Respawn_check_grimlings
}
sub EVENT_DEATH{
quest::signalwith(166582,589,250000); #War_Event_Respawner
}
#a_sonic_guardian