# give 5th floor mobs a chance to spawn the enraged relative on death
#
sub EVENT_DEATH {
  $relative = int(rand(100));
  if ($relative <= 15) {
    $spawnenraged = quest::spawn2(111143,0,0,$x,$y,$z,0);
    $attack = $entity_list->GetMobID($spawnenraged);
    $enragedattack = $attack->CastToNPC();
    $enragedattack->AddToHateList($client, 1);
    quest::signalwith(111196,406,0);
  }
}

# EOF zone: frozenshadow
