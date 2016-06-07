#This is an invisible controller which spawns the undead guardians
#npcid - 223188

sub EVENT_SPAWN {
    $unpccounter = 0;
    $ubosscount = 0;
    quest::spawn2(quest::ChooseRandom(223105),0,0,65.2,1109.7,494.8,185.5); #an_undead_guardian
    quest::spawn2(quest::ChooseRandom(223105),0,0,65.2,1119.7,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105),0,0,65.2,1099.7,494.8,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14048) {
	$unpccounter += 1;
	$undeadc = $unpccounter;
	#quest::ze(15, "okay i signaled and my counte ris now $undeadc.");
}
  if ($unpccounter == 3 ) {
    quest::spawn2(quest::ChooseRandom(223105,223116),0,0,67,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105,223116),0,0,67,1120,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105),0,0,62,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223105),0,0,62,1120,494.8,185.5);
}
  elsif ($unpccounter == 4 ) {
    quest::spawn2(quest::ChooseRandom(223116),0,0,67,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223116),0,0,67,1120,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223116),0,0,62,1103,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223116),0,0,62,1120,494.8,185.5);
}
  elsif ($unpccounter == 5 ) {
    quest::spawn2(223129,0,0,65.2,1109.7,494.8,185.5); #Rythor_of_the_Undead
    quest::spawn2(223150,0,0,65.2,1119.7,494.8,185.5); #an_undead_protector
    quest::spawn2(223150,0,0,65.2,1099.7,494.8,185.5);
	$unpccounter = 0;
    
}
  if ($signal == 14040) {
    quest::signalwith(223177,14060,0); #tell main about event success
    quest::depop();
}
 }
