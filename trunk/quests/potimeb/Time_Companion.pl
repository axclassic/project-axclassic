# Time_Companion (223228)
#Trial mover for fire,air,water,earth,air,undead. 
#Threeflies dec 2012
#Ax_classic


sub EVENT_SAY
{
if ($text=~ /Hail/i){
quest::say("Please choose [fire] [water] [air] [undead] [earth] as your destination");
}

if ($text=~ /fire/i){
quest::say("Good luck $name"); quest::movepc(223,-59.1,587.1,493.9,64.6);
}
if ($text=~ /water/i){
quest::say("Good luck $name"); quest::movepc(223,-58,884.8,493.7,67.8);
}
if ($text=~ /earth/i){
quest::say("Good luck $name"); quest::movepc(223,-61.9,1638.6,496.1,65.5);
}
if ($text=~ /air/i){
quest::say("Good luck $name"); quest::movepc(223,-59.2,1333.4,494.1,56.9);
}
if ($text=~ /undead/i){
quest::say("Good luck $name"); quest::movepc(223,-36.5,1092.4,495.2,54.6);
}
}