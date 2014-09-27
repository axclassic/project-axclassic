#Stillmoon_Forest_Keeper#
sub EVENT_ITEM {
if ($ulevel <= 60 && $ulevel >= 51 && plugin::check_handin(\%itemcount, 36211 => 1)) {
quest::say("Ah! The perfect blossom . . . I can hardly believe my eyes! For years have I searched in vain for those perfect petals only to find out that gardener was keeping it from me all this time. I humbly thank you for your offer, kind adventurers and perhaps I can return the favor for I know who it is you seek. With this in hand I can summon the hidden one for you. Now go and greet him before he hides again!");
quest::ding();
quest::exp(1000000);
quest::spawn2(338225,0,0,904.9,524.2,13.7,64.9); 
}
}