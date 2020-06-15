# a_ice_shade NPCID - 111250
# Update for emulating Unique Spawn.
# Now will only spawn once even if the trigger gets killed twice.
# This snippit will check for existing npcid, if it does do nothing.
# Otherwise spawn the named. Last revision 9/20/16 by Patrikpatrik
# Killing him spawns Vhalsera on 6b.

sub EVENT_DEATH {
    my $VhalSera = $entity_list->GetMobByNpcTypeID(111144);
    if(!$VhalSera) {
        quest::spawn2(111144, 0, 0, -400.85, 400.89, 24.13, 125); #Spawns Vhalsera
    }
}

# End of File NPCID: 111250 Zone: Tower of Frozen Shadow