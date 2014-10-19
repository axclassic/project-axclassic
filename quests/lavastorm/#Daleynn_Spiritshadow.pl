sub EVENT_SAY {
my $Simple = quest::saylink("Simple", 1);
my $Hour = quest::saylink("Hour", 1);
my $Autum = quest::saylink("Autum", 1);
my $Unguarded = quest::saylink("Unguarded", 1);
my $Scions = quest::saylink("Scions", 1);
my $Splitting = quest::saylink("Splitting", 1);
my $Creator = quest::saylink("Creator", 1);
   if ($ulevel >= 61 && $text=~/Hail/i) {
   quest::say("I have a few missions you could help us with. a $Simple task, Holy $Hour, House of $Autum Rose, Lair $Unguarded, $Scions of Thundercrest, $Splitting the Storm or The $Creator.");
   }
   if ($ulevel >= 61 && $text=~/Simple/i){
   quest::say("I have for you a simple task. Bring me a flower from a garden. Sure, that garden is on a magically floating island. Yes, that island is the lair of an ancient dragon of trendous power. Of course minions will be everywhere, but all we want is one plant. How hard can that be? There is a small tree that grows a rose they call the Dark Lady. They say it has amazing powers. They also say that it is difficult to transport alive. You need to figure out how to do that. They say that if you don't transport it in the right container with the proper fertilizer it will die. No, I don't really know who "they" are, just bring me that rose alive.");
   }
   if ($ulevel >= 61 && $text=~/Hour/i){
   quest::say("We've heard that there is a ritual performed every day on the Thundercrest Isles. It's some sort of worship of Yar`Lir and just about every being on Thundercrest is forced to attend. They say that their combined prayer and worship helps to keep their mistress calm and any day that they do not hold this ritual terrible storms rage across the floating islands, often hitting the Broodlands as well. We've heard that many of the goblins working on Thundercrest were sent there as much to take part in this ritual as to do labor. We want you to prevent or disrupt the ritual today so that our agents can use the cover of a storm to do some work. When you are ready, go to the Broodlands and find a way into Thundercrest. We need you to stop the residents from getting across the bridge to the place they call the Halls of History where this worship takes place."); 
   }
   if ($ulevel >= 61 && $text=~/Autum/i){
   quest::say("An ancient clan of goblin ninjas practices on the floating Thundercrest Isle. Known as the House of the Autumn Rose, these goblins are rarely seen and leave few witnesses of their bloody assassinations. The only warning they give of their attacks is to deliver a single rose to their chosen victim. Officer Vacax_Rol'Tas found one such rose on his pillow when he awoke this morning. I need you to venture onto the isle and infiltrate the House of the Autumn Rose. Stop the assassins by any means necessary and, if possible, figure out who paid to have our Officer killed."); 
   }
   if ($ulevel >= 61 && $text=~/Unguarded/i){
   quest::say("Our scouts have seen Yar`Lir up in the clouds causing terrible storms. We need you to break into her lair and destroy some statues while she is gone. We've heard that these iron statues have been specially created to help her control her storm powers when she sleeps so that they do not wreak havoc on the Broodlands. Destroy them and you may help sow confusion among our enemies. We have it on good authority that the gate that bars the bridge to her lair is closed when she leaves. There is a three-part magical key in the form of small draconic statues that can open the gate if there is need. If one creature holds all three keys the gate will unlock. Find those statues to get into the lair. We're pretty sure they are held by minions in the maze."); 
   quest::say("Take this container and combine the 3 keys in it to create the key to access yar' Lirs Lair");
   quest::summonitem(60265);
   }
   if ($ulevel >= 61 && $text=~/Scions/i){
   quest::say("You are amongst the first to travel into the very depths of Yar`Lir's lair and this is your chance to strike against her. Legend has it that there are three deadly scions that she controls. It is said that these scions can be commanded via three tomes of knowledge that are scattered amongst only the best and brightest within her collective.");
   quest::say("Once you find the three tomes, read the passage to the correct scion and destroy the scion. Return to me with the 3 tomes as proof and you shall be rewarded.");
   }
   if ($ulevel >= 61 && $text=~/Splitting/i){
   quest::say("Time is of the utmost importance! Your help is needed to rescue someone who has been taken by the minions of Yar`Lir. When she was taken is not entirely clear, but if you do not act quickly she will be tortured and possibly killed."); 
  }
  if ($ulevel >= 61 && $text=~/Creator/i){
   quest::say("We have word of a creator of statues within the isles of Thundercrest. We're not yet sure who is commissioning these creatures for the dragon that resides there, but we do not know that not all are yet functioning as they should be."); 
  }
 }
sub EVENT_ITEM {
   if ($ulevel >= 61 && plugin::check_handin(\%itemcount, 120153 => 1, 120154 => 1)) {
   quest::say("Yar`Lir doesn't stand a chance now, especially against someone as powerful as you. Dragons cannot hope to live forever and now is their dying hour. Well done against those generals and their guards!");
   quest::ding();
   quest::exp(30000000);
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 81902 => 1)) {
   quest::say(".");
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   } 
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 81009 => 1)) {
   quest::say("Excellent work, my friends. Officer Vacax_Rol'Tas hasn't rested since he found that rose in his quarters. It's too bad the Norrath Keeper cowards hire goblin assassins to do their dirty work; I would like to see them try to confront us directly. No matter, we will crush them on the field of battle soon enough.");
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 81891 => 1, 81892 => 1, 81890 => 1)) {
   quest::say("Excellent work, my friends.Now that we have the Statues in our possession, that should calm the storms over Broodlands.");
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   } 
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 60258 => 1, 60260 => 1, 60259 => 1)) {
   quest::say("You have done well to find the tomes of the scions and use the very power that they were instilled with by Yar`Lir against them. Their deaths will leave an invaluable hole in her operations that you will be able to exploit in the time to come. Keep on your toes, however. Yar`Lir is a powerful being and has no doubt seen your attempts to destroy her and her kind.");  
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 120167 => 1)) {
   quest::say("Hmmff, I have no use for this thing, I am not sure why I sent you to resque he, this does nothing to benefit the Dark Reign.");
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
   elsif ($ulevel >= 61 && plugin::check_handin(\%itemcount, 60257 => 1)) {
   quest::say("The Crystal! The Dark Reign can create our own Sentinals! The Keepers of Norrath will surely be on the losing end of the battle now..");
   quest::exp(40000000);
   quest::ding();
   quest::givecash(0,0,0,60);
   }
}   