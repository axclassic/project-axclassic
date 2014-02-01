#zone: gunthak NPC: Xoomix_Haroinoddin
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("glances up from the book she is reading and looks you over. 'If you are looking for the. . . Ahem. . . Library, it is the building to my right.  Now if you'll excuse me I have some reading to do..");
 # quest::say("If you are looking for the. . . Ahem. . . Library, it is the building to my right.  Now if you'll excuse me I have some reading to do.");
 }
}