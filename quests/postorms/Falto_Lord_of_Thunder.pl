##Falto Lord of Thunder 210546##
sub EVENT_SPAWN { 
 
  quest::shout("Who is this maortal that thinks he can defeat me?");
  quest::setnexthpevent(80); 
 
 
  } 
 
 
sub EVENT_HP { 
if($hpevent == 80){
quest::spawn2(210550,0,0,-576.3,5385.6,-468.2,14.8);
quest::spawn2(210551,0,0,-550,5357.3,-470,4.4);
quest::spawn2(210550,0,0,-528.6,5351.6,-465,11.1);
quest::spawn2(210551,0,0,-508.9,5353.7,-461.2,252.8);
quest::spawn2(210550,0,0,-484.9,5363,-460.9,247.3);
quest::spawn2(210551,0,0,-462.6,5386.8,-464.2,202.1);
quest::spawn2(210550,0,0,-445.8,5395.4,-467.2,217.3);
quest::spawn2(210551,0,0,-440.2,5415.4,-470.6,207.9);
quest::spawn2(210550,0,0,-438.9,5439.5,-470.7,175.3);
quest::spawn2(210551,0,0,-424.6,5434.2,-471.1,178.3);
quest::spawn2(210550,0,0,-434.6,5403,-468.7,193.9);
quest::spawn2(210551,0,0,-442.8,5380.9,-467.1,203);
quest::spawn2(210550,0,0,-472.5,5373.2,-462,210.9);
quest::spawn2(210551,0,0,-451,5373.6,-466,206.1);
quest::spawn2(210550,0,0,-473.4,5359.2,-460.1,226.1);
quest::spawn2(210551,0,0,-490.9,5348.7,-460,236.1);
quest::spawn2(210550,0,0,-541.8,5348.3,-468.7,14.6);
quest::spawn2(210551,0,0,-548,5348.4,-469.8,15.1);
quest::setnexthpevent(50);
}
if($hpevent == 50){
quest::spawn2(210550,0,0,-576.3,5385.6,-468.2,14.8);
quest::spawn2(210551,0,0,-550,5357.3,-470,4.4);
quest::spawn2(210550,0,0,-528.6,5351.6,-465,11.1);
quest::spawn2(210551,0,0,-508.9,5353.7,-461.2,252.8);
quest::spawn2(210550,0,0,-484.9,5363,-460.9,247.3);
quest::spawn2(210551,0,0,-462.6,5386.8,-464.2,202.1);
quest::spawn2(210550,0,0,-445.8,5395.4,-467.2,217.3);
quest::spawn2(210551,0,0,-440.2,5415.4,-470.6,207.9);
quest::spawn2(210550,0,0,-438.9,5439.5,-470.7,175.3);
quest::spawn2(210551,0,0,-424.6,5434.2,-471.1,178.3);
quest::spawn2(210550,0,0,-434.6,5403,-468.7,193.9);
quest::spawn2(210551,0,0,-442.8,5380.9,-467.1,203);
quest::spawn2(210550,0,0,-472.5,5373.2,-462,210.9);
quest::spawn2(210551,0,0,-451,5373.6,-466,206.1);
quest::spawn2(210550,0,0,-473.4,5359.2,-460.1,226.1);
quest::spawn2(210551,0,0,-490.9,5348.7,-460,236.1);
quest::spawn2(210550,0,0,-541.8,5348.3,-468.7,14.6);
quest::spawn2(210551,0,0,-548,5348.4,-469.8,15.1);
quest::setnexthpevent(30);
}
if($hpevent == 30){
quest::spawn2(210550,0,0,-576.3,5385.6,-468.2,14.8);
quest::spawn2(210551,0,0,-550,5357.3,-470,4.4);
quest::spawn2(210550,0,0,-528.6,5351.6,-465,11.1);
quest::spawn2(210551,0,0,-508.9,5353.7,-461.2,252.8);
quest::spawn2(210550,0,0,-484.9,5363,-460.9,247.3);
quest::spawn2(210551,0,0,-462.6,5386.8,-464.2,202.1);
quest::spawn2(210550,0,0,-445.8,5395.4,-467.2,217.3);
quest::spawn2(210551,0,0,-440.2,5415.4,-470.6,207.9);
quest::spawn2(210550,0,0,-438.9,5439.5,-470.7,175.3);
quest::spawn2(210551,0,0,-424.6,5434.2,-471.1,178.3);
quest::spawn2(210550,0,0,-434.6,5403,-468.7,193.9);
quest::spawn2(210551,0,0,-442.8,5380.9,-467.1,203);
quest::spawn2(210550,0,0,-472.5,5373.2,-462,210.9);
quest::spawn2(210551,0,0,-451,5373.6,-466,206.1);
quest::spawn2(210550,0,0,-473.4,5359.2,-460.1,226.1);
quest::spawn2(210551,0,0,-490.9,5348.7,-460,236.1);
quest::spawn2(210550,0,0,-541.8,5348.3,-468.7,14.6);
quest::spawn2(210551,0,0,-548,5348.4,-469.8,15.1);
}
}
sub EVENT_DEATH {
   quest::shout("NO! It is not possible!");
   $client->Message(14,"An eerie silence settles over the area as Falto Lord of Thunder lies at your feet, defeated");
   $client->Message(11,"Return to a mangled ent and say ready to return to Relv the Mysterious.");
   $client->Message(11,"Turn in the lightning crystal to Relv the Mysterious to recieve your reward.");
   quest::depopall(210550);
   quest::depopall(210551);
   quest::depopall(210547);
   quest::depopall(210548);
   quest::depopall(210549);
   }