##Keldovan_the_Harrier 317005 is the first encounter in the Asylum of Anguish raid expedition. ##

my $dead_dogs = 0;
my $torment_enabled = 1;
my $touch_enabled = 1;

sub EVENT_SPAWN {
    quest::settimer("decrease_dog", 90);
}

sub EVENT_COMBAT {
    if($npc->IsEngaged()) {
        quest::say("You have earned the right to die at my feet.");
        quest::stoptimer("depop_dogs");
        quest::spawn2(317122, 0, 0, -37.2, 751.2, -244.5, 218.5);
        quest::spawn2(317123, 0, 0, -30.5, 651.2, -244.5, 169.1);
        quest::spawn2(317124, 0, 0,  44.3, 656.1, -244.5, 97   );
        quest::spawn2(317125, 0, 0,  40.9, 748.5, -244.5, 30.3 );
        quest::settimer("packmaster", (6 + int(rand(25))));
        quest::settimer("torment", (6 + int(rand(25))));
        quest::settimer("touch", (6 + int(rand(25))));
        quest::settimer("aggro_link", 1);
        quest::settimer("say", 300);
	}
    else {
        quest::settimer("depop_dogs", 6);
        quest::stoptimer("packmaster");
        quest::stoptimer("aggro_link");
        quest::stoptimer("torment");
        quest::stoptimer("touch");
        quest::stoptimer("say");
	}
}

sub check_dogs {
    $inc_or_dec = $_[0];
	if($dead_dogs <= 1) {
        quest::modifynpcstat("mr", "800");
        quest::modifynpcstat("fr", "800");
        quest::modifynpcstat("cr", "800");
        quest::modifynpcstat("pr", "800");
        quest::modifynpcstat("dr", "800");
        quest::modifynpcstat("slow_mitigation", "85");
        $torment_enabled = 1;
        $touch_enabled = 1;
        quest::modifynpcstat("accuracy", "300");		
		if($inc_or_dec < 0) {
            if($npc->IsEngaged()) {
                $entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier regains his magical aura of defense.");
            }
        }
    }
	elsif($dead_dogs == 2) {
		if($inc_or_dec > 0) {
            quest::modifynpcstat("mr", "265");
            quest::modifynpcstat("fr", "205");
            quest::modifynpcstat("cr", "265");
            quest::modifynpcstat("pr", "265");
            quest::modifynpcstat("dr", "240");
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier reels in pain as his protection from magic wavers.");
        }
		else {
            quest::modifynpcstat("slow_mitigation", "85");
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier begins to quicken his attacks again.");
        }
    }
	elsif($dead_dogs == 3) {
		if($inc_or_dec > 0) {
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier howls as his protection from slow dwindles.");
            quest::modifynpcstat("slow_mitigation", "40");
        }
		else {
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier seems to regain his awareness.");
            $torment_enabled = 1;
            $touch_enabled = 1;
        }
    }
	elsif($dead_dogs == 4) {
		if($inc_or_dec > 0) {
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier appears less able to sense those around him.");
            $torment_enabled = 0;
            $touch_enabled = 0;
        }
		else {
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier regains his combat stance.");
            quest::modifynpcstat("accuracy", "300");
        }
    }
	elsif($dead_dogs == 5) {
		if($inc_or_dec > 0) {
			$entity_list->MessageClose($npc, 1, 200, 15, "Keldovan the Harrier shakes as he loses some of his ability to focus his attacks.");
            quest::modifynpcstat("accuracy", "200");
        }
    }
}

sub EVENT_TIMER {
    if($timer eq "depop_dogs") {
        quest::stoptimer("depop_dogs");
        quest::depop(317122);
        quest::depop(317123);
        quest::depop(317124);
        quest::depop(317125);
        $dead_dogs = 0;
    }
	elsif($timer eq "decrease_dog") {
        if($dead_dogs >= 5) {
			$dead_dogs = 4;
        }
		elsif($dead_dogs == 4) {
			$dead_dogs = 3;
        }
		elsif($dead_dogs == 3) {
			$dead_dogs = 2;
        }
		elsif($dead_dogs == 2) {
			$dead_dogs = 1;
        }
		else {
			$dead_dogs = 0;
        }
		check_dogs(-1);
    }
	elsif($timer eq "317122") {
		quest::stoptimer("317122");
		quest::spawn2(317122, 0, 0, -37.2, 751.2, -244.5, 218.5);
    }
	elsif($timer eq "317123") {
		quest::stoptimer("317123");
		quest::spawn2(317123, 0, 0, -30.5, 651.2, -244.5, 169.1);
    }
	elsif($timer eq "317124") {
		quest::stoptimer("317124");
		quest::spawn2(317124, 0, 0, 44.3, 656.1, -244.5, 97);
    }
	elsif($timer eq "317125") {
		quest::stoptimer("317125");
		quest::spawn2(317125, 0, 0, 40.9, 748.5, -244.5, 30.3);
    }
    elsif($timer eq "say") {
        quest::say("You have earned the right to die at my feet.");
    }
    elsif($timer eq "packmaster") {
        $SpellTarget = $npc->GetTarget();
        if($SpellTarget) {
            # Spell: Packmaster's Curse
            $npc->SendBeginCast(4720, 0);
            quest::castspell(4720, $SpellTarget->GetID());
        }
		quest::settimer("packmaster", 30); 
    }
    elsif($timer eq "torment") {
        if($torment_enabled == 1) {
            $SpellTarget = $npc->GetTarget();
            if($SpellTarget) {
                # Spell: Torment of Body
                $npc->SendBeginCast(5676, 0);
                quest::castspell(5676, $SpellTarget->GetID());
            }
        }
        quest::settimer("torment", 60);
    }
	elsif($timer eq "touch") {
        if($touch_enabled == 1) {
            $SpellTarget = $npc->GetTarget();
            if($SpellTarget) {
                # Spell: Touch of Anguish
                $npc->SendBeginCast(5679, 0);
                quest::castspell(5679, $SpellTarget->GetID());
            }
        }
        quest::settimer("touch", 45);
    }
	elsif($timer eq "aggro_link") {
        quest::settimer("aggro_link", 15);
        my $thisDog = $entity_list->GetMobByNpcTypeID(317122);
        if($thisDog) {
            DogAggro($thisDog, $npc->GetID());
        }
        $thisDog = $entity_list->GetMobByNpcTypeID(317123);
        if($thisDog) {
            DogAggro($thisDog, $npc->GetID());
        }
        $thisDog = $entity_list->GetMobByNpcTypeID(317124);
        if($thisDog) {
            DogAggro($thisDog, $npc->GetID());
        }
        $thisDog = $entity_list->GetMobByNpcTypeID(317125);
        if($thisDog) {
            DogAggro($thisDog, $npc->GetID());
        }
    }
}

sub DogAggro {
    if(!$_[0]->IsEngaged()) {
        $_[0]->SetFollowID($_[1]);
        my $HateTarget = $npc->GetHateRandom();
        if($HateTarget) {
            $_[0]->AddToHateList($HateTarget, 100);
        }
    }
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::settimer("317122", 3);
    }
	elsif($signal == 2) {
		quest::settimer("317123", 3);
    }
	elsif($signal == 3) {
		quest::settimer("317124", 3);
    }
	elsif($signal == 4) {
		quest::settimer("317125", 3);
    }
	quest::settimer("decrease_dog", 45);
    $dead_dogs = $dead_dogs + 1;
	check_dogs(1);
}

sub EVENT_DEATH {
    quest::ze(15, "The air around you vanishes as Keldovan gasps for his last breath.");

    # signal event_status 317117
    quest::signalwith(317117, 317005);
}

