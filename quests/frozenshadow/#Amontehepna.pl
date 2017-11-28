#npc - Spawns #Cara_Omica (111163) upon Amontehepna's death.
#zone - FrozenShadow
#Angelox
sub EVENT_DEATH{
	#quest::say("Your level is $ulevel");
	my $random_result = int(rand(100));
    if ($omica>1){ #Omica not up yet
	if (($random_result <= 20) && ($ulevel >= 40)) { #4
		quest::spawn2(111177,0,0,199.12,984.39,186.16,135);  #Spawn Fabled Omica
	}
	elsif (($random_result <= 20) && ($ulevel <= 39)) { # Should have been Fabled, so warn and spawn normal Omica
		quest::shout("We shall meet again $name! When you are a worthy opponent!!");
		quest::spawn2(111163,0,0,199.12,984.39,186.16,135); 
	}
	else { 
		quest::spawn2(111163,0,0,199.12,984.39,186.16,135); #Spawn normal Omica
	}
    }
  #Amontehepna died and should reset back to 2 after Omica death.  
  quest::setglobal("omica",1,3,"F");
}
