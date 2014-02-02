#################################
#Stage one of Grokal line       #
#Betrayal Quest Line Phase 4    #
#Resqu Miplez                   #
#Date 5/5/13                    #
#################################

sub EVENT_SAY{

if ($text=~/hail/i){
 quest::say (" Go $race! I have no time for you.");
}
if ($text=~/know/i){ 
 quest::say ("You know nothing! But what you do know will be lost to this world!");
 quest::depop_withtimer(); 
 quest::spawn2(87157,0,0,$x,$y + 5,$z,$h); #Grokal
}
if ($text=~/grokal/i){ 
 quest::say ("You know nothing! But what you do know will be lost to this world!");
 quest::depop_withtimer();
 quest::spawn2(87157,0,0,$x,$y + 5,$z,$h); #Grokal
}
}
