# Kirak_Vil (25166)

sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Begone from my sight, whelp! Do not try my patience or I may forget my quest and slay you where you stand. I seek the challenge of a [hypocrite] today.");
    }
    if($text=~/hypocrite/i) {
        quest::say("Need you ask? This day I will slay one of those self-righteous Paladins and earn the rank of Dragoon!");
    }
    if($text=~/I am a paladin/i) {
        quest::modifynpcstat("special_attacks", SECD);
        quest::attack($name);
    } 
}

sub EVENT_DEATH {
    quest::say("Start digging your grave. The Indigo Brotherhood shall find you.");
}

