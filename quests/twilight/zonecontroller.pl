##zonecontroller.pl ID 170576 in Twilight Sea##
sub EVENT_SIGNAL {
     if($signal == 496) {
	quest::depopall(170570); 
	quest::depopall(170571);
	quest::depopall(170572);
	quest::depopall(170573);
	quest::depopall(170574);
	quest::depopall(170575);
	}
	elsif($signal == 497) {
	quest::spawn2(170570,0,0,1932.1,621.3,28.4,183.6);
	quest::spawn2(170571,0,0,1904.4,666.1,33.6,159.1);
	quest::spawn2(170571,0,0,1871.3,647.8,23.7,171.1);
	quest::spawn2(170571,0,0,1893.3,571.9,24.7,199.3);
	quest::spawn2(170571,0,0,1938.6,574.3,34,202.9);
	}
	elsif($signal == 498) {
	quest::spawn2(170572,0,0,1932.1,621.3,28.4,183.6);
	quest::spawn2(170573,0,0,1904.4,666.1,33.6,159.1);
	quest::spawn2(170573,0,0,1871.3,647.8,23.7,171.1);
	quest::spawn2(170573,0,0,1893.3,571.9,24.7,199.3);
	quest::spawn2(170573,0,0,1938.6,574.3,34,202.9);
	}
	elsif($signal == 499) {
	quest::spawn2(170574,0,0,1932.1,621.3,28.4,183.6);
	quest::spawn2(170575,0,0,1904.4,666.1,33.6,159.1);
	quest::spawn2(170575,0,0,1871.3,647.8,23.7,171.1);
	quest::spawn2(170575,0,0,1893.3,571.9,24.7,199.3);
	quest::spawn2(170575,0,0,1938.6,574.3,34,202.9);
	}
	  else {
	#Do Nothing;
	}
	}