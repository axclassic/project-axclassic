##Seilaen in the Plane of Nightmares## 

sub EVENT_SAY {
my $help = quest::saylink("help", 1);
my $Locket = quest::saylink("Locket", 1);
my $want = quest::saylink("want", 1);
my $Deyid = quest::saylink("Deyid", 1);
my $prepared = quest::saylink("prepared", 1);
  if($text=~/hail/i) {
   quest::emote(' looks at you with eyes wide with fear.');
   quest::say("Who.. who are you? You.. You must $help me!");
   }   
  if($text=~/help/i) {
   quest::say("The forest, it.. I can feel it looking at me.. following me! Oh, I just want to leave and go!"); 
   quest::say("I don't know what it could be, I was just walking home and.. and.. this doesn't look like the forest near my home at all! Oh, and I am wearing my mother's $Locket of Escape.. but it won't work for me!"); 
   }
  if($text=~/Locket/i) {
   quest::say("My mother always carried this with her. I have no idea why I suddenly have it. Perhaps I can make it work for you, if you $want me to?"); 
   }
  if($text=~/want/i) {
   $client->Message(14,"Seilaen attempts to use the Locket of Escape upon you");
   quest::say("Hmm.. It doesn't seem to want to work. Do you see $Deyid?"); 
   }
  if($text=~/Deyid/i) {
   quest::say("Ohh, that must be what is causing all this trouble! You all seem so brave. Maybe if you chop down Deyid the Twisted I will be able to go home? Will you please? If you have gathered together and are $prepared, have your leaders step forward and tell me their readiness. Mother's Locket doesn't seem as bright as it was before. I fear I can only use it but a couple more times."); 
   }
  if($text=~/prepared/i) {
   quest::say("Very well, Good luck to you $name.");
   quest::spawn2(204353,0,0,868.2,912,279.1,35);
   quest::movepc(204,1173.0,1176.6,279.4);
   }
  } 
sub EVENT_SIGNAL {
  if($signal == 5) {
  quest::shout("Oh thank you! Thank you! I don't feel the trees watching me anymore! And.. Let me try Mother's Locket again, I think it might work..");
  quest::depop(204353);
  quest::depopall(204351);
  quest::depopall(204352);
  quest::depop();
  }
 }  
