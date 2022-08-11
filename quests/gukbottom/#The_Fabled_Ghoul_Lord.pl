# #The_Fabled_Ghoul_Lord (66181)
# depopper script by Congdar 08/10/2022

sub EVENT_SPAWN {
	my $x1 = $npc->GetX();
	my $y1 = $npc->GetY();
	quest::set_proximity($x1 - 150, $x1 + 150, $y1 - 150, $y1 + 150);
}

sub EVENT_ENTER {
    quest::shout("Do NOT come too close or I will kill you!");
    quest::shout("Do NOT come too close or I will kill you!");
    quest::shout("Do NOT come too close or I will kill you!");
    quest::shout("Do NOT come too close or I will kill you!");
    quest::settimer("fableddepop", 300); #will attack in 5 minutes
    quest::shout("You must fight me within 5 minutes or I will leave!");
    quest::shout("If you move back to a safe distance, I will stay.");
}

sub EVENT_EXIT {
    quest::stoptimer("fableddepop");
    quest::shout("You have moved back to a safe distance. I will remain for the time being.");
}

sub EVENT_COMBAT {
	if($npc->IsEngaged()) {
        quest::stoptimer("fableddepop");
	}
}

sub EVENT_TIMER {
    if($timer eq "fableddepop") {
        quest::depop();
    }
}

