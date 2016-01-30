sub EVENT_SAY{
my $dagger = quest::saylink("dagger", 1);
my $help = quest::saylink("help", 1);
my $ready = quest::saylink("ready", 1);

  if ($text=~/Hail/i && $faction < 5){
  quest::say("Who is it? Are you.. really $there? You are! Please I beg of you to help me escape from this horrid place. Terris Thule is holding me here, she delights in the nightmares she sends me. To further torture me, she has offered me a pact. She has said that if I can retrieve my $dagger, then I am free to go. She does this only because she knows that I cannot retrieve it on my own.");
  }
 elsif ($text=~/dagger/i && $faction < 5) {
  quest::say("She has taken the only thing that has brought me any joy in my life. She took it and broke it into seven pieces. She placed them deep within the labyrinth of my nightmare. I must retrieve it, will you $help me. Please I beg of your mercy.");
  } 
 elsif ($text=~/help/i && $faction < 5) {
  quest::say("I do not know who you are, but I am thankful that you have stumbled upon me. I can bring you into my dream state, but my powers are limited so I can only handle eighteen at once. Please when you are prepared have the leader of each of your band of adventurers tell me they are $ready.");
  }
 elsif ($text=~/ready/i && $faction < 5) {
   $npc->SetAppearance(3);#sleeping
  quest::emote("  closes his eyes and falls asleep immediately. He looks peaceful for a moment and then screams in agony!");
  quest::settimer("sleeptimer",10);
  quest::movepc(722,0,0,0);
  }
  else{
   quest::emote(" screams loudly, and then falls asleep once again.");
   quest::settimer("sleeptimer",10);
   $npc->SetAppearance(3);#sleeping
  }
  }
sub EVENT_TIMER{
  if($timer eq "sleeptimer"){
   quest::stoptimer("sleeptimer");
   quest::depop();
  }
}

