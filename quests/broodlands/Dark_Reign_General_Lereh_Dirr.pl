sub EVENT_SAY {
my $rumors = quest::saylink("rumors", 1);
   if ($ulevel <= 40 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Dark Reign.");
   }
   if ($ulevel <= 60 && $ulevel >= 51 && $text=~/Hail/i){
   quest::say("I am sorry but I have nothing that someone of your experiance could possibly handle. Please check with the others in the camp, I am sure they have work that you can do to help the Dark Reign.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
   if ($ulevel >= 61 && $text=~/Hail/i){
   quest::say("Welcome traveler, Have you heard the news? New areas of exploration have been found. Already there are many reports that there is trouble.");
   quest::say("I am looking for adventurers that are willing to face the unknown and see if these $rumors are true.");
   }
   if ($ulevel <= 50 && $ulevel >= 41 && $text=~/rumors/i){
   quest::say("You must travel into the Nest and learn as much as you can about the corruption of the place. There are a number of drakes in the caverns of the Nest that have been twisted somehow. We want you to look for a drake that has been rumored to be altered so significantly that it has unique magic. Go learn more about it and kill it if you can.");
   quest::say("Bring to me a wing fragment as proof.");
   }
   if ($ulevel >= 61 && $text=~/rumors/i){
   quest::say("Perhaps we can appeal to Kessdona to cease the unnecessary violence and bloodshed. She could be the key to stopping Dark Reign. Rumor has it that she is wise beyond all imagination. Ascend to the summit of the snow-capped peak in Stillmoon Temple and deal with her. In case she will not listen to reason, bring a force to defend yourself.");
   quest::say("Bring me proof that you have done this task and I will reward you.");
  }
}
sub EVENT_ITEM { 
if ($ulevel = 41 && plugin::check_handin(\%itemcount, 57205 => 1)) { 
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(639370);
   quest::givecash(0,0,0,30);
   } 
   elsif ($ulevel == 42 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(671710);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 43 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(704470);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 44 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(738010);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 45 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(1629580);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 46 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(869540);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 47 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(908180);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 48 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(947660);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 49 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(987980);
   quest::givecash(0,0,0,30);
   }
   elsif ($ulevel == 50 && plugin::check_handin(\%itemcount, 57205 => 1)) {
   quest::say("Ju`rek has been slain! This is wonderful news. Perhaps with time the evil that lies within may be quelled.");
   quest::ding();
   quest::exp(1029140);
   quest::givecash(0,0,0,30);
   }
elsif ($ulevel == 61 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(2835560);
   quest::ding();
   quest::givecash(0,0,0,60);
   }    
   elsif ($ulevel == 62 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(2950220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }    
   elsif ($ulevel == 63 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3042940);
   quest::ding();
   quest::givecash(0,0,0,60);
   }    
   elsif ($ulevel == 64 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3145220);
   quest::ding();
   quest::givecash(0,0,0,60);
   }    
   elsif ($ulevel == 65 && plugin::check_handin(\%itemcount, 120142 => 1)) { 
   quest::say("So Kessdona would not listen to reason. We hope the reward was worth the effort. Thank you for helping us.");
   quest::exp(3245060);
   quest::ding();
   quest::givecash(0,0,0,60);
   }       
}