#BeginFile: northkarana\player.pl
#Quest file for Luclin Spires
#Quest file for North Karana: Paladin message during Necromancer Epic 1.5 (Soulwhisper)

sub EVENT_ENTERZONE {
  quest::settimer("spires",10);
  $qglobals{nexus} = undef;
  $qglobals{spire_nk} = undef;
  $qglobals{message_nk} = undef;
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


sub EVENT_TIMER {
  if ($timer eq "spires" && defined $qglobals{nexus} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && plugin::check_hasitem($client, 19720)) {
    quest::selfcast(2433); #self only to avoid AE
    quest::setglobal(spire_nk,0,1,"F");
    quest::delglobal(message_nk);
    $client->NukeItem(19720); #removes stone from inventory.
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
  elsif ($timer eq "spires" && defined $qglobals{nexus} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && !defined $qglobals{message_nk} && !plugin::check_hasitem($client, 19720)) {
    $client->Message(15,"You don't have the correct component to travel to Luclin.");
    quest::setglobal(message_nk,1,1,"M20"); #prevent component mssage from being spammed.
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
  elsif ($timer eq "spires" && defined $qglobals{nexus_nk} && defined $qglobals{spire_nk} && $qglobals{spire_nk} == 1 && defined $qglobals{message_nk} && !plugin::check_hasitem($client, 19720)) {
    $qglobals{nexus} = undef;
    $qglobals{spire_nk} = undef;
    $qglobals{message_nk} = undef;
  }
if ($timer == 1) {
  $whimsy_count++;
  }
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

sub EVENT_LOOT {
  if(($looted_id == 14344) && plugin::check_hasitem($client, 26896) && plugin::check_hasitem($client, 11430) && plugin::check_hasitem($client, 22892)) { #All 4 Paladin Heads
    $client->Message(15,"With his last breath, the paladin says, 'You are too late. The last paladin has fled to Natimbi with the staff and is on his way to destroy it!'");
  }
}
#EndFile: northkarana\player.pl