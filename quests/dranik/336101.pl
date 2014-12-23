sub EVENT_SAY {
my $ready = quest::saylink("ready", 1);
 if($text=~/hail/i) {
      quest::say("'Yes, yes, Gilina said you would be coming. I can help you in your battle against Lhranc! I have a personal vendetta against Lhranc. He killed my twin brother, Gilligno. This is going to be a tough battle. Lhranc has been reincarnated as a powerful general of the Mata Muram army. Are you $ready for me to attempt the summoning of Lhranc?");
	  }
	  if($text=~/ready/i) {
	  quest::emote(' throws Lhrancs earthly anchor and the globe of discordant energy above his head. To your amazement, they begin to hover.');
	  quest::say("Oh mighty, Lhranc! We have slain your minions and have the blade that you seek! If you want it, come get it!");
	  quest::emote(' looks your way.');
      quest::say("What? You wanted a more elaborate incantion? It really doesn't take much to anger him. Trust me.");
	  quest::spawn2(336529,0,0,1050.4,2273.6,-26.1,244.4);
	  quest::signalwith(336529,1005,12000);
	  $client->CameraEffect(3000, 6);
	  }
	  }
sub EVENT_SIGNAL {
if ($signal ==1006){
quest::emote(' begins to cower in fear.');
quest::say("The blade isn't mine! Don't kill me! Please!");
	  quest::spawn2(336528,0,0,973.1,2417.3,-26.1,94.4);
	  quest::spawn2(336528,0,0,1013.5,2446.9,-26.1,113.2);
	  quest::spawn2(336528,0,0,959.2,2348,-26.1,38.6);
	  quest::spawn2(336528,0,0,1092,2436.2,-26.1,165);
	  quest::spawn2(336528,0,0,1126.2,2374,-26.1,210.2);
	  quest::spawn2(336528,0,0,1015.6,2296.1,-26.1,254.8);
	  quest::spawn2(336530,0,0,1050.4,2273.6,-26.1,244.4);
	  quest::signalwith(336530,1007,0);
	}
	}