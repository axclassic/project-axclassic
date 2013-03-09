#######################################
## NPC: Londor Epione                ##
## Zone: Plane of Knowledge          ##
## Quest: Server Challenge Tier 3    ##
## Created by Caved for AXClassic    ##
##                    09-03-2013     ##
#######################################
sub EVENT_SAY {
my $port = quest::saylink("port", 1); 

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name , I am Londor Epione. I am here to tell you about Tier 3 armor, it is called Rathe Armor (Tier 3) and can be found in the Arena. You can find all the pieces there exept for the chest pieces. You will have to bring me 3 The Rathe Server Doll (Tier 3)'s and I will give you a random Tier 3 chestpiece, either Leather, Plate, Chain or Silk. These dolls drop in the Arena to occasionaly. If you want I can $port you there for a fee. I charge 25pp per portal.");
  }

  if ($text=~/hail/i && $ulevel < 65) {
    $client->Message(14,"Hello $name , the tier 3 server challenge and quest I am offering is for level 65++ people only. Come back when you reach level 65.");
  }
  
  if ($text=~/port/i && $ulevel >= 65) {
    $client->Message(14,"Just hand me 250pp and I will port you to the Arena.");
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
 
elsif (($platinum == 25) && $ulevel >= 65) {
    $client->Message(14,"Thank you $class , you are on the way to the Arena, good luck!"); #Money handin fr port.
    quest::movepc(77, -11.34, -192.78, -5.81);
    return 1;
 }
 
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}