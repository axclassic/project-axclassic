#zone:PoKnowledge
#Angelox

sub EVENT_SAY {
    if(($text=~/hail/i)&&($ulevel<= 45)) {
        $npc->SetAppearance(0);
        quest::say("Hello $name, I can buff you with clarity for a fee of 5pp, and my friend over there has cleric buffs.");
        quest::emote("waves at Qadar");
        quest::doanim("29");
    }
    elsif(($text=~/hail/i)&&($ulevel>=46)) {
        $npc->SetAppearance(0);
        quest::say("Hello $name, I can buff you with KEI for a fee of 15pp, and my friend over there has cleric buffs");
        quest::emote("waves at Qadar");
        quest::doanim("29");
    }
    elsif($text=~/Clear Mana/i) {
        quest::say("I will gladly perform this service for you.  Just hand me an Emerald, a Poison Vial and 100 platinum.");
    }
}

sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER {
    $npc->SetAppearance(1);
    my $random_result = int(rand(100));
    if($random_result<=15) {
        quest::shout("Casting KEI and Clarity for donations on the rock behind the main bank!");
    }
}

sub EVENT_ITEM {
    if(($platinum>99) && plugin::check_handin(\%itemcount, 10029 => 1) && plugin::check_handin(\%itemcount, 16965 => 1)) {
        #Emerald and Poison Vial
        quest::selfcast(540); #Clarify Mana
    }
    elsif(($platinum>=15)&&($ulevel>=46)) {
        $npc->SetAppearance(0);
        quest::selfcast(2570);
        quest::say("Casting KEI, Good hunting!");
    }
    elsif(($platinum>=5)&&($ulevel<=45)) {
        $npc->SetAppearance(0);
        quest::selfcast(174);
        quest::say("Casting Clarity, Good hunting!");
    }
    else {
        quest::say("Thank you for your donation $name, it wasn't enough though ...");
    }
}

sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=25) {
        quest::shout("Casting KEI and Clarity for donations on the rock behind the main bank!");
    }
}

