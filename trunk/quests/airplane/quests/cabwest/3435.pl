sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What is it you seek within the tower?  Could it be that you are a new apprentice?  If so, you are required to don the [apprentice skullcap].");
}
if($text=~/apprentice skullcap/i){
quest::say("All new members of the Brood of Kotiz are required to don the [apprentice skullcap].  To earn one, a new apprentice is required to fetch four brains for further experiments.  Not just any four brains, mind you, but the brains of [sarnak] hatchlings.");
}
if($text=~/sarnak/i){
quest::say("Sarnak?!!  Do not speak loudly, that name.  If you seek information on the sarnak, read the tome of this tower.  The tower librarian should be found within."); }
}
#END of FILE Zone:cabwest  ID:3435 -- Master_Xydoz 

