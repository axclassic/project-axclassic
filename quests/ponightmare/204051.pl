#Deyid_the_Twisted#
sub EVENT_SPAWN { 
 
 
  quest::setnexthpevent(61); 
 
 
  } 
 
 
sub EVENT_HP { 
if($hpevent == 61){
  quest::spawn2(204351,0,0,922,1028,275.2,58.1); 
  quest::spawn2(204351,0,0,947,1117,272.5,94.4); 
  quest::spawn2(204351,0,0,1031,1164,271.3,135.8); 
  quest::spawn2(204351,0,0,1121,1154,275.3,166.8); 
  quest::spawn2(204351,0,0,1153.7,1038.4,274,207.4); 
  quest::spawn2(204351,0,0,1039.1,969.6,273.5,251.5); 
  quest::signalwith(204353,204,0);
   } 
  }
 
  
sub EVENT_DEATH {
   $client->Message(14,"An eerie silence settles onto the forest as Deyid the Twisted slumps over, defeated");
   quest::depopall(204352);
   quest::depopall(204351);
   quest::signalwith(204347, 5, 1); # Send signal # 5 to Seilaen 1 second after death #
}
