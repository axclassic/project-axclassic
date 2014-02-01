# Summoner of Bertox trigger mob

sub EVENT_SIGNAL {

if($signal == 1) {

	quest::settimer(20,7400);
	quest::settimer(21,300);

	}

if($signal == 8) {

	quest::depop();
	
	}
}

sub EVENT_TIMER {

if($timer == 20) {

	quest::signal(200067);
	quest::signal(200068);
	quest::signal(200069);
	quest::signal(200070);
	quest::signal(200071);
	quest::signal(200072);
	quest::signal(200073);
	quest::signal(200074);
	quest::signal(200075);
	quest::signal(200076);
	quest::signal(200077);
	quest::signal(200078);
	quest::signal(200079);
	quest::signal(200080);
	quest::signal(200081);
	quest::signal(200056);

	}
if($timer == 21) {

	quest::spawn2(200069,0,0,0,280,-244,0);
        quest::stoptimer(21);
	}
}