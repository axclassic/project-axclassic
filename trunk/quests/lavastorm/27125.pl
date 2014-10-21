sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
my $Kessdonas = quest::saylink("Kessdonas", 1);
if ($ulevel <= 60 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing you could possibly do. Check with the others in the camp as they may have work that someone of your experiance might be able to help the Dark Reign with.");
   }
  if ($ulevel >= 61 && $text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
  if ($text=~/rumors/i){ 
   quest::say("There are so many reports, I will allow you to choose which one or more you think you can handle.");
   quest::say("Let's see, there is $Kessdonas Perch. Thats the ones I know about but there may be more.");
   }
   if ($text=~/Kessdonas/i){
   quest::say("Perhaps we can appeal to Kessdona to cease the unnecessary violence and bloodshed. She could be the key to stopping Dark Reign. Rumor has it that she is wise beyond all imagination. Ascend to the summit of the snow-capped peak in Stillmoon Temple and deal with her. In case she will not listen to reason, bring a force to defend yourself.");
   quest::say("Bring me proof that you have done this task and I will reward you.");
  }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(100000);
   quest::ding();
   quest::givecash(2,6,5,50);
   } 
    else {
    plugin::return_items(\%itemcount);
    quest::say("I have no use for this.");
   }   
}