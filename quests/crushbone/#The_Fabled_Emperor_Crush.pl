# #The_Fabled_Emperor_Crush (58057)
#Orc chit-chat
#Revised Angelox 10-23-06
#zone: Crushbone
# update depopper script by patrikpatrik 4/10/2017
# Update 8/30/17 Timer stops if engaged and restarts on exit.

sub EVENT_SPAWN {
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	$tempa = $npc->GetNPCTypeID();
	
	if ($tempa == 58057) {
		quest::settimer("fabledcrush", 600); #will remain for 10 minutes
	}
}

sub EVENT_TIMER {
	if($timer eq "fabledcrush") {
		quest::depop();
	}
}

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
	
	if($npc->IsEngaged()) {
		quest::stoptimer($timer);
	} else {
		quest::settimer("fabledcrush", 600);
	}
}

sub EVENT_ATTACK
{quest::say("Centurions!!  Legionnaires!!  Come join the fight!");}

sub EVENT_DEATH
{quest::say("You shall have all the Crushbone orc legions on your tail for my death!");}
