#BeginFile: causeway\#Tarlang.pl 
#Quest file for Nobles Causeway - Tarlang Bot Necromancer Epic 2.0 (Deathwhisper)

sub EVENT_SPAWN { 
  quest::shout("Fool! You think you have what it takes to destroy me? I shall feast on your bones!");
  quest::settimer("TarlangDepop",3600); 
  } 

sub EVENT_TIMER {
if($timer eq "TarlangDepop") { 
  quest::stoptimer("TarlangDepop");
  quest::depop(303119);
  quest::depop(303046);  
  quest::depop(); 
 } 
}

#EndFile: causeway\#Tarlang.pl 
