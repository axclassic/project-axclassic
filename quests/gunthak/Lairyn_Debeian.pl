#zone: gunthak NPC: Lairyn_Debeian (224189)
#Angelox

sub EVENT_SAY { 
my $sent = quest::saylink("sent", 1);
if ($text=~/Hail/i){
  quest::emote(' stares at you directly in the eyes.');
  quest::say("Greetings, $name.  I suppose you're here like everyone else in search of fame and fortune.  Good luck to you, and good day.  I have many things to attend to.");
  quest::say("Or were you $sent by Liprin to help me?");
 }
 if ($ulevel >= 55 && $text=~/sent/i){
 quest::emote('  is disturbingly pale for an Erudite. He looks terribly frightened.');
 quest::say("They'll return any moment! The shadows are everywhere, always watching . . . Waiting for me to rest so they can kill me. I try to fight them off but they always return. They whisper to me when I am all alone. No one else in the gulf believes me. You must help! Please believe that what I say is true! Oh no, here they come - please don't let the shadows take me away!"); 
 quest::start(32);
}
else {
   quest::say("I dont know why Liprin would have sent you, you are much to young and unskilled to be of any help to me.");
   quest::say("Go away before the shadows find me, for it would surely be the end of both of us!");
   }
}
sub EVENT_WAYPOINT {
    if ($wp == 3) {
    quest::shout("They're still following me! Help!");
	quest::spawn2(224248,0,0,-225.5,-402.2,15.5,173.1);
	quest::signalwith(224248,224,0);
	quest::spawn2(224244,0,0,-290,-513.4,18.2,217.2);
	quest::spawn2(224245,0,0,-292.5,-458.2,17,154.9);
	quest::spawn2(224246,0,0,-279.9,-483.5,17,184.4);
	quest::spawn2(224243,0,0,-320,-490,18.2,0);
    quest::depop();
 }
}