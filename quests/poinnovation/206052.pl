sub EVENT_SAY {
my $advanced = quest::saylink("advanced", 1);
my $construction = quest::saylink("construction", 1);
my $instinct = quest::saylink("instinct", 1);
my $combination = quest::saylink("combination", 1);
my $collecting = quest::saylink("collecting", 1);
  if($text=~/hail/i) {
   quest::say("Oh my hello! It has been such a long time since I have had visitors. Have you come to learn of $advanced tinkering as well?");
  }
  if($text=~/advanced/i) {
   quest::say("Aye, I advanced to this plane due to my work on tinkering back in Ak`Anon. A grand city it is, but my abilities were compromised with the materials I had to work with there. My body and soul has come to rest here, forever coming up with new ideas. You should be aware though that this plane is not how it was when I arrived. Much $construction has taken place.");
  } 
  if($text=~/construction/i) {
   quest::say("When I first arrived I started creating smaller things. As time went on my inventions became more and more focused and impressive. I started building steam powered clockwork to help me gather materials. I had gone too far giving them the ability to learn and with a built in desire of self perpetuation. They began to integrate themselves with the clockwork that already existed within the factory that you can see if you step outside. I once worked within the factory with a kind and fair gnome, Meldrath. Now that he has gone missing the clockworks seem to be working towards a more devious goal. The clockwork out here in the junkyard have been discarded due to their malfunction or replacement by a more efficient series. Needless to say their $instinct for survival has not been lost."); 
  }
  if($text=~/instinct/i) {
   quest::say("The clockwork have become increasingly aggressive because of their desperation for spare parts. I have to defend myself anytime I head out to find parts for my tinkering. I fear for my safety with what is being built in the factory. I have started to build myself my own means of defense. It is nearly completed but I need an odd $combination of batteries to start it up. I should have planned more carefully for it to use simple mana batteries.."); 
  }
  if($text=~/combination/i) {  
   quest::say("Well you see when I was back home it was common for me to use a mycological spore extricate-kinetoconvertor to power my devices. I started planning my defense to use this as a power source out of sheer habit. Here in this desolation the mushrooms that were grown back home do not exist. I am going to have to rig something from spare parts. It is taking a long time with my having to search the junkyard small portions at a time due to the clockworks. Would you help me in $collecting materials?"); 
  }
  if($text=~/hail/i) {
   quest::emote(' peers over some schematics laying on a table next to him.');
   quest::say("Let us see here. I have some of the base parts for the power source. If you could collect a copper node, a bundle of super conductive wires, and an intact power cell I could power up the machine. Good luck to you $name, I hope that we can work together on this.");
  }
 }
 sub EVENT_WAYPOINT { 
  if ($wp == 21) { 
  quest::emote(' begins assembling the power source.'); 
  quest::spawn2(206386,0,0,-735,1580,-52.6,130.9);
  quest::spawn2(206387,0,0,-723.5,1566.3.-52.4,248.9);
  quest::depop();
  } 
 } 
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 9295 => 1, 9426 => 1, 9434 => 1)) { 
   quest::say("Excellent! This is wonderful, please follow me! I will show you the power of my greatest invention."); 
   quest::start(1008121);
  }
 }