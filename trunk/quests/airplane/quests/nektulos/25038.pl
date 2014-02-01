# Guards
# Nektulos
# Angelox

sub EVENT_ITEM {
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
    quest::say("Prepare to meet the skilled fury of a Neriak Dragoon");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("Your actions and history are a personal affront to all I stand for!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("Die, like the fool you are!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Your intolerable reputation insults all in this realm!");
    }elsif($combat_state == 1){
    quest::say("I shall bathe in your blood!");}
}

sub EVENT_DEATH{
   quest::say("Start digging your grave. The Indigo Brotherhood shall find you.");
   quest::emote("'s corpse drops to the ground.");
 }


