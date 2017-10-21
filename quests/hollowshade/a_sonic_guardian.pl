#angelox
##a_sonic_guardian
sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::emote("growls as it senses the presence of an outsider.");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::emote("sniffs at the ground, picking up the scent of a threat.");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::emote("sniffs at the ground, picking up the scent of a threat.");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::emote("growls as it senses the presence of an outsider.");
    }elsif($combat_state == 1){
    quest::emote("lunges forward, saliva dripping from its fanged jaw.");}
}

sub EVENT_ATTACK{
{quest::emote("lunges forward, saliva dripping from its fanged jaw.");}
}

sub EVENT_DEATH {
    my $random_result = int(rand(100));
    if($random_result<=20){
    quest::emote("whines pitifully as the attack cuts his life short.");
    }elsif($random_result<=40){
    quest::emote("defiantly tries to make one final swipe with its claws.");
    }elsif($random_result<=60){
    quest::emote("collapses, its fur matted with blood.");
    }elsif($random_result<=80){
    quest::emote("staggers for a moment and then collapses.");
    }
}
