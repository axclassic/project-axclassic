sub EVENT_ENTERZONE {
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Ienala Eceiaiu has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
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
## AXClassic end
}
