sub EVENT_SPAWN{
    quest::shout("Get dem Stoopid Elf");
    quest::settimer("Orc_attack", 60);
}

sub EVENT_SIGNAL{
 if ($signal == 1){
	quest::spawn(54298,0,0,400,0,60);
}

sub EVENT_TIMER{
    if($timer eq "Orc_attack"){
        quest::spawn(54298,0,0,400,0,60);
        }
        quest::stoptimer($timer);
	quest::depop(54298)
	quest::depop()
    }
}
