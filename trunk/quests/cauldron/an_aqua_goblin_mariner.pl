#Bilge Farfathom spawn
#npc - an_aqua_goblin_mariner (trigger for #Bilge_Farfathom 70059)
#zone - Dagnors Cauldron

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a=70059; #Bilge
 my $b=70061; #npc - #aqua_goblin_shaman
 my $c=70069; #The_Fabled_Bilge_Farfathom
 if($random_result<85){
  quest::spawn2($b,6,0,-974.5,436.4,-343.8,29);
  }elsif($random_result<95){
  quest::spawn2($a,6,0,-974.5,436.4,-343.8,29);
  }else{
   quest::spawn2($c,6,0,-974.5,436.4,-343.8,29);
  };
 };