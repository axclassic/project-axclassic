# Spawns #an_enraged_vampire (111174) and maybe Tserrina, or Fabled Tserrina
# Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 111174;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 quest::spawn2($a,0,0,$x,$y,$z,$h); #Spawns an_enraged_vampire
  if (($random_result<5)&& ($Tserr==2)){
  quest::delglobal("Tserr");
  quest::setglobal("Tserr",3,3,"F");
  $Tserr=undef;
  $spawntsr = quest::spawn2(111185,0,0,21.1,260.7,355.0,253.9); #Spawn  Fabled
  $attack = $entity_list->GetMobID($spawntser);
  $tserattack = $attack->CastToNPC();
  $tserattack->AddToHateList($client, 1);}
  elsif (($random_result<20)&& ($Tserr==2)){
  quest::delglobal("Tserr");
  quest::setglobal("Tserr",3,3,"F");
  $Tserr=undef;
  $spawntsr = quest::spawn2(111154,0,0,21.1,260.7,355.0,253.9); #Spawn normal Tserrina
  $attack = $entity_list->GetMobID($spawntser);
  $tserattack = $attack->CastToNPC();
  $tserattack->AddToHateList($client, 1);}
}
# EOF zone: FrozenShadow
