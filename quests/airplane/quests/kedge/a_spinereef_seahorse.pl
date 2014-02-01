# respawn named mob on a Undertow (64087) death
# Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
  if ($random_result<=5){ #&&($towss==2)){
  # quest::say("Owweee!!");
  quest::spawn2(64099,0,0,-288.0,259.0,62.0,95.5); #spawn Fabled Undertow
  quest::delglobal("towss");
  quest::setglobal("towss",3,3,"F");
  $towss=undef;
  }elsif ($random_result<=10){ #&&($towss==2)){
  # quest::say("Owweee!!");
  quest::spawn2(64087,0,0,-288.0,259.0,62.0,95.5); #spawn Undertow
  quest::delglobal("towss");
  quest::setglobal("towss",3,3,"F");
  $towss=undef;
  }else{
  #quest::say("Nothing");
 }
}

# EOF zone: kedge NPCs:Undertow (64087)