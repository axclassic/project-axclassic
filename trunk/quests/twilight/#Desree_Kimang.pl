#######################################
## NPC: Desree_Kimang                ##
## Zone: Twilight                    ##
## Quest: The Rathe Prestige Quest   ##
## Created by Caved for AXClassic    ##
## EQWorld Server     27-08-2014     ##
#######################################
sub EVENT_SAY {

  if ($text=~/hail/i && $ulevel >= 65) {
    $client->Message(14,"Hello $name who are you?");
  }
  elsif  ($text=~/hail/i && $ulevel < 65) {
  $client->Message(14,"I dont think I should talk to you. Bye now.");
  return 1;
   }
}


sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 119956 => 1) && $ulevel == 65) {
    $client->Message(14,"Hello $name, my sister send you. Good I was waiting for you. I need your help. I was cursed and trapped in the Twilight zone. Every time I try to escape I am being pulled back in. I havent seen my sister in 10 years. Will you help me break this curse? If I could reassemble the 3 platinum gate coins I would have a shot at breaking the curse. They are very difficult to make though. The elementals here hold gate shards. For every 4 you can bring me I can construct 1 Silver Gate coin. For every 4 Silver Gate Coins I can make 1 Gold Gate Coin. For every 4 Gold Gate Coins I can make 1 Platinum Gate Coin. You need to all in all give me the token I am about to give you and 3 Platinum Gate Coins. Hurry up I need to leave this place at once..");
    quest::summonitem("119961");

 }
elsif (plugin::check_handin(\%itemcount, 119957 => 4) && $ulevel == 65) {
    $client->Message(14,"Ok $sname , Here is your Silver Gate Coin..");
    quest::summonitem("119958");

 }
elsif (plugin::check_handin(\%itemcount, 119958 => 4) && $ulevel == 65) {
    $client->Message(14,"Ok $sname , Here is your Golden Gate Coin..");
    quest::summonitem("119959");

 }
elsif (plugin::check_handin(\%itemcount, 119959 => 4) && $ulevel == 65) {
    $client->Message(14,"Ok $sname , Here is your Platinum Gate Coin..");
    quest::summonitem("119960");

 }
elsif (plugin::check_handin(\%itemcount, 119961 => 1, 119960 => 3) && $ulevel == 65) {
    $client->Message(14,"WOOHOOO YOU DID IT! Thank you so much I am out of here. Take this Coin and The Head of Yerdsul (Yerdsul can be found in one of these plains) to Qintas Leril. He was last seen near Qeynos.");
    quest::summonitem("119963");

 }
else {
    $client->Message(14,"I don't need this $name. Take it back.");
    plugin::return_items(\%itemcount);
    return 1;
 }
}