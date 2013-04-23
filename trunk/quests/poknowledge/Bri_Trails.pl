#######################################
## NPC: Bri_Trails                   ##
## Zone: Betrayal Instance test      ##
## Quest: Instance vendor            ##
## Created by Caved Edited by Resqu  ##
##                    19-04-2013     ##
#######################################
sub EVENT_SAY {
my $open = quest::saylink("open", 1);
my $back = quest::saylink("back", 1);
my $here = quest::saylink("here", 1);

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name , I am busy at the moment come back later and I may be free to talk to you.");
$client->Message(12,"In the event that you would die in your Betrayal instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here. After some time..");
  }

  if ($text=~/hail/i && $ulevel < 65) {
    $client->Message(14,"Hello $name , I am testing zone instances that I will be offering. Come back when you reach level 65 come back I may be opened for business.");
  }

  if ($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."chardokb"})) {
    $client->Message(14,"Just hand me 500pp and I will create the instance for you and port you there.");
  }
  if ($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."chardokb"})) {
    $client->Message(14,"You already have an existing Betrayal instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
}
  if ($text=~/back/i && $ulevel >= 64) {
   if (defined($qglobals{$name."chardokb"})) {
     $client->Message(14,"Going to send you back to your Time B instance now.");
     my $QGlobalValue = $qglobals{$name."chardokb"};
     quest::MovePCInstance(277, $QGlobalValue, -188, 288, 6.03, 100);
}
else {
 $client->Message(14,"You seem to have no instance.");
}
return 1;
}
 if ($text=~/here/i && $ulevel >= 64 && !defined($qglobals{$name."chardokb"})) {
$client->Message(14,"Going to send you to the regular zone instance now. Your corpse will end up here after your instance has expired.");
quest::movepc(223, -39.13, 1092.13, 495.53);
}
if ($text=~/here/i && $ulevel >= 64 && defined($qglobals{$name."chardokb"})) {
$client->Message(14,"You have an open Betrayal instance and can recover your corpse there. I can send you $back.");
}
}

sub EVENT_ITEM {
if (($platinum == 366) && $ulevel >= 65 && !defined($qglobals{$name."chardokb"})) {
    $client->Message(14,"Thank you $class , you are on the way to your Betrayal instance, good luck!"); #Money handin for instance creation and porting to it.

    my $instanceID = quest::CreateInstance("chardokb", 0, 46800);
    quest::AssignToInstance($instanceID);
    quest::setglobal($name."chardokb",$instanceID,7,H13);
    quest::MovePCInstance(223, $instanceID, -39.13, 1092.13, 495.53, 150);
return 1;
 }
 elsif (($platinum == 366) && $ulevel >= 65 && defined($qglobals{$name."chardokb"})) {
    $client->Message(14,"You already have a Betrayal instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
    quest::givecash(0,0,0,366);
return 1;
 }

else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}
