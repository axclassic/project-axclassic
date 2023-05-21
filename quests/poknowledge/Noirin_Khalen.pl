########################
##  Edited By Aardil  ##
## Enchanting of Bars ##
##      03-22-15      ##
########################
sub EVENT_SAY { 
my $enchant = quest::saylink("enchant", 1);
my $Gold = quest::saylink("Gold", 1);
my $Silver = quest::saylink("Silver", 1);
my $Platinum = quest::saylink("Platinum", 1);
  if($text=~/Hail/i){
quest::emote(' gives a gentile nod of her head in a proper and well-trained greeting.'); 
quest::say("Good day to you $name. and may the light of this place enlighten your quest for knowledge and understanding of our existence. I am Norin Khalen. a former enchanter and scholar of the world and a master jeweler of Erudin. In this place. in this time and era. I serve the people and the purpose as a craftswoman. My wares are suited for my art and are available to any aspiring jeweler that may wish to perfect their art whilst in our midst.  I also have the ability to translate special scrolls into knowledge of how to imbue planar gems. I can $enchant metals for you if you should need help with that.");
 }
  if($text=~/enchant/i){
quest::say("Yes, By special proclamation, I have been given the ability to enchant metals for the world of Norath. I Believe I am the only one, so I guess that makes me special.");
quest::emote(' grins');
quest::say("I can enchant $Gold $Silver or $Platinum bars for you for a nominal fee.");   
 }
  if($text=~/Silver/i){
quest::say("So, you need me to enchant a silver bar for you? That is easily done, bring to me a silver bar and 50 Platinum pieces and I will enchant the bar for you.");
 }
  if($text=~/Gold/i){
quest::say("So, you need me to enchant a gold bar for you? That is easily done, bring to me a gold bar and 75 Platinum pieces and I will enchant the bar for you.");
 }
  if($text=~/Platinum/i){
quest::say("So, you need me to enchant a platinum bar for you? That is easily done, bring to me a platinum bar and 100 Platinum pieces and I will enchant the bar for you.");
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 16500 => 1) && ($platinum >= 50)) {
quest::summonitem(16504);
quest::ding();
quest::say("Use it wisely, if you should need another, I will be here, waiting.");
quest::say("Farewell, $name.");
 }
  elsif (plugin::check_handin(\%itemcount, 16502 => 1) && ($platinum >= 75)) {
quest::summonitem(16506);
quest::ding();
quest::say("Use it wisely, if you should need another, I will be here, waiting.");
quest::say("Farewell, $name.");
 }
  elsif (plugin::check_handin(\%itemcount, 16503 => 1) && ($platinum >= 100)) {
quest::summonitem(16507);
quest::ding();
quest::say("Use it wisely, if you should need another, I will be here, waiting.");
quest::say("Farewell, $name.");
 }
  else {
      my $stuff = (\%itemcount);
      my $yes = 2;
      foreach my $k (keys(%{$stuff})) {
          next if($k == 0);
          $yes = 1;
      }
      if($yes == 1) {
          $client->Message(14, "I don't need this $name. Take it back.");
          plugin::return_items(\%itemcount);
      }
      if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
          $client->Message(14, "Thanks for the coin!");
      }
  }
}   
#END of FILE Zone:poknowledge  ID:202083 -- Noirin_Khalen 

