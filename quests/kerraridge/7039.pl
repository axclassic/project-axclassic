sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("And hello to you traveler. Beyond this gate lies the Shadeweavers Thicket. You had best go armed. for the [Claw Beasts] have been attacking merchants regularly.");
}
if($text=~/claw beasts/i){
quest::say("A true horror. they are mindless predators and quite large to boot. These beasts have massive razor sharp teeth that can rip your arm off cleanly."); }
}
#END of FILE Zone:sharvahl  ID:7039 -- Khala_Dun_Koby 

