#######################################
## NPC: Thilos Dagorod               ##
## Zone: Plane of Time A             ##
## Quest: Instance vendor            ##
## Created by Caved for AXClassic    ##
##                    23-03-2013     ##
#######################################
sub EVENT_SAY {
my $open = quest::saylink("open", 1);
my $back = quest::saylink("back", 1);

  if ($text=~/hail/i && $ulevel >= 60) {
    $client->Message(14,"Hello $name , I am Thilos Dagorod. Time A is camped again by another player huh? I know how you feel. Lucky for you I am here to make a few bucks and sel zone instances. If you want I can $open a zone instance for you to begin your Time A hunt, it will stay open for 2.47 hours. I charge 250pp per zone instance. You can purchase a new instance after the old one has expired.");
$client->Message(12,"In the event that you would die in your Time A instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up here. After some time..");
  }

  if ($text=~/hail/i && $ulevel < 60) {
    $client->Message(14,"Hello $name , the Time A zone instances I am offering are for level 60+ people only. Come back when you reach level 60.");
  }

  if ($text=~/open/i && $ulevel >= 60 && !defined($qglobals{$name."potimea"})) {
    $client->Message(14,"Just hand me 250pp and I will create the instance for you and port you there.");
  }
  if ($text=~/open/i && $ulevel >= 60 && defined($qglobals{$name."potimea"})) {
    $client->Message(14,"You already have an existing Time A zone instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
}
  if ($text=~/back/i && $ulevel >= 60) {
   if (defined($qglobals{$name."potimea"})) {
     $client->Message(14,"Going to send you back to your Time A instance now.");
     my $QGlobalValue = $qglobals{$name."potimea"};
     quest::MovePCInstance(219, $QGlobalValue, 233.00, 140.00, 9.12, 150);
}
else {
 $client->Message(14,"You seem to have no Time A instance.");
}
return 1;
}
}

sub EVENT_ITEM {
if (($platinum == 250) && $ulevel >= 60 && !defined($qglobals{$name."potimea"})) {
    $client->Message(14,"Thank you $class , you are on the way to your Time A instance, good luck!"); #Money handin for instance creattion and porting to it.

    my $instanceID = quest::CreateInstance("potimea", 0, 10000);
    quest::AssignToInstance($instanceID);
    quest::setglobal($name."potimea",$instanceID,7,M166);
    quest::MovePCInstance(219, $instanceID, 233.00, 140.00, 9.12, 150);
return 1;
 }
 elsif (($platinum == 250) && $ulevel >= 60 && defined($qglobals{$name."potimea"})) {
    $client->Message(14,"You already have a Time A instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
    quest::givecash(0,0,0,250);
return 1;
 }

else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}