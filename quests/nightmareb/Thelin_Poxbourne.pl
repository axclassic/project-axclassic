#BeginFile nightmareb\Thelin_Poxbourne.pl NPC ID 221009
sub EVENT_SAY {
my $ready = quest::saylink("ready", 1);
   if ($text=~/hail/i && defined $qglobals{"Tmaze"} == 1){
	quest::say("Has everyone made it here safely? When you tell me I will seal off my dream and we can begin. We must be careful here, visions await around every turn. Are you $ready to follow? I know where all the pieces of the dagger are, but I cannot collect them all on my own.");
   } 
   if($text=~/ready/i){
     quest::say("Please stay close, I know not what horror Terris will unleash upon us.");
     quest::start(1);
   }
   elsif(($text=~/hail/i && 
#zone nightmareb
defined $qglobals{"Tfinal"} == 1){
   quest::say("I am sorry but I can not face her again. You must do this without me.");
   quest::signalwith(221017,221,0);
   quest::depop();
 }
  else {
    quest::movepc(203,-1170.8,667.2,-847.8);
    quest::depop();
  }
}
sub EVENT_WAYPOINT{
    if ($wp == 6) {
    quest::emote(' kneels down and picks up a dagger hilt.');
   }
    if ($wp == 9) {
    quest::emote(' slowly picks up a shard of a dagger blade.');
   }
    if ($wp == 15) {
    quest::emote(' picks up the top  half of a dagger blade.');
   }
    if ($wp == 17) {
    quest::spawn2(221014,0,0,372.1,-294.7,-163.8,251.8);
    quest::spawn2(221014,0,0,334,-268.5,-150.5,0.9);
    quest::spawn2(221014,0,0,297.2,-242.6,-136.7,236);
    quest::spawn2(221014,0,0,280.1,-221.4,-130.6,8.6);
    quest::spawn2(221014,0,0,372.1,-195.5,-125.8,11.5);
   }
    if ($wp == 19) {
    quest::emote(' picks up a dagger handle with a hole in it.');
   }
    if ($wp == 20) {
    quest::spawn2(221015,0,0,-360.2,276.4,-91.2,73.6);
    quest::spawn2(221015,0,0,-372.7,233,-87.8,38.5);
    quest::spawn2(221015,0,0,-343,214.7,87.5,24.8);
    quest::spawn2(221015,0,0,-303.5,191.7,-93.5,49.8);
    quest::spawn2(221015,0,0,-285.8,167.4,-95.9,65.4);
   }
    if ($wp == 22) {
    quest::emote(' picks up a small gem tp place inside the handle.');
   }
    if ($wp == 24) {
    quest::spawn2(221013,0,0,-688.3,229.7,-7.7,121.1);
    quest::spawn2(221013,0,0,-714,210.2,-3.8,112.1);
    quest::spawn2(221013,0,0,-734.8,190.4,0.4,112.6);
    quest::spawn2(221013,0,0,-762.4,168.5,5.1,108.4);
    quest::spawn2(221013,0,0,-781.9,159.7,14.7,105.6);
   }
    if ($wp == 28) {
    quest::emote(' kneels down and picks up a dagger blade tip.');
   }
    if ($wp == 36) {
    quest::spawn2(221010,0,0,-1844.5,-9.8,131,190.2);
   }
    if ($wp == 32) {
    quest::spawn2(221012,0,0,-1236.6,-152.6,33.5,92);
    quest::spawn2(221012,0,0,-1229,-123.9,33.7,101.1);
    quest::spawn2(221012,0,0,-1215.9,-94.9,33.3,97.1);
    quest::spawn2(221012,0,0,-1203.4,-62.5,31.7,93.2);
    quest::spawn2(221012,0,0,-1194.6,-34.7,29.7,96.2);
   }
 }
sub EVENT_ITEM{
    if (plugin::check_handin(\%itemcount, 9258 => 1)) {
    quest::emote(' takes the final shard from you and places all of the pieces on the ground, with unseen hands the dagger moves together and fuses itself back together into one complete piece.');
    quest::emote(' picks it up and hands it to you.');
    quest::say("Terris hear me now! I have done as you have called for. My beloved dagger is whole once again! Come now keep up your part of the bargain.");
    quest::spawn2(221001,0,0,-1844.5,-9.8,131,190.2);
    }
  }
sub EVENT_SIGNAL{
   if($signal == 221){
   quest::say("Vile wench, I knew in the end it would come to this. You shall pay dearly for your injustice here.");
   quest::say("So then my hope is nearly lost. Take with you my dagger. Plunge it deep into her soulless heart. If I cannot escape from this plane under her rules, I shall make my own!"); 
   quest::spawn2(221016,0,0,-2124.5,-7.5,133.8,64.9);
   quest::depop();
   }
 }  
sub EVENT_DEATH{
   quest::shout("OH NO! We have failed!");
   quest::movepc(203,-1170.8,667.2,-847.8);
   }
 }





