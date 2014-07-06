#The Tattered Pouch
sub EVENT_SAY
{
 if($text=~/Hail/i){
 quest::say("Welcome to Crow's! If you're thirsty, we have a fine selection of brews and ales.");
}
if($text=~/Crows/i){
quest::say("Oh, so you know of the good stuff eh? Well I will gladly sell you my Special Brew but I don't give it away. Each bottle will cost you 5 silver.");
 }
 }
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 17600 => 1)){
      quest::say("What are you? The Rat's new bag man? Peh, he is useless. That bum drinks any gold he gets. Here ya go, kid!");
      quest::summonitem(13901);
      quest::givecash("0","0","6","0");
      quest::faction(33,10); # +Circle of Unseen Hands
      quest::faction(217,-10); # -Merchants of Qeynos
      quest::faction(53,10); # Corrupt Qeynos Guards
      quest::faction(135,-10); #-Guards of Qeynos
      quest::faction(164,10); # Kane Bayle
       quest::ding(); quest::exp(200);
      }
elsif($silver >= 5) {
    quest::summonitem(13799);
	quest::say("There ya go. Hope you enjoy it!");    
    }
	     else {
   quest::say("I have no use for this.");
   plugin::return_items(\%itemcount);
   }
}
#END of FILE Zone:qeynos2  ID:2054 -- Crow.pl
