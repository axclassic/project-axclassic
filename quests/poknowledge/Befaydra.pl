#zone:PoKnowledge
#Angelox
#Druid Buffs
#NPC: Befaydra

sub EVENT_SAY { 
    if($text=~/hail/i) {
        $npc->SetAppearance(0);
        quest::say("Hello $name, Any donation you can afford will be ok");
        quest::emote("winks at you");
        $npc->CastSpell(278,$userid);
        quest::say("I also have [PotN] if  you're interested, but you need to at least be level 40");
        quest::selfcast(1569);
    }
    elsif(($text=~/PotN/i)&&($ulevel>=40)) {
        $npc->CastSpell(3234,$userid);
        quest::say("Casting PotN, enjoy!");
    }
}

sub EVENT_SPAWN {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
    $npc->SetAppearance(1);
}

sub EVENT_ENTER {
    my $random_result = int(rand(100));
    if($random_result<=10) {
        quest::shout("Casting SOW for donations up front the main bank, just hail me!");
    }
}

sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=20) {
        quest::shout("Casting SOW for donations up front the main bank! just hail me");
    }
}

