    #wood elf ranger dude
    #npc - Elmion Hendrys
    #zone - Dagnors Cauldron
    #by Angelox -Edited by Aeolwind

    sub EVENT_SAY {
    if($text=~/Hail/i){
    quest::say("How are you?  Please rest.  Have you [been wounded by the beasts] of this region.");
    }
    if($text=~/wounded/i){
    $npc->CastSpell(200,$userid);
    }
    if($text=~/Faldor/i){
    quest::say("Ha!! You seek my foul brother, Faldor Hendrys?!! He is my half brother and has left to live with the vile half of his ancestry in Qeynos. No doubt he has decided to lend his talents to the local thieves guild. Good luck finding him.");
    }
    }

    sub EVENT_SIGNAL {
    quest::say("Pipe down, Ghil!!  We have no quarrel with this adventurer.");
    }

