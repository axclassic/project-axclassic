#######################################
## NPC: Udunir_Dagorod               ##
## Zone: Plane of Time B             ##
## Quest: Instance vendor            ##
## Created by Caved for AXClassic    ##
##                    23-03-2013     ##
#######################################
sub EVENT_SAY {
my $open = quest::saylink("open", 1);
my $back = quest::saylink("back", 1);
my $here = quest::saylink("here", 1);

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name , I am Udunir Dagorod. Time B is camped again by another player huh? I know how you feel. Lucky for you I am here to make a few bucks and sell zone instances. If you want I can $open a zone instance for you to begin your Time B hunt, it will stay open for 13 hours. I charge 500pp per zone instance. You can purchase a new instance after the old one has expired.");
$client->Message(12,"In the event that you would die in your Time B instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here. After some time..");
  }

  if ($text=~/hail/i && $ulevel < 65) {
    $client->Message(14,"Hello $name , the Time B zone instances I am offering are for level 65++ people only. Come back when you reach level 65.");
  }

  if ($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."potimeb"})) {
    $client->Message(14,"Just hand me 500pp and I will create the instance for you and port you there.");
  }
  if ($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."potimeb"})) {
    $client->Message(14,"You already have an existing Time B zone instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
}
  if ($text=~/back/i && $ulevel >= 64) {
   if (defined($qglobals{$name."potimeb"})) {
     $client->Message(14,"Going to send you back to your Time B instance now.");
     my $QGlobalValue = $qglobals{$name."potimeb"};
     quest::MovePCInstance(223, $QGlobalValue, -39.13, 1092.13, 495.53, 150);
}
else {
 $client->Message(14,"You seem to have no Time B instance.");
}
return 1;
}
 if ($text=~/here/i && $ulevel >= 64 && !defined($qglobals{$name."potimeb"})) {
$client->Message(14,"Going to send you to the regular zone instance now. Your corpse will end up here after your instance has expired.");
quest::movepc(223, -39.13, 1092.13, 495.53);
}
if ($text=~/here/i && $ulevel >= 64 && defined($qglobals{$name."potimeb"})) {
$client->Message(14,"You have an open Time B instance and can recover your corpse there. I can send you $back.");
}
}

sub EVENT_ITEM {
if (($platinum == 500) && $ulevel >= 65 && !defined($qglobals{$name."potimeb"})) {
    $client->Message(14,"Thank you $class , you are on the way to your Time B instance, good luck!"); #Money handin for instance creattion and porting to it.

    my $instanceID = quest::CreateInstance("potimeb", 0, 46800);
    quest::AssignToInstance($instanceID);
    quest::setglobal($name."potimeb",$instanceID,7,H13);
    quest::MovePCInstance(223, $instanceID, -39.13, 1092.13, 495.53, 150);
return 1;
 }
 elsif (($platinum == 500) && $ulevel >= 65 && defined($qglobals{$name."potimeb"})) {
    $client->Message(14,"You already have a Time B instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
    quest::givecash(0,0,0,500);
return 1;
 }

else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}