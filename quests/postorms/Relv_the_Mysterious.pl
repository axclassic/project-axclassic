##Relv_the_Mysterious in the Plane of Storms  210080## 

sub EVENT_SAY {
my $destruction = quest::saylink("destruction", 1);
my $continue = quest::saylink("continue", 1);
my $destroy = quest::saylink("destroy", 1);
my $courageous = quest::saylink("courageous", 1);
my $time = quest::saylink("time", 1);
  if($text=~/hail/i) {
   quest::say("Greetings to you, small one. I see you have made great progress through our fair planar dwelling. Were it not for the dubious undertakings by someone. . . or something, I would be more than glad to welcome you here. Unfortunately, there have been dangerous tidings afoot. Just look at the trees around you. This $destruction is the work of something altogether unseen, at least by me.");
   }   
  if($text=~/destruction/i) {
   quest::say("There was a time when all the trees were green and alive, though as you can see, that time is no more. I am unsure what it is that has caused the damage, but I do know that whatever it is has caused a great deal of damage and will $continue to do so unless someone like yourself has the courage to rid us of it.");
   }
  if($text=~/continue/i) {
   quest::emote(' looks about him at the charred trees and sighs.');
   quest::say("If this destruction is not stopped, we may soon not have any forest left, which would cause a great disturbance in the balance of this land. If it were in my power, I would go forth through the brush here and try and stop whatever is causing this. Unfortunately, I cannot leave, as I must protect the rest of the trees here from any beasts that might try to defile these lands any further. This is why I must ask for an outsider to help, so that I may send them forth through the brush into the clearing beyond to find the menace and $destroy it at the source.");
   }
  if($text=~/destroy/i) {
   quest::say("I have waited patiently for someone to come along to defeat the scourge on the land, and you may just be the one. If you feel you are $courageous enough to go forth, please let me know and I will make preparations to assist you through the brush to end whatever suffering the forest is feeling beyond.");
   }
  if($text=~/courageous/i) {
   quest::say("As I had hoped. When your party is ready to move forth, tell me that you are ready and I will make a clearing for you to go through. Be wary, my magic will only last for three hours before you are pulled back to me, so do whatever you can before that $time is up!");
   quest::say("return to me with proof of your deeds and you shall be rewarded.");
   }
  if($text=~/time/i) {
   $client->Message(14,"A powerfully green aura surrounds Relv as he opens a small rift in the brushes beyond, then sends you and your party forth into the burning forest beyond.");
   quest::spawn2(210552,0,0,1744.1,2166.9,-441,182.4);
   quest::spawn2(210547,1008210,0,-751,4949.6,-551.8,231.5);
   quest::spawn2(210548,1008211,0,-875.4,5143.2,-547.4,117.6);
   quest::spawn2(210547,1008212,0,-1008.9,5278.9,-491.9,247);
   quest::spawn2(210548,1008213,0,-1163.3,5404.3,-494.6,59.3);
   quest::spawn2(210547,1008214,0,-1164.2,5629.1,-522.7,79.5);
   quest::spawn2(210548,1008215,0,-1021.5,5876.9,-553.1,117.1);
   quest::spawn2(210547,1008216,0,-824.8,5931.7,-528.8,135.6);
   quest::spawn2(210548,1008217,0,-668.7,6026.1,-551.6,145.3);
   quest::spawn2(210547,1008218,0,-454.1,6003.7,-504,142.4);
   quest::spawn2(210548,1008219,0,-300.3,6007.2,-510.8,154.9);
   quest::spawn2(210547,1008220,0,-122.8,5990.6,-474.3,152.9);
   quest::spawn2(210548,1008221,0,-12.4,5961.4,-519.3,170.5);
   quest::spawn2(210547,1008222,0,-23.1,5825.3,-525.9,157);
   quest::spawn2(210548,1008223,0,-7.2,5685.3,-574.7,159.8);
   quest::spawn2(210547,1008224,0,-5.5,5480.3,-524.2,193.4);
   quest::spawn2(210548,1008225,0,-4.9,5357.7,-520.7,209.8);
   quest::spawn2(210547,1008226,0,-35.7,5055.3,-502.5,209.4);
   quest::spawn2(210548,1008227,0,-116.7,4898.7,-549.9,228);
   quest::signalwith(210552,212,0);
   quest::movepc(210,-1099.4,4956.4,-523.2);
   quest::settimer("relvtimer",10800);   
  }
}  
sub EVENT_SIGNAL{
   if($signal == 210) {
   quest::depopall(210550);
   quest::depopall(210551);
   quest::depopall(210547);
   quest::depopall(210548);
   quest::depopall(210549);
   quest::depop(210546);
   quest::depop(210552);
   quest::stoptimer("relvtimer");
   }
  } 
sub EVENT_TIMER {
  if($timer eq "relvtimer") { 
   quest::shout("You have failed. Perhaps I placed too much faith in mere mortals.");  
   quest::depopall(210550);
   quest::depopall(210551);
   quest::depopall(210547);
   quest::depopall(210548);
   quest::depopall(210549);
   quest::depop(210546);
   quest::depop(210252);
   quest::movepc(210,-1795,2059,-473);
   quest::stoptimer("relvtimer");
   }
} 
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28784 => 1)) {
  quest::say("You have done well $name. Take this, may hope it serves you well.");
  quest::summonitem(7755);
  }
} 
   

