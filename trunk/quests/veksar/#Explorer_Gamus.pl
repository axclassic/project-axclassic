# Angelox

sub EVENT_ATTACK{
 quest::emote("hisses at you, its sharp teeth gnashing for your flesh!");
}

sub EVENT_DEATH{
 quest::delglobal("rage2");
 quest::setglobal("rage2",2,3,"F");
 $rage2=undef;
}

# EOF zone: veksar NPCs: spawn Explorer_Gamus