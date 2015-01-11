#BeginFile: causeway\Tarlang.pl 
#Quest file for Nobles Causeway - Tarlang (Passive): Necromancer Epic 1.5 (Soulwhisper) 

sub EVENT_SAY { 
   if($text=~/hail/i) { 
   quest::say("Fool! You think you have what it takes to destroy me? I shall feast on your bones!");   
   quest::spawn2(303118,0,0,1363,-146,316.8,147.5); #Tarlang (Active) 
   quest::depop(); 
  } 
} 


#EndFile: causeway\Tarlang.pl (303046)