##Tantho_the_Tormentor 317100 ##
sub EVENT_SPAWN {
quest::shout("Mere mortals? thats who Jelvan call on for help?");
   }
sub EVENT_DEATH {
	quest::shout("Brothers I have failed you!");
	quest::signalwith(317101,392,0);
	}   