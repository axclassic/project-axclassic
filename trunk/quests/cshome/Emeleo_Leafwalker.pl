#Zone:cshome
#Angelox
#Script for setting or unsetting special events

sub EVENT_SAY {
my $start = quest::saylink("start", 1);
my $terminate = quest::saylink("Terminate", 1);
my $startEaster = quest::saylink("Start Easter", 1);
my $startNewyear = quest::saylink("Start New Year", 1);
my $startBloodhunt = quest::saylink("Start Bloodhunt", 1);
my $startPitchblack = quest::saylink("Start Pitch Black", 1);
my $startMoonstone = quest::saylink("Start Random Moonstone", 1);

if($text=~/Hail/i){
  $client->Message(14,"Hello $name\! Would you like to $start or $terminate an event?");
 }
elsif($text=~/Start Pitch Black/i){
 $client->Message(14,"Very well then, The Pitch Black event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::setglobal("event4",1,7,"F");
 $event1= undef; 
 }
elsif($text=~/Start Bloodhunt/i){
 $client->Message(14,"Very well then, The Bloodhunt event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::setglobal("event3",1,7,"F");
 $event1= undef; 
 }
elsif($text=~/Start New Year/i){
 $client->Message(14,"Very well then, The NewYear event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::setglobal("event1",1,7,"F");
 $event1= undef; 
 }
elsif ($text=~/Start Easter/i){
 $client->Message(14,"Very well then, The Easter event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::setglobal("event2",1,7,"F");
 $event2= undef; 
 }
elsif ($text=~/Start Random Moonstone/i){
 $client->Message(14,"Very well then, The Random Moonstone event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::setglobal("event5",1,7,"F");
 $event2= undef; 
 }
elsif($text=~/start/i){
  $client->Message(14,"Do you want to $startNewyear, $startEaster, $startBloodhunt, $startMoonstone, or $startPitchblack\?");
 }
elsif($text=~/terminate/i){
  $client->Message(14,"As you wish, all events have been terminated and reset.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 }
}