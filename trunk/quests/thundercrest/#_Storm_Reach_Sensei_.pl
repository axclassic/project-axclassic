sub EVENT_SAY {
my $price = quest::saylink("price", 1);
my $time = quest::saylink("time", 1);
   if ($text=~/Hail/i){
   quest::say("Welcome to the Storm Reach Dojo. I am pleased that you have taken up our humble challenge. As soon as you are ready, bring at least six of your fellows into the dojo and we shall begin. Be aware that this is a contest to the death. Do not enter the dojo unless you are prepared to pay that $price.");
   }
   if ($text=~/price/i){
   quest::say("Good, you have decided to meet the challenge. I will not bore you with unworthy tales of our training methods or our meager accomplishments, certainly your own deeds far outshine our own. We are but meager servants to the Strom Mistress, Yar`Lir, and are of little consequence. We have been asked to test you and, certainly, ourselves in a battle to the death. The residents of this place are away at tasks beyond those such as we, and for a short while we have this room to ourselves. We must finish our contest before they return, and so there is little $time for pleasantries."); 
   }
   if ($text=~/time/i){
   quest::say("A winner will be declared if they are the only combatants alive in this room. Your first challenge will be to defeat the Disciples of The Five Elements. Certainly they will be easily defeated by such mighty beings, but it is within their hearts to try. Your battle will begin in one minute. Prepare yourselves.");
   quest::spawn2(340049,0,0,-205.9,-148,251,102.9); #spawn controller#
   quest::signalwith(340049,111,1); # signal Dojo_controller to add one to spawn#
   quest::signalwith(340049,222,48000); # signal Dojo_controller to begin event#
   quest::spawn2(340038,0,0,-92.4,-344.2,253.2,2.7); #spawn Sensei 2#
   quest::depop();
   }
}