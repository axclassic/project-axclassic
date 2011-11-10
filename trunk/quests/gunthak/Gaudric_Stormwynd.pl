#zone: gunthak NPC: Gaudric_Stormwynd (224193)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::emote("motions for silence. 'Can you hear it?  The sound of nature crying out in pain. The children of Karana long for a release from this place of torment.' Gaudric turns away and appears to begin meditating."); 
  #quest::say("Can you hear it?  The sound of nature crying out in pain. The children of Karana long for a release from this place of torment.");
 }
}