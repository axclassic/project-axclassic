# a_ice_shade NPCID - 111250
# Update for emulating Unique Spawn.
# Now will only spawn once even if the trigger gets killed twice.
# This snippit will check for existing npcid, if it does do nothing.
# Otherwise spawn the named. Last revision 9/20/16 by Patrikpatrik
# Killing him spawns Vhalsera on 6b.

sub EVENT_SAY {
	
}

sub EVENT_DEATH {
	my @npcarray = $entity_list->GetNPCList(); #Dumps all NPC's in an array
		foreach my $n (@npcarray){
			$npcname = $n->GetCleanName();
			if($npcname eq "VhalSera"){ # If VhalSera is up then flag it.
				$vhalsera = 1;
			} else {
				# Do nothing
			}
		}
	if($vhalsera == 1){
		# Do nothing if he's up. (Emulates unique Spawn.)
	} else {
	  quest::spawn2(111144,0,0,-400.85,400.89,24.13,125); #Spawns Vhalsera
	}
}

# End of File NPCID: 111250 Zone: Tower of Frozen Shadow