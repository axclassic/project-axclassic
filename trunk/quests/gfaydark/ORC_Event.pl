sub EVENT_SPAWN{
    quest::shout("Get dem Stoopid Elf");
    quest::settimer("Orc_attack", 60);
    quest::spawn2(54298,0,0,400,0,10);
}

sub EVENT_SIGNAL{
 if ($signal == 1){
	quest::spawn2(54298,0,0,400,0,10);
}

sub EVENT_TIMER{
    if($timer eq "Orc_attack"){
        quest::depop(54298);
	quest::depop();
    }
}



