sub EVENT_DEATH {
quest::emote(' corpse falls slowly to the floor, a small smile on his face');
quest::ding();
quest::exp(75000000);
quest::spawn2(340050,0,0,-90.2,-242.2,248.9,2.8); ##spawn a chest##
quest::depop(340049); ##depop controller##
}