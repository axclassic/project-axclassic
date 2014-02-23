sub EVENT_SAY{
if ($text=~/hail/i) {
    quest::say("[reset] the global?.");
  }
if ($text=~/reset/i) {
    quest::say("I will clear the Global Dust done... Well I hope.");
    quest::delglobal("dust_done");
  }
}

