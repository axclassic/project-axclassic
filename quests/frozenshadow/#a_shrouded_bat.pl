# #a_shrouded_bat NPCID - 111175
#7th floor bats which has a chance to spawn Tserrina or Fabled Tserrina
# Angelox
sub EVENT_DEATH {
    if ($tserrina>1){ #named not up yet
	my $random_result = int(rand(100));
		if (($random_result <= 9) && ($ulevel > 39)) { #5
			quest::spawn2(111185,0,0,$x,$y,$z,0); #spawns Fabled
			quest::setglobal("tserrina",1,3,"F");
		}
		elsif($random_result <=25) { #15
			quest::spawn2(111154,0,0,$x,$y,$z,0); #spawns normal
			quest::setglobal("tserrina",1,3,"F");
		}
		else {
			quest::setglobal("tserrina",2,3,"F");
		}
    }
}