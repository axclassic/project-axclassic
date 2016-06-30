#npc - Spawns #Cara_Omica (111163) upon Amontehepna's death.
#zone - FrozenShadow
#Angelox

sub EVENT_DEATH{
	my $random_result = int(rand(100));
	if ($random_result < 9){ #4
		quest::spawn2(111177,0,0,199.12,984.39,186.16,135);  #Spawn Fabled Omica
	}
	else { 
		quest::spawn2(111163,0,0,199.12,984.39,186.16,135); #Spawn normal Omica
	}
}
