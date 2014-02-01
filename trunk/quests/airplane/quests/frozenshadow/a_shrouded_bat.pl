# Spawns an_enraged_vampire (111173)
# Angelox

sub EVENT_DEATH{
 my $a = 111173;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 $spawnvamp = quest::spawn2($a,0,0,$x,$y,$z,$h);
 $attack = $entity_list->GetMobID($spawnvamp);
 $vampattack = $attack->CastToNPC();
 $vampattack->AddToHateList($client, 1);
}
# EOF zone: FrozenShadow