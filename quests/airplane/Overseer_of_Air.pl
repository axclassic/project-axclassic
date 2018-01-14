sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("So you have awakened me!! It seems my brother was not much of a challenge. Before we get on to business, there are some matters that must be addressed. But enough talk, let's address these matters first.");
   }
   if($text=~/matters/i) {
      quest::say("The matter at hand is where you are to go after this. I believe that crazy halfling will be showing up. But if by chance he oversleeps, there is some information you should have.");
   }
   if($text=~/information/i) {
      quest::say("You have come to my home. This is also home to the soul carriers and essence harvesters. On the mortal plane, they are still natural enemies, but have learned to live together and are now peaceful creatures here in the Plane of Sky. Be forewarned that as you proceed about your tour, each gate you must reach and pass through will become substantially harder.");
   }
}

sub EVENT_COMBAT {
   if($npc->IsEngaged()) {
      quest::settimer("ooadt", 45);
      my $targetmob1 = $npc->GetHateTop();
      my $targetid1 = $targetmob1->GetID();
      quest::castspell(982, $targetid1);
   }
   else {
      quest::stoptimer("ooadt");
   }
}

sub EVENT_TIMER {
   if($timer eq "ooadt") {
      my $targetmob2 = $npc->GetHateTop();
      my $targetid2 = $targetmob2->GetID();
      quest::castspell(982, $targetid2);
   }
}

sub EVENT_DEATH {
   quest::spawn2(71060,55,0,-1462.2,-270.1,1250.9,62.9);
}
# Overseer_of_Air NPCID: 71034

