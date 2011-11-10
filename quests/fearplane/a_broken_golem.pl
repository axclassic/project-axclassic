sub EVENT_ITEM {
#NOTE: this is the wrong gears, should be a special quest item...
	if($itemcount{16858} == 1){
		quest::say("Error! Malfunction! Destroy!");
		quest::say("A $class like you always bring out the worst in me.");
		quest::spawn2(72106,0,0,$x,$y,$z,$h);
		quest::depop();
	}
}