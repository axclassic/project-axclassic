sub EVENT_SAY {
my $attacks = quest::saylink("attacks", 1);
my $mercenaries = quest::saylink("mercenaries", 1);
my $help = quest::saylink("help", 1);
  if ($text=~/hail/i) {
  quest::say("What's that? Oh, I'm sorry I've been preoccupied with the recent $attacks as of late.");
  }
  if ($text=~/attacks/i) {
  quest::say("You don't know? I thought everyone was aware now. It seems as though, there have been $mercenaries doing horrible things to the city.");
  } 
  if ($text=~/mercenaries/i) {
  quest::say("They wear the bands of Xyzith's troop. Unfortunately, War Baron Eator doesn't believe that the situation has gotten this bad. If only someone was able to find a way to $help show him how bad the issue is."); 
  }
  if ($text=~/help/i) {
  quest::say("Will you now? That is good. Bring me the bands and we will take it from there."); 
  }
 }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 48022 =>1, 48023 =>1, 48024 =>1 )) { 
    quest::say("What's this? I see you have the proof that I have been looking for. Take this note and speak to Drill Master Kyg. She is a stubborn one but true to keeping the Legion safe."); 
    quest::ding();
    quest::exp(2000);
    quest::summonitem(48025);
    quest::faction( 193,1 );
    quest::faction( 30,1 );
    quest::faction( 282,1 );
    quest::faction( 62,1 );
    quest::faction( 317,1 );
  }
}