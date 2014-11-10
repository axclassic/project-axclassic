sub EVENT_SPAWN{
    quest::shout("Get dem Stoopid Elf");
    quest::settimer("Orc_attack", 120);
    quest::spawn2(54298,260,0,400,0,10,0);
}


sub EVENT_SIGNAL{
 if ($signal == 1){
	quest::shout("More, smash more");
	quest::spawn2(54298,260,0,400,0,10,0);
}
}

sub EVENT_TIMER{
    if($timer eq "Orc_attack"){
        quest::depop(54298);
	quest::depop();
    }
}



