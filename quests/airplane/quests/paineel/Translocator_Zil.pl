sub EVENT_SAY(){
  if ($text=~/hail/i){
  quest::say("Those other Erudites in Erud have taken a cheap shot at us and have magically sealed the lift. Our spellcasters are currently working on reversing the curse. It may take some time, however so in the meanwhile show me your key and I will teleport you outside the city.");
  }
}

sub EVENT_ITEM {
  if($itemcount{6378} == 1){
  quest::summonitem(6378);
  quest::say("Very well.");
  quest::movepc(75, 441.39, 650.21, -24.25);}
}