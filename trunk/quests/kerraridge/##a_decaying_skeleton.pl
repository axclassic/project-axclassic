#zone: Kerra
#spawn-checker
#global name:  riva
#Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
   if  ($random_result<=20){ #roll was good for Riva
     quest::signalwith(74396,2); # Signal Banker Naudi spawn Riva
	# quest::say("rolled for Riva");
	# quest::spawn_condition(kerraridge, 2,1); #Riva
	# quest::spawn_condition(kerraridge, 1,0); #Skele
   }elsif ($random_result=>80){ #bad roll, respawn skele
	# quest::say("Bad roll");
	quest::spawn_condition(kerraridge,2,0); #Riva
	quest::spawn_condition(kerraridge,1,1); #Skele

   }
 }

