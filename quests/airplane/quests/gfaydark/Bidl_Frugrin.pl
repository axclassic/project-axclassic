#########################################################
# Bidl Frugrin (ID:54297)
# Zone:   Greater Faydark (gfaydark)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#edited by Threeflies 2012 -jan
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("Greeting. Do not you find the wine of Kelethin as sweet as their women?");
   }
   if($text=~/lens/i){
      quest::say("Oh my!! I forgot I had that. Here you are. You better take it back I need to go elsewhere, bye now.");
      quest::summonitem(13276); #telescope lens [bidl's lens]
   }
}


sub EVENT_ITEM { ## Angelox
my $owner = $npc->GetOwnerID();
if ($owner > 0) {
}
else {
quest::say("I have no use for this");
plugin::return_items(\%itemcount);}
}

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("The time has come for you to die!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("It is unwise of you to try that!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("How dare you attack me!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("The spirits will condem you!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
 quest::emote("'s corpse drops to the ground.");
 }

#END of FILE Zone:gfaydark  ID:54297 -- Bidl_Frugrin

