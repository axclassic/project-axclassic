#######################################
## NPC: Londor Epione                ##
## Zone: Plane of Knowledge          ##
## Quest: Server Challenge Tier 3    ##
## Created by Caved for AXClassic    ##
##   Revised          04-11-2014     ##
#######################################
sub EVENT_SAY {
my $open = quest::saylink("open", 1);
my $back = quest::saylink("back", 1);
my $here = quest::saylink("here", 1);
my $aatotal = $client->GetSpentAA();

  if ($text=~/hail/i && $ulevel == 65 && $aatotal >= 150) {
    $client->Message(14,"Hello $name , I am Londor Epione. I am here to tell you about Tier 3 armor, it is called Rathe Armor (Tier 3) it can be found in a special instanced dungeon. You can find all the pieces there exept for the chest pieces. You wil have to bring me 3 The Rathe Server Doll (Tier 3)'s and I wil give you a random Tier 3 chestpiece, either Leather, Plate, Chain or Silk. These dolls drop in this quest dungeon to occasionaly. If you are lvl 65 and have spend 150 AA points I can $open a zone instance for you to begin your Tier 3 challenge, it will stay open for 6 hours. I charge 1500pp per zone instance. You can purchase a new instance after the old one has expired.");
$client->Message(12,"In the event that you would die in your Tier 3 quest instance, I can port you $back for as long as the instance is active. In case your instance has already expired, your corpse will end up $here.");
return 1;
  }

  if ($text=~/hail/i && $ulevel < 65 || $aatotal < 150) {
    $client->Message(14,"Hello $name , the Tier 3 server challenge and quest I am offering is for people who are lvl 65 and have spend in all 150 AA points as a minimum. Come back when you meet those requirements.");
return 1;
  }

  if ($text=~/open/i && $ulevel >= 65 && !defined($qglobals{$name."chambersd"}) && $aatotal >= 150) {
    $client->Message(14,"Just hand me 1500pp and I will create the instance for your challenge and port you there.");
return 1;
  }
  if ($text=~/open/i && $ulevel >= 65 && defined($qglobals{$name."chambersd"}) && $aatotal >= 150) {
    $client->Message(14,"You already have an existing Tier 3 zone instance. You can't purchase a newone until it has expired, but I can port you $back to it if you like.");
return 1;
}
  if ($text=~/back/i && $ulevel >= 64 && $aatotal >= 150) {
   if (defined($qglobals{$name."chambersd"})) {
     $client->Message(14,"Going to send you back to your Tier 3 instance now.");
     my $QGlobalValue = $qglobals{$name."chambersd"};
     quest::MovePCInstance(307, $QGlobalValue, 0.00, 0.00, -0.21);
return 1;
}
else {
 $client->Message(14,"You seem to have no Tier 3 instance.");
}
return 1;
}
if ($text=~/here/i && $ulevel >= 64 && $aatotal >= 150) {
$client->Message(14,"Going to send you to the corpse recovery instance now. Remember there is only 1 player allowed in this instance, if there already is a player you will have to wait until this player leaves. Your corpse will end up here after your instance has expired.");
quest::movepc(307, 0.00, 0.00, -0.21);


}
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119621 => 3)) {
    $client->Message(14,"Thank you $class , here is your Tier 3 chest piece."); #random tier 3 chest piece handin.
    my @items = (119613,119620,119628,119635); #All BP's
    my $total = $items[ rand @items ]; #Randomize
    quest::summonitem($total);
    return 1;
}

elsif (($platinum == 1500) && $ulevel >= 65 && !defined($qglobals{$name."chambersd"}) && $aatotal >= 150) {
    $client->Message(14,"Thank you $class , you are on the way to your Tier 3 Challenge, good luck!"); #Money handin for instance creattion and porting to it.

    my $instanceID = quest::CreateInstance("chambersd", 0, 21600);
    quest::AssignToInstance($instanceID);
    quest::setglobal($name."chambersd",$instanceID,7,H6);
    quest::MovePCInstance(307, $instanceID, 0.00, 0.00, -0.21, 150);
return 1;
 }
 elsif (($platinum == 1500) && $ulevel >= 65 && defined($qglobals{$name."chambersd"}) && $aatotal >= 150) {
    $client->Message(14,"You already have a Tier 3 instance that hasn't expired yet, here is your money back $name."); #Instance exists Money back.
    quest::givecash(0,0,0,1500);
return 1;
 }
 elsif (($platinum == 1500) && $ulevel >= 65 && !defined($qglobals{$name."chambersd"}) && $aatotal < 150) {
    $client->Message(14,"You lack the AA requirement to enter Tier 3 $name."); #Instance exists Money back.
    quest::givecash(0,0,0,1500);
return 1;
}
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}