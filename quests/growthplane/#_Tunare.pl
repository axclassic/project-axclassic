# respawns true Tunare on death
# Angelox

sub EVENT_DEATH{
if ($tunares==2){
  quest::spawn2(127098,0,0,-227.5,1608.6,-53.7,173.0); #Spawn Real Tunare
  quest::delglobal("tuna");
  quest::setglobal("tuna",3,3,"F");
  $tuna=undef;
}
}
# EOF zone: GrowthPlane NPC: Fake Tunare
