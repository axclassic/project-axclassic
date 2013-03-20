######################################
## NPC: Eschina Sybell              ##
## Zone: Plane of Knowledge         ##
## Quest: Random Illusion Quest     ##
## Revised by Caved for AXClassic   ##
## EQWorld Server     19-03-2013    ##
######################################
sub EVENT_SAY {
my $mirror = quest::saylink("mirror", 1);
my $shards = quest::saylink("shards", 1);
my $willing = quest::saylink("willing", 1);
my $send = quest::saylink("send", 1);
my $back = quest::saylink("back", 1);

  if ($text=~/hail/i &&$ ulevel >= 59) {
    $client->Message(14,"Hello $name , I am devistated. Thismorning I broke the only $mirror I had and I am now unable to look at myself after casting my illusions. I need your help..");
$client->Message(12,"If you die during this quest, I can send you $back to your instance for as long as it is active. If it already expired your corpse will be available in the corpse recovery instance and I can $send you there...");

  }
  if ($text=~/hail/i && $ulevel < 59) {
    $client->Message(14,"Hello $name , I am devistated. Thismorning I broke the only mirror I had and am now unable to look at myself after casting my illusions. Unfortunatly you are to young to help me out here. Please return when you are level 60 or above. I couldn't live with myself in the knowledge I had send you to your death. Go now...");
  }
  if ($text=~/mirror/i && $ulevel >= 60) {
    $client->Message(14,"I could repair the mirror but would need 4 glass $shards to do so.. Would you please please be so kind to bring me 4 glass shards? I will reward you with a unique stone if you do. The stone will enable you to cast an illusion on yourself.... In the event that I would give you an Illusion stone you already have you can give me 2 of the same stones and I will give you another one in return");
  }
      if ($text=~/shards/i && $ulevel >= 60) {
        $client->Message(14,"The glass shards I need are found in a long and dangerous dungeon. Only the end bosses have the glass shards I need. Are you sure you want to go there? I can port you there if you are $willing to help me...");
  }
      if ($text=~/willing/i && $ulevel >= 60 && !defined($qglobals{$name."mmca"})) {
        $client->Message(14,"Okay $class. Lets get on with this then. Portal is incoming! Good luck, god knows you will need it...");
        my $instanceID = quest::CreateInstance("mmca", 0, 5400);
        quest::AssignToInstance($instanceID);
        quest::setglobal($name."mmca",$instanceID,7,M90);
        quest::MovePCInstance(233, $instanceID, -610.42, -359.91, 6.08, 150);
        return 1;
 }
     if ($text=~/willing/i && $ulevel >= 59 && defined($qglobals{$name."mmca"})) {
        $client->Message(14,"You already have an active instance. You can't get a new one before the old one expires. But I can port you $back to your own instance.");
        return 1;
}
    if ($text=~/back/i && $ulevel >= 59) {
     if (defined($qglobals{$name."mmca"})) {
     $client->Message(14,"Going to send you back to your quest instance now.");
     my $QGlobalValue = $qglobals{$name."mmca"};
     quest::MovePCInstance(233, $QGlobalValue, -610.42, -359.91, 6.08, 150);
}
else {
 $client->Message(14,"You seem to have no quest instance.");
}
return 1;
}
      if ($text=~/send/i && $ulevel >= 59 && !defined($qglobals{$name."mmca"})) {
        $client->Message(14,"I am sending you to the regular Forlorn zone instance. Your corpse will be available there after your quest instance has expired, not before..");
quest::movepc(233, -610.42, -359.91, 6.08);
  }
      if ($text=~/send/i && $ulevel >= 59 && defined($qglobals{$name."mmca"})) {
        $client->Message(14,"You have a quest instance open you can go $back to recover your corpse.")
 }
}
sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 119517 => 4)) {
        $client->Message(14,"Thank you so much $class , can't wait to fix my mirror. Here is your illusion stone.");
my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522,119666,119667); #All the illusion stones
    my $total = $items[ rand @items ]; #Randomize
    quest::summonitem($total);
    quest::exp(5000);
    quest::ding();
    return 1;
 }
elsif (plugin::check_handin((\%itemcount, 119499 => 2) || (\%itemcount, 119501 => 2) || (\%itemcount, 119514 => 2) || (\%itemcount, 119515 => 2) || (\%itemcount, 119516 => 2) || (\%itemcount, 119518 => 2) || (\%itemcount, 119519 => 2) || (\%itemcount, 119521 => 2) || (\%itemcount, 119522 => 2)  || (\%itemcount, 119666 => 2) || (\%itemcount, 119667 => 2))) {
        $client->Message(14,"Thank you $class , I will exchange the 2 double ones for 1 new random illusion stone. enjoy...");
my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522,119666,119667); #All the illusion stones
    my $total = $items[ rand @items ]; #Randomize
    quest::summonitem($total);
    return 1;
 }
else {
        $client->Message(14,"I don't need this $name. Take it back.");
        plugin::return_items(\%itemcount);
	    return 1;
 }
}
