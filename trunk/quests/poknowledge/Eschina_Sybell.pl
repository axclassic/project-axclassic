######################################
## NPC: Eschina Sybell              ##
## Zone: Plane of Knowledge         ##
## Quest: Random Illusion Quest     ##
## Created by Caved for AXClassic   ##
## EQWorld Server     01-08-2012    ##
######################################
sub EVENT_SAY {
my $mirror = quest::saylink("mirror", 1); 
my $shards = quest::saylink("shards", 1); 
my $willing = quest::saylink("willing", 1);
my $send = quest::saylink("send", 1);

  if ($text=~/hail/i &&$ ulevel >= 60) {
    $client->Message(14,"Hello $name , I am devistated. Thismorning I broke the only $mirror I had and am now unable to look at myself after casting my illusions. I need you help..");
$client->Message(12,"A word of warning: If you die during this quest, you will have to wait until the quest instance expires. Your corpse will then be available and I can $send you to it...");

  }
  if ($text=~/hail/i && $ulevel < 60) {
    $client->Message(14,"Hello $name , I am devistated. Thismorning I broke the only mirror I had and am now unable to look at myself after casting my illusions. Unfortunatly you are to young to help me out here. Please return when you are level 60 or above. I couldn't live with myself in the knowledge I had send you to your death. Go now...");
  }
  if ($text=~/mirror/i && $ulevel >= 60) {
    $client->Message(14,"I could repair the mirror but would need 4 glass $shards to do so.. Would you please please be so kind to bring me 4 glass shards? I will reward you with a unique stone if you do. The stone will enable you to cast an illusion on yourself.... In the event that I would give you an Illusion stone you already have you can give me 2 of the same stones and I will give you another one in return");
  }
      if ($text=~/shards/i && $ulevel >= 60) {
        $client->Message(14,"The glass shards I need are found in a long and dangerous dungeon. Only the end bosses have the glass shards I need. Are you sure you want to go there? I can port you there if you are $willing to help me...");
  }
      if ($text=~/willing/i && $ulevel >= 60) {
        $client->Message(14,"Okay $class. Lets get on with this then. Portal is incoming! Good luck, god knows you will need it...");
my $instanceID = quest::CreateInstance("mmca", 0, 6400);
quest::AssignToInstance($instanceID);
quest::MovePCInstance(233, $instanceID, -610.42, -359.91, 6.08, 150);        
return 1;
 }
      if ($text=~/send/i && $ulevel >= 59) {
        $client->Message(14,"I am sending you to the regular Forlorn zone instance. Your corpse will be available after your quest instance has expired, not before..");
quest::movepc(233, -610.42, -359.91, 6.08);
  }
}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 119517 => 4)) {
        $client->Message(14,"Thank you so much $class , can't wait to fix my mirror. Here is your illusion stone.");
my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522); #All the illusion stones
    my $total = $items[ rand @items ]; #Randomize
    quest::summonitem($total);
    quest::exp(5000);
    quest::ding();
    return 1;
 }
 
elsif (plugin::check_handin(\%itemcount, 119499 => 2) | plugin::check_handin(\%itemcount, 119501 => 2) | 
       plugin::check_handin(\%itemcount, 119514 => 2) | plugin::check_handin(\%itemcount, 119515 => 2) | 
       plugin::check_handin(\%itemcount, 119516 => 2) | plugin::check_handin(\%itemcount, 119518 => 2) | 
       plugin::check_handin(\%itemcount, 119519 => 2) | plugin::check_handin(\%itemcount, 119521 => 2) | 
       plugin::check_handin(\%itemcount, 119522 => 2)) {
        $client->Message(14,"Thank you $class , I will exchange the 2 double ones for 1 new random illusion stone. enjoy...");
        
my @items = (119499,119501,119514,119515,119516,119518,119519,119521,119522); #All the illusion stones
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


