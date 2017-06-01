##Emperor_Seravince 211123##
sub EVENT_SPAWN {
    quest::settimer("Seravincepop",1800);
    quest::setnexthpevent(75);
  }
sub EVENT_HP{
   if($hpevent == 75){
    quest::spawn2(211134,0,0,364.6,-1562.5,1,0);
    quest::spawn2(211134,0,0,332,-1555.6,1,247.8);
    quest::setnexthpevent(65);
  }
   if($hpevent == 65){
    quest::spawn2(211134,0,0,399.8,-1342.4,1,136.5);
    quest::spawn2(211134,0,0,357.6,-1329.6,1,139.1);
    quest::setnexthpevent(50);
  }
   if($hpevent == 50){
    quest::spawn2(211135,0,0,399.8,-1342.4,1,136.5);
    quest::spawn2(211135,0,0,357.6,-1329.6,1,139.1);
    quest::setnexthpevent(35);
   }
   if($hpevent == 35){
    quest::spawn2(211134,0,0,364.6,-1562.5,1,0);
    quest::spawn2(211134,0,0,332,-1555.6,1,247.8);
   }
 }
sub EVENT_TIMER {
   if($timer eq "Seravincepop"){
      quest::ze(14,"You have failed. Emperor Seravince returns to it's temple.");
      quest::stoptimer("Seravince_pop");
      quest::depopall(211134);
	  quest::depopall(211135);
	  quest::depop();	  
   }
 }
 sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
  quest::spawn2(211194,0,0,$x,$y,$z,$h);
  quest::stoptimer("Seravincepop");
}