sub EVENT_SAY {
my $work = quest::saylink("work", 1);
my $help = quest::saylink("help", 1);
   if($text=~/hail/i) {
   quest::emote(' attempts to hide the shovel behind his back');
   quest::say("I wasn't doing anything! You have to understand . . . This isn't what it looks like. It was a wonderful night for a stroll! Oh wait, you're not one of the authorities, are you? Phew. In my line of $work, you never can be too careful. Say. . . You look like you might be morally flexible. Why don't you lend old Findleznax a hand and keep a watch out while I dig. Something's buried here, I know it. I can SENSE it, and I'll be swizzle-swaggled if some other rotbag is going to get ahold of it before me. Whaddya say? Find it in your heart to $help me?"); 
   }
   if($text=~/work/i) {
   quest::say("Self-employed treasure seeker. I relieve the dead of their valuables after they no longer need them. My efforts aren't appreciated in many places which requires me to practice discreetly. There are some that would call me gravedigger, but I don't particularly care for the connotations associated with that moniker. You know, it's funny. . . A Wayfarer trespasses in the hallowed crypts of Mistmoore, plunders their treasure and walks away a hero. I exhume a single fresh corpse and suddenly become a criminal - does that sound like justice to you?");
   }
   if($text=~/help/i) {
   quest::say("Stay close and keep an eye out.");
   quest::start(193);
   }
 }
sub EVENT_WAYPOINT {
   if ($wp == 2) {  
   quest::emote(' thrusts his shovel into the dank earth and begins digging. For his size, he works fast.');
   quest::me("The dirt shudders and a decomposing hand breaks the surface.");
   quest::say("By Bertoxxulous' bile, we've got a live one! Defend yourself!");
   quest::spawn2(56199,0,0,-905.6,-464.2,-110.8,93.1);
   quest::depop();
   }
 }  
   