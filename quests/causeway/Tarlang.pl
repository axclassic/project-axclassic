##BeginFile: causeway\Tarlang.pl## 
#Quest file for Nobles Causeway - Tarlang (Normal) ##
sub EVENT_SPAWN { 
  quest::settimer("TarlangDepop",3600); 
}  
sub EVENT_TIMER { 
   if($timer eq "TarlangDepop") { 
  quest::stoptimer("TarlangDepop"); 
  quest::depop(); 
  }
 }
sub EVENT_DEATH {
quest::stoptimer("TarlangDepop"); 
quest::depop(303118);
quest::depop(303119);
quest::depop();
}
#EndFile: causeway\Tarlang.pl (303046)
