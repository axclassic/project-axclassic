##zonecontroller.pl ID 35188 in sro##
##Spawns NPC according to signal from player.pl Player.pl may be in the zone file or in templates folder depending if this is a starter zone or not##
##zonecontroller is spawned via Global {NewEasterEvent} ##
sub EVENT_SIGNAL {
     if($signal == 132) {
	quest::depopall(35168); 
	quest::depopall(35169);
	quest::depopall(35170);
	quest::depopall(35171);
	quest::depopall(35172);
	quest::depopall(35173);
	quest::depopall(35174);
	quest::depopall(35175);
	quest::depopall(35176);
	quest::depopall(35177);
	quest::depopall(35178);
	quest::depopall(35179);
	quest::depopall(35180);
	quest::depopall(35181);
	quest::depopall(35182);
	quest::depopall(35183);
	quest::depopall(35184);
	quest::depopall(35185);
	quest::depopall(35186);
	quest::depopall(35187);
	}
	elsif($signal == 122) {
	quest::spawn2(35168,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35169,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35169,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35169,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35169,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 123) {
	quest::spawn2(35170,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35171,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35171,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35171,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35171,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 124) {
	quest::spawn2(35172,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35173,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35173,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35173,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35173,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 125) {
	quest::spawn2(35174,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35175,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35175,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35175,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35175,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 126) {
	quest::spawn2(35176,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35177,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35177,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35177,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35177,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 127) {
	quest::spawn2(35178,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35179,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35179,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35179,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35179,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 128) {
	quest::spawn2(35180,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35181,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35181,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35181,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35181,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 129) {
	quest::spawn2(35182,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35183,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35183,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35183,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35183,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 130) {
	quest::spawn2(35184,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35185,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35185,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35185,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35185,0,0,-457.4,-2453.6,-22.8,220);
	}
	elsif($signal == 131) {
	quest::spawn2(35186,0,0,-456.3,-2514.2,-24,229.4);
	quest::spawn2(35187,0,0,-506.4,-2513.8,-19.7,249.5);
	quest::spawn2(35187,0,0,-480.4,-2513.2,-21.9,249.3);
	quest::spawn2(35187,0,0,-455.9,-2483.9,-23.5,212);
	quest::spawn2(35187,0,0,-457.4,-2453.6,-22.8,220);
	}
	else {
	#Do Nothing;
	}
	}