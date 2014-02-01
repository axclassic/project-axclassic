sub EVENT_DEATH {
 my $random_result = int(rand(10));
 if($random_result==1) {
   quest::unique_spawn(89192,0,0,546,-592,-50,64); #Froglok_Krup_Watcher
   }
 }
