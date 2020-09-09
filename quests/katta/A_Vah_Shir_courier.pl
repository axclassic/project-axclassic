# Rakshasa Skulls

my $x = $npc->GetX();
my $y = $npc->GetY();
my $z = $npc->GetZ(); 
my $h = $npc->GetHeading();
my $dest = 0;
my $rspeed = 1.1;

sub EVENT_SPAWN {
    $rspeed = 1.1;
    quest::settimer("begin_delay", 3);
}

sub EVENT_TIMER {
    if($timer eq "begin_delay") {
        quest::stoptimer("begin_delay");
        quest::modifynpcstat("runspeed", $rspeed);
        quest::moveto(85, -1, 4.1, 125, 1);
        $dest = 1;
        quest::settimer("move_check", 1);
    }
    elsif($timer eq "move_check") {
        quest::stoptimer("move_check");
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        if($dest == 1) {
            $dist = $npc->CalculateDistance(85, -1, $npc->GetZ());
            if($dist <= 1.5) {
                quest::moveto(85, -264, 4.1, 64, 1);
                $dest = 2;
            }
            quest::settimer("move_check", 1);
        }
        elsif($dest == 2) {
            $dist = $npc->CalculateDistance(85, -264, $npc->GetZ());
            if($dist <= 1.5) {
                quest::moveto(140.4, -262.2, 4.1, 29, 1);
                $dest = 3;
                quest::forcedooropen(16);
            }
            quest::settimer("move_check", 1);
        }
        elsif($dest == 3) {
            $dist = $npc->CalculateDistance(140.4, -262.2, $npc->GetZ());
            if($dist <= 1.5) {
                quest::settimer("talk_roshawna", 2);
                $dest = 0;
            }
            else {
                quest::settimer("move_check", 1);
            }
        }
        elsif($dest == 4) {
            $dist = $npc->CalculateDistance(85, -264, $npc->GetZ());
            if($dist <= 1.5) {
                quest::moveto(85, -1, 4.1, 125, 1);
                $dest = 5;
            }
            quest::settimer("move_check", 1);
        }
        elsif($dest == 5) {
            $dist = $npc->CalculateDistance(85, -1, $npc->GetZ());
            if($dist <= 1.5) {
                quest::moveto(-61, -1, 4.1, 120, 1);
                $dest = 6;
            }
            quest::settimer("move_check", 1);
        }
        elsif($dest == 6) {
            $dist = $npc->CalculateDistance(-61, -1, $npc->GetZ());
            if($dist <= 1.5) {
                quest::depop();
            }
            else {
                quest::settimer("move_check", 1);
            }
        }
    }
    elsif($timer eq "talk_roshawna") {
        quest::stoptimer("talk_roshawna");
        quest::say("Sorry for the delay mistress, I ran into a spot of trouble on the way here. I am prepared to deliver your crate to the spiritualists back home.");
        quest::settimer("sig_roshawna", 3);
        quest::doanim(67); # Salute
    }
    elsif($timer eq "sig_roshawna") {
        quest::stoptimer("sig_roshawna");
        quest::signalwith(160126, 2);
    }
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::stoptimer("move_check");
    }
}

sub EVENT_DEATH {
    quest::emote(" has been slain.");
	quest::emote(" slams the crate of skulls against the ground with unnatural force as he falls jarring it open.");
    $npc->NamedEmote("With", " his dying breath the possessed courier mutters a dark incantation and the skulls burst from the chest sprouting new skeletal forms.");
    quest::signalwith(160126, 7);
}

sub EVENT_SIGNAL {
    if($signal == 3) { # Signal to do emote after Rhorer gives the crate over.
        quest::emote(" tucks the crate of skulls under his arm and nods to Roshawna. Suddenly the courier begins to shake, his fur stands on end, and his eyes glaze over expressionlessly.");
        quest::doanim(25); # Stand Arms Out
    }
    if($signal == 4) {
        $npc->NamedEmote("The courier", " runs for the gates of Katta Castellum with an otherworldly howl echoing in his wake.");
        $rspeed = 2.9;
        quest::forcedooropen(16);
        quest::modifynpcstat("runspeed", $rspeed);
        quest::moveto(85, -264, 4.1, 64, 1);
        quest::settimer("move_check", 1);
        $dest = 4;
        quest::signalwith(160126, 6, 3);
    }
}
#END of FILE Zone:katta  ID:160427 -- A_Vah_Shir_courier.pl

