##Vaion 211149##
sub EVENT_SPAWN{
$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::setnexthpevent(50);
    }
sub EVENT_ENTER {
     quest::shout("You think you are a match for the Master of Deceit? We shall see!");
	 } 
sub EVENT_HP{
if($hpevent == 50){
quest::spawn2(211144,0,0,-1593,1735,1,64);
quest::spawn2(211145,0,0,-1593,1778,1,64);
quest::spawn2(211146,0,0,-1593,1821,1,64);
quest::spawn2(211147,0,0,-1593,1864,1,64);
quest::spawn2(211148,0,0,-1593,1907,1,64);
quest::spawn2(211144,0,0,-1593,1950,1,64);
quest::spawn2(211145,0,0,-1593,1993,1,64);
quest::spawn2(211146,0,0,-1593,2036,1,64);
quest::spawn2(211147,0,0,-1593,2079,1,64);
quest::spawn2(211148,0,0,-1641,1735,1,64);
quest::spawn2(211144,0,0,-1641,1778,1,64);
quest::spawn2(211145,0,0,-1641,1821,1,64);
quest::spawn2(211146,0,0,-1641,1864,1,64);
quest::spawn2(211147,0,0,-1641,1907,1,64);
quest::spawn2(211148,0,0,-1641,1950,1,64);
quest::spawn2(211144,0,0,-1641,1993,1,64);
quest::spawn2(211145,0,0,-1641,2036,1,64);
quest::spawn2(211146,0,0,-1641,2079,1,64);
quest::spawn2(211147,0,0,-1689,1735,1,64);
quest::spawn2(211148,0,0,-1689,1778,1,64);
quest::spawn2(211144,0,0,-1689,1821,1,64);
quest::spawn2(211145,0,0,-1689,1864,1,64);
quest::spawn2(211146,0,0,-1689,1907,1,64);
quest::spawn2(211147,0,0,-1689,1950,1,64);
quest::spawn2(211148,0,0,-1689,1993,1,64);
quest::spawn2(211144,0,0,-1689,2036,1,64);
quest::spawn2(211145,0,0,-1689,2079,1,64);
quest::spawn2(211146,0,0,-1737,1735,1,64);
quest::spawn2(211147,0,0,-1737,1778,1,64);
quest::spawn2(211148,0,0,-1737,1821,1,64);
quest::spawn2(211144,0,0,-1737,1864,1,64);
quest::spawn2(211145,0,0,-1737,1907,1,64);
quest::spawn2(211146,0,0,-1737,1950,1,64);
quest::spawn2(211147,0,0,-1737,1993,1,64);
quest::spawn2(211148,0,0,-1737,2036,1,64);
quest::spawn2(211144,0,0,-1737,2079,1,64);
quest::ze(14,"Well done mortals, We shall meet again and I will show you my true power!");
quest::signalwith(211151,222,0);
quest::depop();
}
}