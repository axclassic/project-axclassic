# a_shrouded_bat
# Killing these on 6th floor spawns either a female or male version of enraged_vampire

sub EVENT_DEATH {
	$vampall = int(rand(100));
		if ($vampall <= 49) { #100
			$vampfem = quest::spawn2(111174,0,0,$x,$y,$z,0); #spawns female 
			$attack = $entity_list->GetMobID($vampfem);
			$femattack = $attack->CastToNPC();
			$femattack->AddToHateList($client, 1);
		}
		else {
			$vampmale = quest::spawn2(111173,0,0,$x,$y,$z,0); #spawns male
			$attack = $entity_list->GetMobID($vampmale);
			$malattack = $attack->CastToNPC();
			$malattack->AddToHateList($client, 1);
		}
  
}