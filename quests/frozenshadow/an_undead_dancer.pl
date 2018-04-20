# give 5th floor mobs a chance to spawn the enraged relative on death
#
sub EVENT_DEATH {
    my $relative = int(rand(100));
    if($relative <= 5) {
        #15
        my $spawnenraged = quest::spawn2(111143,0,0,$x,$y,$z,0);
        my $attack = $entity_list->GetMobID($spawnenraged);
        $attack->AddToHateList($client, 1);
    }
}

# EOF zone: frozenshadow

