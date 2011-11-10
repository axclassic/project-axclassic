# Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 if (($random_result<=5) && ($rage2==2)){
  quest::spawn2(109105,0,0,481.266,-380.517,8.226,134.625);
  quest::delglobal("rage2");
  quest::setglobal("rage2",3,3,"F");
  $rage2=undef;
  }else{
  #do nothing
 }
}

# EOF zone: veksar NPCs: spawn Explorer_Gamus