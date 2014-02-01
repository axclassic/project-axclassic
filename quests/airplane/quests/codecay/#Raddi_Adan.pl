sub EVENT_SPAWN {

quest::spawn2(200067,0,0,($x + 10),$y,$z,$h);
quest::spawn2(200067,0,0,($x + 10),($y + 10),$z,$h);
quest::spawn2(200067,0,0,($x - 10),$y,$z,$h);
quest::spawn2(200067,0,0,($x - 10),($y - 10),$z,$h);
quest::spawn2(200068,0,0,$x,($y - 10),$z,$h);

}

sub EVENT_DEATH {

	quest::spawn2(200081,0,0,0,-280,-244,0); #South room

}


sub EVENT_SIGNAL {

	quest::depop();

}