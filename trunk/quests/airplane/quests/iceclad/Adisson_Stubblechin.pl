# Adisson_Stubblechin
# IceClad
# Angelox
sub EVENT_SAY { 
my $random_result = int(rand(100));
if (($text=~/Hail/i) &&($random_result<=50)){
quest::say("Oy!  Don't be thinkin' ya can get down from thar yet ya goblin eatin' barnacle picker! Ya stay on that igloo til we tells ya ta get down!"); }
elsif (($text=~/Hail/i) &&($random_result<=100)){
quest::say("Don't be thinkin' I was forgettin' ya, $name, ya spotty-faced salt licker.  Remember, ya tell us where ya put our rum, an' we let ya out.  Otherwise, ya have ta stay here!"); }
}

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

