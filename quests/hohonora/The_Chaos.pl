##The_Chaos 211142##
sub EVENT_SPAWN {
quest::setnexthpevent(50);
}
sub EVENT_SIGNAL {
  if($signal == 300){
  
   quest::shout("You all have your orders. You know the information and the location of the temple. Find the power source and return it to me.");
   quest::signalwith(211173,301,0);
   quest::signalwith(211173,302,1000);
  }
  elsif($signal == 304){
   quest::say("No, both of you go. Watch over the others and make sure Adrianne does not interfere with our plans. I will tend to the visitors.");
   quest::ze(15, "Screech and Vaion beem a smile at each other and vanish in a flash of light.");
   quest::depop(211179);
   quest::depop(211173);
   quest::say("Come mortals, it has been a long time since I last enjoyed a decent battle.");
   quest::ze(15, "You feel a power grab you and drag you towards The Chaos.");
   quest::signalwith(211197,309,100);
   quest::spawn2(211200,0,0,-1608.6,-2284.1,1,65.4);
   quest::spawn2(211180,0,0,-1371.7,-2314,1,1.4);
   quest::spawn2(211180,0,0,-1403.9,-2302.6,1,27);
   quest::spawn2(211180,0,0,-1412.7,-2255.7,1,71.4);
   quest::spawn2(211180,0,0,-1394.7,-2220.6,1,106.5);
   quest::spawn2(211180,0,0,-1366.8,-2211.7,1,131.6);
   quest::spawn2(211180,0,0,-1328.4,-2259.2,1,185.1);
   }
 }
 sub EVENT_HP {
 if($hpevent == 50){
 quest::spawn2(211199,0,0,,-1374.8,-2265.3,1,254.5);
 quest::depopall(211180);
 quest::spawn2(211198,0,0,-1371.7,-2314,1,1.4);
 quest::spawn2(211198,0,0,-1403.9,-2302.6,1,27);
 quest::spawn2(211198,0,0,-1412.7,-2255.7,1,71.4);
 quest::spawn2(211198,0,0,-1394.7,-2220.6,1,106.5);
 quest::spawn2(211198,0,0,-1366.8,-2211.7,1,131.6);
 quest::spawn2(211198,0,0,-1328.4,-2259.2,1,185.1);
 quest::depop();
 }
 }
 sub EVENT_NPC_SLAY {
    my $meatbag = $entity_list->GetMobID($userid);
      if($meatbag->IsBot()) {
	  $meatbag->Message(5,"$mname just killed me! I hate $zoneln");
	  quest::signalwith(211200,200,1);
	  }
    }

sub EVENT_TIMER {
   if($timer eq "Chaospop"){
   quest::stoptimer("Chaospop");
    quest::depopall(211172);
    quest::depop();
 }
 }
 sub EVENT_DEATH {
    my $x = $npc->GetX(); 
    my $y = $npc->GetY(); 
    my $z = $npc->GetZ();  
    my $h = $npc->GetHeading(); 
	quest::stoptimer("Chaospop");
  quest::spawn2(211194,0,0,$x,$y,$z,$h); 
}