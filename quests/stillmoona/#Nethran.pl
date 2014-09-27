#Nethran#
sub EVENT_SPAWN {
quest::say("Out! Out! OUT! You be makin' a fine mess of me baths! Get outta here before I make a nice meal o' you!");
quest::spawn2(338223,0,0,681.5,495.7,15.1,252.4);
quest::spawn2(338223,0,0,679,578.3,15.1,122.6); 
}
}
sub EVENT_DEATH {
quest::emote(' walks three steps before collapsing upon himself in a small heap.');

