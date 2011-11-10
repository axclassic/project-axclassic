#npc - KerraRidge Guard Protectors
#zone - KerraRidge
#by Angelox

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Well met $name!");
  quest::say("Godspeed!");
 }
}

sub EVENT_COMBAT {
   if($combat_state == 1) {
   quest::say("Now feel the wrath of my sword!!");
   quest::say("For the protection of all Kerranians!");
   quest::say("This town will be a safer place now that we are here!");
   }
}
