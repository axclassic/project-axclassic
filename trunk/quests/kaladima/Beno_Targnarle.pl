sub EVENT_SAY { 
my $ponder = quest::saylink("ponder", 1);
my $exterminate = quest::saylink("exterminate", 1);
my $metal = quest::saylink("metal", 1);
my $Eye = quest::saylink("Eye", 1);
if($text=~/Hail/i){
quest::say("Step forth. young $name!  I heard that you have come of age!  The spirit of adventure has entered your body.  That is good.  Go and speak with the others.  They shall help you.  I am afraid I have no time to spend conversing.  There is much I have to $ponder.");
}
if($text=~/ponder/i){
quest::say("Must you know everyone's business?  Hmm..  Maybe you can be of assistance.  You see. I have been instructed by Furtog to tend to a matter of extreme urgency. which is keeping me from clearing the mines of rats.  Will you assist and $exterminate the rats?");
}
if($text=~/exterminate/i){
quest::say("Very good!  I shall reward you for every four giant rat pelts returned to me.  And be on the lookout for a $metal rat!");
}
if($text=~/metal/i){
quest::say("I cannot tell you how many reports I have heard of metal rats in Kaladim.  I first thought it was a vision obtained from having too many Tumpy Tonics. but Furtog himself is said to have seen them.  If you ever catch sight of the little metal beast. give chase!!  Return its metal carcass to me and I shall reward you."); 
}
if($text=~/Doran/i){
quest::say("Doran resides on an island in the Ocean of Tears. The island is filled with beautiful maidens. I could think of worse places to live."); 
}
if($text=~/important/i){
quest::say("I am apprehensive about sending one who is so young out into the world, but I have a good feeling about you, $name. Someone has stolen the $Eye of Stormhammer. You must journey to Antonica and go to a place called Highpass Hold. The rogue who has it is locked up in the prison. We have arranged for his extradition to Kaladim. Please give the jail clerk this note of release.");
quest::summonitem(18935); 
}
if($text=~/Eye/i){
quest::say("The great statue of Kazon Stormhammer was once encrusted with two great gems from the mines of Butcherblock. So big were they that it took the magic of the high elves to assist us in lifting them to the statue's face. In the year 2995, somehow, someone stole one of the eyes. We decided to keep the remaining eye in the vault. Now, even that has been stolen from us! Only the most trusted warriors may be involved in this important Stormguard matter."); 
}
}

sub EVENT_ITEM {
my $Doran = quest::saylink("Doran", 1);
my $important = quest::saylink("important", 1);
  if (plugin::check_handin(\%itemcount, 13054 =>4)) {
  quest::say("'Great work, young one! We shall soon rid our mines of these pests. Keep a lookout for that metal rat. Here is a small reward for such fine work. Soon, you shall be know as Kaladim's resident exterminator!");
  quest::ding();
  quest::faction(169, 10);    #kazon stormhammer
  quest::faction(215, 10); 	#merchants of kaladim
  quest::faction(219, 10); 	#miners guild 249
  quest::faction(314, 10);	#storm guard
  quest::faction(57, -10);    #Craknek Warriors
  quest::exp(1000);
  quest::summonitem(10015);
  quest::givecash(0,0,3,0);
}
  elsif (plugin::check_handin(\%itemcount, 13282 =>1)) {
  quest::say("I thank you, my friend. I was to destroy this metal monster months ago. I could never find him. Please accept this reward for such good service. Oh, yes.. And take this card to a man named $Doran Vargnus. He is a fine blacksmith. I am sure he will reward you with one of his finest suits of armor. Perhaps you may now assist in an $important Stormguard matter."); 
  quest::ding();
  quest::faction(169, 10);    #kazon stormhammer
  quest::faction(215, 10); 	#merchants of kaladim
  quest::faction(219, 10); 	#miners guild 249
  quest::faction(314, 10);	#storm guard
  quest::faction(57, -10);    #Craknek Warriors
  quest::exp(1000);
  quest::summonitem(22299);
  quest::givecash(6,0,0,0);
}
  elsif (plugin::check_handin(\%itemcount, 13321 =>1)) {
  quest::say("I can not believe my eyes! You did it, you have returned the missing eye of Stormhammer! you are truly a a great warrior $name.");
  quest::say("For your reward, only a warrior's true weapon designed by the ancient stormguard hero, Jendl Mizebrite will be equal to what you have accomplished.");
  quest::say(" Take this Axe for you are worthy to wield it.");
  quest::ding();
  quest::faction(169, 10);    #kazon stormhammer
  quest::faction(215, 10); 	#merchants of kaladim
  quest::faction(219, 10); 	#miners guild 249
  quest::faction(314, 10);	#storm guard
  quest::faction(57, -10);    #Craknek Warriors
  quest::exp(40000);
  quest::summonitem(5415);
  }
  else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
   quest::say("I have no need of this, take it back.");
}
}
#END of FILE Zone:kaladima  ID:60007 -- Beno_Targnarle 
