##zonecontroller.pl ID 35188 in sro##
##Spawns Rabbits for New Easter Event ##
##Uses Global event8 ##
sub EVENT_SPAWN {
    quest::set_proximity($x - 500, $x + 500, $y - 500, $y + 500);
    if((defined $event8) && ($event8 == 1)) {
        quest::unique_spawn(35189,0,0,-439.7,-2530.2,-17.4,224.4);    ##Trackable Evil Bunny This is an invis NPC yet allows ranger and druid tracking to locate the area of the spawns
    }
}

sub EVENT_ENTER {
    if((defined $event8) && ($event8 == 1)) {
        if(!defined($EasterInProgress)) {
            quest::setglobal("EasterInProgress", 1, 3, "H1"); #set the global forall npc's, all players, this zone if nobody else has it.
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
            if($ulevel >= 1 && $ulevel <= 5) {
                quest::spawn2(35168,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35169,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35169,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35169,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35169,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 6 && $ulevel <= 10) {
                quest::spawn2(35170,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35171,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35171,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35171,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35171,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 11 && $ulevel <= 15) {
                quest::spawn2(35172,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35173,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35173,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35173,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35173,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 16 && $ulevel <= 20) {
                quest::spawn2(35174,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35175,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35175,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35175,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35175,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 21 && $ulevel <= 25) {
                quest::spawn2(35176,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35177,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35177,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35177,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35177,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 26 && $ulevel <= 30) {
                quest::spawn2(35178,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35179,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35179,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35179,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35179,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 31 && $ulevel <= 35) {
                quest::spawn2(35180,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35181,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35181,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35181,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35181,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 36 && $ulevel <= 40) {
                quest::spawn2(35182,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35183,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35183,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35183,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35183,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 41 && $ulevel <= 45) {
                quest::spawn2(35184,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35185,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35185,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35185,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35185,0,0,-457.4,-2453.6,-22.8,220);
            }
            elsif($ulevel >= 46 && $ulevel <= 49) {
                quest::spawn2(35186,0,0,-456.3,-2514.2,-24,229.4);
                quest::spawn2(35187,0,0,-506.4,-2513.8,-19.7,249.5);
                quest::spawn2(35187,0,0,-480.4,-2513.2,-21.9,249.3);
                quest::spawn2(35187,0,0,-455.9,-2483.9,-23.5,212);
                quest::spawn2(35187,0,0,-457.4,-2453.6,-22.8,220);
            }
        }
        else {
            $client->Message(14, "There is another Norrathian doing the Easter Event in this zone. Try back in a little while.");
        } # end EasterInProgress check
    }# end event8 check
    $event8=undef;
    $EasterInProgress=undef;
} # end EVENT_ENTER

my $spiderCount = 0;
sub EVENT_SIGNAL {
    if($signal == 600) {
        quest::depop();
    }
    if($signal == 30) {
        if($spiderCount == 0) {
            quest::settimer("terrorantula", 30);
        }
        $spiderCount++;
    }
}

sub EVENT_TIMER {
   if($timer eq "terrorantula") {
       quest::stoptimer("terrorantula");
       if($spiderCount == 6) {
           quest::spawn2(quest::ChooseRandom(35162,35144),0,0,80.00,229.00,-37.00,31.00);
       }
       $spiderCount = 0;
   }
}
