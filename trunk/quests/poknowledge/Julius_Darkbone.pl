#######################################
## NPC: Julius Darkbone              ##
## Zone: Plane of Knowledge          ##
## Quest: Illusion Feign Death stone ##
## Created by Caved for AXClassic    ##
## EQWorld Server     16-01-2013     ##
#######################################
sub EVENT_SAY {
my $make = quest::saylink("make", 1); 
my $silver = quest::saylink("silver", 1); 
my $reward = quest::saylink("reward", 1);

  if ($text=~/hail/i && $ ulevel >= 65) {
    $client->Message(14,"Hello $name , do you see my staf? it is a piece of junk. I ones wielded a staf so powerfull that it was taken away from me. To make sure noone ever used it again they broke it into 8 pieces and scattered those pieces around the planes. If you could help me putting my staff back together I would be willing to channel some of my necromantic powers and capture them in a special magical stone for you to use. How about it $name ? Can we $make a deal?");

  }
  if ($text=~/hail/i && $ulevel < 60) {
    $client->Message(14,"Hello $name , the quest I am offering is for level 65 people only. Come back when you reach level 65, now begone before I will try my new lifetap spell on you..."); 
  }
  if ($text=~/make/i && $ulevel >= 65) {
    $client->Message(14,"You can find the 8 pieces of my staff in The Solro Tower. For each 4 you turn in you will receive a special $silver coin. So 1 -4, 5 - 8");
  }
      if ($text=~/silver/i && $ulevel >= 65) {
        $client->Message(14,"When you have collected in all the 2 silver coins you can turn them in to me for your final $reward .");
  }

      if ($text=~/reward/i && $ulevel >= 65) {
        $client->Message(14,"The final reward is 'The stone of the Dark Master' (effect: Feign Death) self only and castable at lvl 65 only.");
  }
}
sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 119524 => 1, 119525 => 1, 119526 => 1, 119527 => 1)) {
        $client->Message(14,"Thank you $class , here is your first silver coin."); #first silver coin handin
    quest::summonitem(119544);
    quest::exp(5000);
    quest::ding();
    return 1;
 }
elsif (plugin::check_handin(\%itemcount, 119528 => 1, 119529 => 1, 119530 => 1, 119531 => 1)) {
        $client->Message(14,"Thank you $class , here is your seccond silver coin."); #seccond silver coin handin
    quest::summonitem(119545);
    quest::exp(5000);
    quest::ding();
    return 1;
 }
elseif (plugin::check_handin(\%itemcount, 119544 => 1, 119545 => 1)) {
        $client->Message(14,"Thank you $class , here is your final reward 'The Stone of the Dark Master'."); #final handin 2 silver coins
    quest::summonitem(119523);
    quest::exp(5000);
    quest::ding();
    return 1;
 }
else {
        $client->Message(14,"I don't need this $name. Take it back.");
        plugin::return_items(\%itemcount);
	    return 1;
 }
}


