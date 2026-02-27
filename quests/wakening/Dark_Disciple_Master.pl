# Dark_Disciple_Master (119165)
#

#-- Dark Disciple Master event in Wakening Lands // Cleric 1.5 Epic Quest // Harmony of the Soul // -- Drogerin

my $addspawn = 1;

sub EVENT_SPAWN {
    quest::emote(" glances at you, and you see a moment of recognition flash across his face. 'Fool! Do you know who that is? You have jeopardized everything and you shall pay with your life.' He turns to Plavo and slashes his throat quickly with the tips of his fingers. 'Now, on to you. You will not foil my plans again! Your life ends here!");
    $addspawn = (61 + int(rand(10)));
    quest::setnexthpevent($addspawn);
    quest::settimer("depop", 1800); #--Despawn after 30 minutes
}

sub EVENT_HP {
    if($hpevent == $addspawn) {
        quest::say("You actually expect to win? Flee now and I will spare your lives.");
        quest::spawn2(119177,0,0,$x+15,$y+15,$z,0); #--Plavo`s Remains
        quest::setnexthpevent(30);
    }
    elsif($hpevent == 30) {
        quest::emote(" chants for a moment, animating fallen soldiers from the ground around him.");
        quest::spawn2(119178,0,0,$x+15,$y+15,$z,0); # Minion_of_the_Master
        quest::spawn2(119178,0,0,$x-15,$y+15,$z,0); # Minion_of_the_Master
        quest::spawn2(119178,0,0,$x+15,$y-15,$z,0); # Minion_of_the_Master
        quest::setnexthpevent(20);
    }
    elsif($hpevent == 20) {
        quest::spawn2(119178,0,0,$x+15,$y+15,$z,0); # Minion_of_the_Master
        quest::spawn2(119178,0,0,$x-15,$y+15,$z,0); # Minion_of_the_Master
        quest::spawn2(119178,0,0,$x+15,$y-15,$z,0); # Minion_of_the_Master
        quest::say("You have underestimated me! I will not fall this day!");
        $npc->SendBeginCast(1248, 1);
        quest::castspell(1248, $npc->GetID()); #-- Spell: Spiritual Echo
        quest::setnexthpevent(18);
    }
    elsif($hpevent == 18) {
        $npc->SendBeginCast(4746, 1);
        quest::castspell(4746, $npc->GetID()); #-- Spell: Protection of Discord III
    }
}

sub EVENT_DEATH {
    quest::emote(" screams in pain! No! This cannot be! I will not fall! Do not think that this is the end!");
    quest::spawn2(119179,0,0,$x,$y,$z,0); #-- a gilded chest
}

sub EVENT_TIMER {
    quest::stoptimer("depop");
    quest::depopall(119178);
    quest::depopall(119177);
    quest::depop();
}

