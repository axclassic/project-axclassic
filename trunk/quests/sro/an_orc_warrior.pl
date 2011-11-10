# NPC: ORC_WARRIOR
# Angelox

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=25)){
    quest::say("'Orc stomp, orc kill - orc weapons, your blood will spill.");
    }elsif(($combat_state == 1) &&($random_result<=50)){
    quest::say("Filth like you must die!");
    }elsif(($combat_state == 1) &&($random_result<=75)){
    quest::say("You have no place in our realm!");
    }elsif(($combat_state == 1) &&($random_result<=100)){
    quest::say("It's Filth like you who have ruined your own lands, You'll not ruin mine!");}
}
# OASIS
