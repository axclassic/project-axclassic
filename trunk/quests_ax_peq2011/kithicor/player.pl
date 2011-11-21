sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
## AXClassic hand-me-downs
 if($ulevel >= 50){
  my @zonex = (1..17,19..31,33..38,40..47,49..63,67..70,73..75,78,82..84,97,98,100,101,104,106,121,156,165,166,189); #Trivial ZoneIDs array
  my $zoney = $zoneid;
  if (grep {$_ eq $zoney} @zonex){
      $client->Message(15,"This zone is trivial to you since you aquired level 50 - you are only allowed in this zone to complete quests and fight some of the higher level mobs.");
    }
  }
if ($ulevel<=1){
   if (($race eq 'Froglok') && ($zoneid==83)){
      quest::rebind(50,250.6,-1762.2,3.8);
      quest::movepc(50,250.6,-1762.2,3.8);}
   if (($race eq 'Vah Shir') && ($zoneid==74)){
      quest::rebind(155,104.7,-611.5,-190.4);
      quest::movepc(155,104.7,-611.5,-190.4);}
  $client->Message(15,"You can also start in Mines of Gloomingdeep - if you wish to play there, talk to the Norrath Adventurer.");
  }
}
## AXClassic end

sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_TASK_STAGE_COMPLETE {
	if($task_id == 212) {
		quest::summonitem(87319,5);
		$client->AddLevelBasedExp(10, 0);
		quest::setglobal("halloween_zombie",1,0,"H3");
		$client->Message(15,"The zombie presence seems somewhat lessened, and perhaps they have been quelled . . . for the time being.");
	}
}

sub EVENT_SIGNAL {
        if($signal == 666){
                quest::updatetaskactivity(212,0,1);
                quest::faction(98,-30);
        }
        if($signal == 667){
                quest::updatetaskactivity(213,0,1);
        }
}