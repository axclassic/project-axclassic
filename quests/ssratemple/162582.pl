# #Emp_Event_Controller (162582)

my $GolemCoolDownTime = int(rand(60)) + 60; #Waiting time to reattempt Emp after failure (Current setting: 1-2 hours)
my $EmpRepopTime = int(rand(60)) + 480; #Respawn time forEmp after success (Current setting: 8-9 hours)
my $EmpPrepTime = 150; #Seconds before Emp becomes targetable after killing Blood/Golem (Current setting: 2min 30sec)
my $EmpPrep = 1;

sub EVENT_SPAWN {
    quest::setglobal("SsraGolem", "1", 2, "F");
	quest::setglobal("SsraEmperor", "1", 2 ,"F");
	quest::settimer("EmpCycle", 20);
}

sub EVENT_TIMER {
	if($timer eq "EmpCycle") {
		if(($qglobals{SsraEmperor} == 1) && ($qglobals{SsraGolem} == 1)) {
            #Emperor is ready to spawn
            #Normal Cycle Start
			quest::setglobal("SsraEmperor", "2", 2 ,"F");
		}
		elsif(($qglobals{SsraEmperor} == 2) && !$entity_list->GetMobByNpcTypeID(162065)) {
            ##Blood_of_Ssraeshza
            quest::spawn2(162189,0,0,877.0,-325.0,400.5,192);
            ##Emperor_Ssraeshza (No Target)
            quest::spawn2(162065,0,0,993,-325,416,192);
        }
        elsif(($qglobals{SsraGolem} == 2) && ($qglobals{SsraEmperor} == 3) && !$entity_list->GetMobByNpcTypeID(162065) && !$entity_list->GetMobByNpcTypeID(162227) && ($EmpPrep == 2)) {
            #Ssraeshzian_Blood_Golem
            quest::spawn2(162064,0,0,877.0,-325.0,400.5,192);
            ##Emperor_Ssraeshza (No Target)
            quest::spawn2(162065,0,0,993,-325,416,192);
        }
    }
    if($timer eq "EmpPrep") {
        quest::stoptimer("EmpPrep");
        ##Emperor_Ssraeshza (No Target)
        quest::depop(162065);
        ##Emperor_Ssraeshza_ (Real)
        quest::spawn2(162227,0,0,993,-325,416,192);
        quest::setglobal("SsraEmperor", "3", 2, "F");
        $EmpPrep = 2;
    }
    if($timer eq "CoolDownGolem") {
        quest::stoptimer("CoolDownGolem");
        quest::setglobal("SsraEmperor", "1", 2 ,"F");
        quest::setglobal("SsraGolem", "1", 2, "F");
    }
    if($timer eq "CoolDownEmperor") {
        quest::stoptimer("CoolDownEmperor");
        quest::setglobal("SsraEmperor", "3", 2 ,"F");
        quest::setglobal("SsraGolem", "2", 2, "F");
    }
    if($timer eq "RespawnEmperor") {
        quest::stoptimer("RespawnEmperor");
        quest::setglobal("SsraEmperor", "1", 2 ,"F");
        quest::setglobal("SsraGolem", "1", 2, "F");
    }
}

sub EVENT_SIGNAL {
    if($signal == 1) {
        #Blood or Blood Golem is dead
        quest::setglobal("SsraGolem", "2", 2, "F");
        quest::settimer("EmpPrep", $EmpPrepTime);
        $EmpPrep = 1;
    }
    if($signal == 2) {
        #Emperor is dead
        quest::settimer("RespawnEmperor", ($EmpRepopTime * 60));
        quest::setglobal("SsraEmperor", "5", 2 ,"F");
        quest::setglobal("SsraGolem", "5", 2, "F");
        #Respawn time forEmp after success (Current setting: 3-5 days)
    }
    if($signal == 3) {
        #Raid Failure
        # Ssraeshza Traps
        quest::depopall(162280);
        ##Emperor_Ssraeshza (No Target)
        quest::depop(162065);
        if(($qglobals{SsraEmperor} == 2) && ($qglobals{SsraGolem} == 1)) { # Failed on Golem
            quest::settimer("CoolDownGolem", ($GolemCoolDownTime * 60));
            quest::setglobal("SsraEmperor", "5", 2 ,"F");
            quest::setglobal("SsraGolem", "5", 2, "F");
        }
        if(($qglobals{SsraEmperor} == 3) && ($qglobals{SsraGolem} == 2)) { # Failed on Emperor or second Golem
            quest::settimer("CoolDownEmperor", ($GolemCoolDownTime * 60));
            quest::setglobal("SsraEmperor", "5", 2 ,"F");
            quest::setglobal("SsraGolem", "5", 2, "F");
        }
        #Waiting time to reattempt Emp after failure (Current setting: 3-4 hours)
    }
}

