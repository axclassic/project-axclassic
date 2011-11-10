#zone: gunthak - NPC: Researcher_Alvarik (224211)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
   quest::say("Hello there.  Are you too a student of the arcane?");
}elsif ($text=~/arcane/i){
    quest::say("I hold myself as a master of researching the arcane.  Even though I study mainly in the art of wizardry, I still carry the tomes of the other realms.  If you are a master of research and would like to borrow a copy of the research tome, let me know what school of magic you belong to and I may be able to help you out.  I also carry with me hand copied works of the masters.  If you like you can buy one from me for a small fee.");
 }
}

