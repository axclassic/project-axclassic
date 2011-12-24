#Zone:cshome
#Angelox
#Script for setting or unsetting special events

sub EVENT_SAY {
my $start = quest::saylink("start", 1);
my $terminate = quest::saylink("Terminate", 1);
my $startEaster = quest::saylink("Start Easter", 1);
my $startNewyear = quest::saylink("Start New Year", 1);
my $startXmas = quest::saylink("Start Xmas", 1);
my $startBloodhunt = quest::saylink("Start Bloodhunt", 1);
my $startPitchblack = quest::saylink("Start Pitch Black", 1);
my $startMoonstone = quest::saylink("Start Random Moonstone", 1);
my $startOrc = quest::saylink("Start Band dislikes Orcs", 1); #this one already here, saved for template to next quest.

if($text=~/Hail/i){
  $client->Message(14,"Hello $name\! Would you like to $start or $terminate an event?");
 }
elsif($text=~/Start New Year/i){ #event1
 $client->Message(14,"Very well then, The NewYear event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",1,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event1 = undef; 
 }
elsif ($text=~/Start Easter/i){ #event2
 $client->Message(14,"Very well then, The Easter event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",1,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event2 = undef; 
 }
elsif($text=~/Start Bloodhunt/i){ #event3
 $client->Message(14,"Very well then, The Bloodhunt event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",1,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",0,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event3 = undef; 
 }
elsif($text=~/Start Pitch Black/i){ #event4
 $client->Message(14,"Very well then, The Pitch Black event has started.");
 quest::delglobal("event1");
 quest::setglobal("event1",0,7,"F"); 
 quest::delglobal("event2");
 quest::setglobal("event2",0,7,"F"); 
 quest::delglobal("event3");
 quest::setglobal("event3",0,7,"F"); 
 quest::delglobal("event4");
 quest::setglobal("event4",1,7,"F");
 quest::delglobal("event5");
 quest::setglobal("event5",0,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event4 = undef; 
 }
elsif ($text=~/Start Random Moonstone/i){ #event5
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
 quest::setglobal("event5",1,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event5 = undef; 
 }
elsif ($text=~/Start Xmas/i){ #event6
 $client->Message(14,"Very well then, the Christmas event has started.");
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
 quest::delglobal("event6");
 quest::setglobal("event6",1,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 $event6 = undef; 
 }
elsif ($text=~/Start Band dislikes Orcs/i){ #event7 
 $client->Message(14,"Very well then, Band dislikes Orcs event has started."); #Already here so disabled.
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
 quest::setglobal("event5",0,7,"F");
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",1,7,"F");
 $event7 = undef; 
 }
elsif($text=~/start/i){
  $client->Message(14,"Do you want to $startNewyear, $startEaster, $startBloodhunt, $startMoonstone, $startXmas or $startPitchblack\?");
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
 quest::delglobal("event6");
 quest::setglobal("event6",0,7,"F");
 quest::delglobal("event7");
 quest::setglobal("event7",0,7,"F");
 }
}