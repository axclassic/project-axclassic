# sub EVENT_AGGRO {
# 
# quest::stoptimer(1);
# quest::settimer(1,3000);
# 
# 
# }
# 
# sub EVENT_DEATH {
# 
# quest::stoptimer(1);
# 
# }

#Note: There's can't be an NPC scheduled  to spawn from the database with the same ID (will cause zone crash).

# sub EVENT_TIMER {
# 
# if($timer == 1 && $mob->IsEngaged()) {
# quest::stoptimer(1);
# quest::settimer(2,600);
# 
# }

# else
# {
# #quest::spawn2(159691,0,0,$x,$y,$z,$h); #Already spawns in the database will cause crash
# quest::depop;
# quest::stoptimer(1);
# }
# 
# if($timer == 2 && $mob->IsEngaged()) {
# 
# 
# 
# quest::stoptimer(1);
# quest::settimer(2,600);
# }
# 
# else
# {
# #quest::spawn2(159691,0,0,$x,$y,$z,$h); #Already spawns in the database will cause crash
# quest::depop;
# quest::stoptimer(1);
#       }
#    }
