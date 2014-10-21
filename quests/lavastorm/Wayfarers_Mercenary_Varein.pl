sub EVENT_SAY {
   if ($ulevel <= 20 && $text=~/Hail/i) {
   quest::say("I am sorry but I have nothing for you to do, you need to gather more experiance and then return tome when you have improved your skills.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Hail/i){
   quest::say("'Feeling a bit like an outsider? I certainly understand that as part of the brotherhood, though I don't envy you. We've been able to make a good bit o' coin off the Dark Reign. Give us a hand and I'll see about $helping you get inside.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/helping/i){
   quest::say("I have two things you can help me with, $Blood Money or $Spider Webs.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Blood/i){
   quest::say("Those infernal drakes have stolen some of my supplies for the Dark Reign and now I'm short. Hurry along and loot 4 Frothing Drake Blood in Lavaspinner's Lair.");
   quest::say("Return to me with the Frothing Drake Bloods  and I shal reward you.");
   }
   if ($ulevel <= 30 && $ulevel >= 21 && $text=~/Spider/i){
   quest::say("There is a troll shaman charged with creating protective talismans for the Dark Reign. We'll need them against those dragons. They are looking for someone to loot 4 Lavaspinner's Silk in Lavaspinner's Lair. The job is yours is you're willing.");
   quest::say("Collect the 4 Lavaspinner's Silks and return them to me, we shall split the reward."); 
   }
    if ($ulevel >= 31 && $text=~/Hail/i) {
   quest::say("I am afraid I would be waisting your time. Please check with the others as they may have work for someone of your skills.");
   }
 }
sub EVENT_ITEM {
   if ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 54600 => 4)) {   
   quest::say("Good. Good! The Frothing Drake Blood, I will turn these samples over to The Dark Reign and collect our reward.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel <= 30 && $ulevel >= 21 && plugin::check_handin(\%itemcount, 54602 => 4)) {   
   quest::say("Good. Good! The Lavaspinners Silk, This will complete my order for The Dark Reign I will collect our reward.");
   quest::ding();
   quest::exp(5000000);
   quest::givecash(0,0,0,30);
   }
           else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }
 }  