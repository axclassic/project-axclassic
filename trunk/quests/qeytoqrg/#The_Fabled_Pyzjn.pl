#Pyzjn spawn
#npc - #Pyzjn
#zone - qeytoqrg
#Angelox

sub EVENT_DEATH{
#quest::say("I'm dead");
 my $a = 4194;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ();
 my $h = $npc->GetHeading();
 quest::spawn2($a,0,0,$x,$y,$z,$h);
 quest::delglobal("pyzjn");
 quest::setglobal("pyzjn",2,3,"F");
 $pyzjn=undef;
  };
