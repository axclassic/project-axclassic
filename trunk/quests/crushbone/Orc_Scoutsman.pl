#Orc chit-chat
#Revised Angelox 10-23-06
#zone: Crushbone

sub EVENT_COMBAT{
    my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=20)){
    quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
    }elsif(($combat_state == 1) &&($random_result<=40)){
    quest::say("You've ruined your lands. You'll not ruin mine!");
    }elsif(($combat_state == 1) &&($random_result<=60)){
    quest::say("Hail, Emperor Crush!!");
    }elsif(($combat_state == 1) &&($random_result<=80)){
    quest::say("Fall before the might of Clan Crushbone!!");
    }elsif($combat_state == 1){
    quest::say("Humans kill humans, apes do not kill apes!");}
}

sub EVENT_ATTACK
{quest::say("Centurions!!  Legionnaires!!  Come join the fight!");}

sub EVENT_DEATH
{quest::say("You shall have all the Crushbone orc legions on your tail for my death!");}
