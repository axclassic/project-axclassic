sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome, $name. I'm Slade, Royal Armorer to the Dain and his personal guardsmen. I've heard yer name once or twice in these halls and apparently ye'ver earned the respect of my people. In light of that I'm willin ta offer my [services] to you if'n ye need them.");
}
if($text=~/what services/i){
quest::say("If'n ye've had the fortune to earn any of the plate helms that are made by my people in the city then I can use my skills to custom fit and detail it for a Wood Elf of yer like. I can do this fer the Dark Runed Crown, the Runed Protector's Helm, the Resonant Helm, the Crown of Forbidden Rites, Crown of the Kromzek Kings, Frostreaver's Velium Crown, Cowl of Mortality, and the Champions Crown. Simply hand me one of these and I'll do the work for you."); }
}
#END of FILE Zone:thurgadinb  ID:117731 -- Royal_Armorer_Slade 

