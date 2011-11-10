#pyzjn spawn

#npc - #pyzjn

#zone - qeytoqrg

#Angelox



sub EVENT_DEATH{
 


 
my $a = 4193;
 my $x = $npc->GetX();
 
my $y = $npc->GetY();
 
my $z = $npc->GetZ();
 
my $h = $npc->GetHeading();
 
quest::say("I'm dead");
quest::spawn2($a,0,0,$x,$y,$z,$h);
 
quest::delglobal("pyzjn");
 
quest::setglobal("pyzjn",2,3,"F");
 
$pyzjn=undef;
  };
