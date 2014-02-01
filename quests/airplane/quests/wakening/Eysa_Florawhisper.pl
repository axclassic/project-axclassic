# Dolvak's Report
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("A pleasure to meet you. I am Countess Eysa Florawhisper of the Tunarean Court. Are you a friend of the court?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29067 => 1)) {
    quest::emote("looks over the report you have given her. She glances up at you with a suspicious eye, as though she doesn't fully trust you. 'I was supposed to meet with Dolvak on this matter, as he is the liason between the shrine and the court. Instead he sent you with this report? I guess I have no choice but to trust you are a friend of the shrine, as the seal bears its mark on this parchment. These papers show the Tunarean Court's progress with the giants so far. Do you have any idea why this report is so important?'");
    quest::summonitem(29623);
    quest::faction(344,10); #tunarean court
    quest::depop();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: wakening ID: 119081 NPC: Eysa_Florawhisper

