# a_shrouded_bat
# Killing these on 6th floor spawns either a female or male version of enraged_vampire

sub EVENT_DEATH {
    my $vampall = int(rand(100));
    if($vampall <= 49) {
        #100
        my $vampfem = quest::spawn2(111174,0,0,$x,$y,$z,0); #spawns female 
        my $attack = $entity_list->GetMobID($vampfem);
        $attack->AddToHateList($client, 1);
    }
    else {
        my $vampmale = quest::spawn2(111173,0,0,$x,$y,$z,0); #spawns male
        my $attack = $entity_list->GetMobID($vampmale);
        $attack->AddToHateList($client, 1);
    }

}