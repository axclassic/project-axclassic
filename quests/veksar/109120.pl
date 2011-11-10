# Global Setter
# Angelox

sub EVENT_SPAWN
{
 quest::delglobal("rage");
 quest::setglobal("rage",2,3,"F");
 $rage=undef;
 quest::delglobal("rage2");
 quest::setglobal("rage2",2,3,"F");
 $rage2=undef;
 quest::delglobal("rage3");
 quest::setglobal("rage3",2,3,"F");
 $rage3=undef;
}

# EOF zone: Veksar

