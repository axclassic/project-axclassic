sub EVENT_DEATH {
quest::spawn2(340108,0,0,1969.3,-379.9,125.5,81.8);
quest::signalwith(340108,910,0);
quest::say("You must now destroy the remaining defunct sentrys.");
quest::spawn2(340000,0,0,1932.8,-475.3,112.6,190);
quest::spawn2(340001,0,0,2160.3,-248.3,121.9,169.8);
quest::spawn2(340002,0,0,2081.6,699.5,121.9,21.4);
}