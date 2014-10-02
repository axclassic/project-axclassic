sub EVENT_DEATH {
quest::spawn2(340108,0,0,1969.3,-379.9,125.5,81.8);
quest::signalwith(340108,910,0);
$client->Message(14,"You must now destroy the remaining defunct sentrys");
}