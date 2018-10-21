##Old_Lady_Einarr ID 13149 northkarana ##
sub EVENT_SAY { 
   my $wisdom = quest::saylink("wisdom", 1);
 
    if($text=~/Hail/i && defined $qglobals{"Thankslady"} == 1) {
	quest::say("Hello $name. Is it $wisdom you seek?");
	}
	elsif($text=~/wisdom/i && defined $qglobals{"Thankslady"} == 1) {
	quest::say("Summoning wild turkey is no easy task. Our scarecrow knew the way, though. It's too bad he was kidnapped and taken South!");
	quest::delglobal("Thankslady");
	quest::setglobal("Thanksscarecrow", 1, 5, "F");
	}
	else {
	quest::say("Do I know you? I dont talk to strangers.");
    }
 }	