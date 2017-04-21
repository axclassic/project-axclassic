##Tanthu_the_Tormentor 317101 ##
sub EVENT_SPAWN {
   quest::modifynpcstat("special_attacks",ABfHG);
    }
sub EVENT_SIGNAL {
    if ($signal == 392) {
	quest::modifynpcstat("special_attacks",UIDfCNTE);
	quest::shout("Extra souls for the taking!")
   }
 }   
sub EVENT_DEATH {
	quest::shout("NO! This can not be!");
	quest::signalwith(317099,393,0);
	}   