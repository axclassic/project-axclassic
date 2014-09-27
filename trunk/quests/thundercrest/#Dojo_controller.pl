my $dojo_event = 0;

 
  sub EVENT_SPAWN {
  $dojo_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 121) {
	quest::signalwith(340038,122,1); #tell Storm Reach Sensei to speak
	}
	if ($signal == 123) {
	quest::signalwith(340038,124,1); #tell Storm Reach Sensei to speak
	}
	if ($signal == 125) {
	quest::signalwith(340038,126,1); #tell Storm Reach Sensei to speak
	}
  	if ($signal == 222) {
	quest::spawn2(340033,0,0,-43.6,-340.9,248.9,234.6); #spawn Disciple of Metal attackable#
	quest::spawn2(340029,0,0,-137.1,-340.7,248.9,26.9); #spawn Disciple of Earth attackable#
	quest::spawn2(340031,0,0,-9.9,-344.4,248.9,215.4); #spawn Disciple of Fire attackable#
	quest::spawn2(340035,0,0,-191.7,-343.4,248.9,40.9); #spawn Disciple of Water attackable#
	quest::spawn2(340036,0,0,-160.3,-339.8,247.7,22.6); #spawn Disciple of Wood attackable#
	quest::depop(340032); 
	quest::depop(340028); 
	quest::depop(340030); 
	quest::depop(340034); 
	quest::depop(340037); 
	quest::signalwith(340033,109,1); #tell Disciple of Metal to speak and attack you
	quest::signalwith(340029,109,12000); #tell Disciple of Earth to speak and attack you
	quest::signalwith(340031,109,24000); #tell Disciple of Fire to speak and attack you
	quest::signalwith(340035,109,36000); #tell Disciple of Water to speak and attack you
	quest::signalwith(340036,109,48000); #tell Disciple of Wood to speak and attack you	
	}
	if($signal == 113) { #signal 113 is from each of the Disciples#
    $counter += 1;
      if($counter == 5) {
	quest::signalwith(340038,114,10); #tell Storm Reach Sensei to speak
	quest::spawn2(340041,0,0,-9.9,-344.4,248.9,215.4); #spawn Master of Rage#
	quest::spawn2(340040,0,0,-43.6,-340.9,248.9,234.6); #spawn Master of Deceit#
	quest::spawn2(340042,0,0,-137.1,-340.7,248.9,26.9);#spawn Master of Doubt#
	quest::spawn2(340043,0,0,-160.3,-339.8,247.7,22.6); #spawn Master of Contentment#
	quest::signalwith(340041,115,1); #tell Master of Rage to attack you#
	quest::signalwith(340040,115,24000); #tell Master of Deceit to attack you#
	quest::signalwith(340042,115,48000); #tell Master of Doubt to attack you#
	quest::signalwith(340043,115,72000); #tell Master of Contentment to attack you#
	}
	if($signal == 113) { #signal 113 is from each of the goblins Emotions#
      if($counter == 9) {
	quest::signalwith(340038,114,10); #tell Storm Reach Sensei to speak
	quest::spawn2(340044,0,0,-9.9,-344.4,248.9,215.4); #spawn Grand Master Beetle#
	quest::spawn2(340045,0,0,-43.6,-340.9,248.9,234.6); #spawn Grand Master Puma#
	quest::spawn2(340046,0,0,-137.1,-340.7,248.9,26.9);#spawn Grand Master Snake#
	quest::signalwith(340044,115,1); #tell Grand Master Beetle to attack you#
	quest::signalwith(340045,115,36000); #tell Grand Master Puma to attack you#
	quest::signalwith(340046,115,72000); #tell Grand Master Snake to attack you#
	}
    if($signal == 113) { #signal 113 is from each of the Grand Masters#
      if($counter == 12) {
	quest::signalwith(340038,116,10); #tell Storm Reach Sensei to speak
	quest::spawn2(340047,0,0,-43.6,-300.5,248.9,190.9); #spawn Silk#
	quest::spawn2(340048,0,0,-147,-300.9,248.9,63.4); #spawn Steel#
	quest::signalwith(340047,115,12000); #tell Silk to attack you#
	quest::signalwith(340048,115,24000); #tell Steel to attack you#	
    }
    if($signal == 113) { #signal 113 is from from Silk and Steel#
      if($counter == 14) {
	quest::signalwith(340038,118,12000); #tell Storm Reach Sensei to speak
	quest::spawn2(340039,0,0,-92.4,334.3,253.2,2.8); #spawn Storm Reach Sensei attackable#
	quest::depop(340038); #depop Storm Reach Sensei immune version#
     }
    }
   }
  }
 }
}