##Tanthi_the_Tormentor 317099 ##
sub EVENT_SPAWN {
    quest::modifynpcstat("special_attacks",ABfHG);
    }
sub EVENT_SIGNAL {
    if ($signal == 393) {
	quest::modifynpcstat("special_attacks",UIDfCNTE);
	quest::shout("Who dares to come between the Tormentors and our prey?")
   }
 }
sub EVENT_DEATH {
	quest::shout("You have bested us this time! Beware Jelvan you can not hide from us forever!");
	quest::signalwith(317004,394,5);
	}   
	