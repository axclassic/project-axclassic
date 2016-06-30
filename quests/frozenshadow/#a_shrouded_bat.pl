# #a_shrouded_bat NPCID - 111175
#7th floor bats which has a chance to spawn Tserrina or Fabled Tserrina
# Angelox

sub EVENT_DEATH {
	$tserr = int(rand(100));
		if ($tserr <= 4) { #5
			$tserr = quest::spawn2(111185,0,0,$x,$y,$z,0); #spawns Fabled
			$attack = $entity_list->GetMobID($tserr);
			$tserattack = $attack->CastToNPC();
			$tserattack->AddToHateList($client, 1);
		}
		elsif($tserr <=20) { #15
			$fabtserr = quest::spawn2(111154,0,0,$x,$y,$z,0); #spawns normal
			$attack = $entity_list->GetMobID($fabtserr);
			$ftserattack = $attack->CastToNPC();
			$ftserattack->AddToHateList($client, 1);
		}
		else {
			#Do nothing
		}
}