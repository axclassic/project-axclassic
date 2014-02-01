#pyzjn spawn
#npc - #Skele
#zone - qeytoqrg
#Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a=4147; #npc - pyzjn
 my $b=4191; #npc - Fabled pyzjn
 if(($random_result<=10) && ($pyzjn==2)){
   #quest::say("Spawning Fabled1");
   quest::spawn2($b,96,0,-1073.2,5069.6,114.9,108.4);
   quest::delglobal("pyzjn");
   quest::setglobal("pyzjn",3,3,"F");
   $pyzjn=undef;
 }elsif(($random_result>=10) && ($random_result<=25) && ($pyzjn==2)){
   #quest::say("Spawning Normal");
   quest::spawn2($a,96,0,-1073.2,5069.6,114.9,108.4);
   quest::delglobal("pyzjn");
   quest::setglobal("pyzjn",3,3,"F");
   $pyzjn=undef;
  }else{
    #quest::say("No spawn");
  };
};
