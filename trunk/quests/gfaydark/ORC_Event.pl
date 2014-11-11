sub EVENT_SPAWN{
    quest::shout("Get dem Stoopid Elf");
    quest::settimer("Orc_attack",3600);
    quest::spawn2(54298,260,0,540,2357,30,0);
    quest::spawn2(54298,260,0,389,2333,30,0);
    quest::spawn2(54298,260,0,287,2333,30,0);	
    quest::spawn2(54298,260,0,172,2371,30,0);	
    quest::spawn2(54298,260,0,-150,2391,30,0);
    quest::spawn2(54298,260,0,-230,2371,30,0);
    quest::spawn2(54298,260,0,-376,2400,30,0);
    quest::spawn2(54298,260,0,-483,2368,30,0);
}


sub EVENT_SIGNAL{
 if ($signal == 737){
	quest::shout("More, smash more");
	quest::spawn2(54298,260,0,540,2357,30,0);
        quest::spawn2(54298,260,0,389,2333,30,0);
        quest::spawn2(54298,260,0,-150,2391,30,0);
        quest::spawn2(54298,260,0,-230,2371,30,0);
}

sub EVENT_TIMER{
    if($timer eq "Orc_attack"){
       quest::shout("RETREAT! We shall come when we regroup!");
       quest::depop();
       quest::depop(54298);
    }
}



