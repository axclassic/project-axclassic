# Necromancer Epic NPC -- Drakis_Bloodcaster



sub EVENT_SAY {

  if($text=~/hail/i) {
    quest::say("Greetings, $race. Are you ready to begin?");
 }
  if(($text=~/ready to begin/i) && ($class eq "Necromancer"))  {
    quest::say("Who would you like to be tested by? Jzil or Dugaas?");
 }
      if(($text=~/Jzil/i) && ($class eq "Necromancer")) {
    quest::say("Very well.");
    quest::spawn2(71074,0,0,654.9,1305,-762.2,22);
    quest::depop();
 }
      if(($text=~/Dugaas/i) && ($class eq "Necromancer")) { 
        quest::say("I will summon him for you then.");
        quest::spawn2(71084,0,0,661.6,1302.8,-766.9,254.9);
        quest::depop();
        }
  if(($text=~/ready to begin/i) && ($class ne "Necromancer"))  {
  quest::emote("laughs hysterically.");
  quest::say("Begin what? You don't even know what you're doing here. Begone! Ha!");
  }
}



#END of FILE  Quest by: Solid11  Zone:airplane  ID:71053 -- Drakis_Bloodcaster



