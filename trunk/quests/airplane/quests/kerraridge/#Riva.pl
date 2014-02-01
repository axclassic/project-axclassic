#zone: Kerra
#spawn-checker
#global name:  riva
#Angelox

sub EVENT_SPAWN{
 quest::delglobal("riva");
 quest::setglobal("riva",3,3,"F");
 $riva=undef;
 #quest::settimer("riva1",121); #works
}

sub EVENT_DEATH{
 quest::signalwith(74396,1); # Signal Banker Naudi spawn Skele
}



