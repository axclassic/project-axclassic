#Zone:cshome
#Angelox
#Script for setting or unsetting special events
#Update 9/17/2017
#Will now tell you if an event is up before setting it - patrikpatrik
##Updated 3/3/18
##Added New Easter Event - Aardil
##########################################################

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
   my $startNewEaster = quest::saylink("Start New Easter", 1);
   my $startThanksgiving = quest::saylink("Start Thanksgiving", 1);
   #array of existing events in database. event1 - event9
   my @eventarr = ($qglobals{'event1'},$qglobals{'event2'},$qglobals{'event3'},$qglobals{'event4'},$qglobals{'event5'},$qglobals{'event6'},$qglobals{'event7'},$qglobals{'event8'}, $qglobals{'event9'});
   #naming the events
   my $even1 = "New Year's Event";
   my $even2 = "Easter Event";
   my $even3 = "Bloodhunt Event";
   my $even4 = "Pitch Black Event";
   my $even5 = "Random Moonstone Event";
   my $even6 = "Christmas Event";
   my $even7 = "Band Dislikes Orcs";
   my $even8 = "New Easter Event";
   my $even9 = "Thanksgiving Event";
   my @curreven = ($even1, $even2, $even3, $even4, $even5, $even6, $even7, $even8, $even9);
   if($text=~/Hail/i) {
      $client->Message(14,"Hello $name\! Would you like to $start or $terminate an event?");
      # Events currently running if active
      my $flag = 0;
      for(my $i = 0; $i < scalar(@eventarr); $i++) {
         my $active = $eventarr[$i];
         if($active == 1) {
            $flag = 1;
            my $enow = $curreven[$i]; # Setting indices to be equal to each other!
            my $p = $i + 1;
            my $eventnow = "Event$p";
            $client->Message(14, "$enow or $eventnow is currently running!");
         }
      }
      if($flag == 0) {
         $client->Message(14, "There are no events currently running.");
      }
   }
   elsif($text=~/Start New Year/i) { #event1
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event1 = undef;
   }
   elsif($text=~/Start Easter/i) { #event2
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event2 = undef;
   }
   elsif($text=~/Start Bloodhunt/i) { #event3
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event3 = undef;
      quest::delglobal("williampop");
      quest::setglobal("williampop",0,7,"F");
      $williampop = undef;
   }
   elsif($text=~/Start Pitch Black/i) { #event4
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event4 = undef;
   }
   elsif($text=~/Start Random Moonstone/i) { #event5
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event5 = undef;
   }
   elsif($text=~/Start Xmas/i) { #event6
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event6 = undef;
   }
   elsif($text=~/Start Band dislikes Orcs/i) { #event7
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
      quest::delglobal("event6");
      quest::setglobal("event6",0,7,"F");
      quest::delglobal("event7");
      quest::setglobal("event7",1,7,"F");
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event7 = undef;
   }
   elsif($text=~/Start New Easter/i) { #event8
      $client->Message(14,"Very well then, The New Easter Event has started."); #Already here so disabled.
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
      quest::delglobal("event8");
      quest::setglobal("event8",1,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
      $event8 = undef;
   }
   elsif($text=~/Start Thanksgiving/i) { #event9
      $client->Message(14,"Very well then, The Thanksgiving Event has started."); #Already here so disabled.
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
	  quest::delglobal("event9");
      quest::setglobal("event9",1,7,"F");
      $event9 = undef;
   }
   elsif($text=~/start/i) {
      $client->Message(14,"Do you want to $startNewyear, $startEaster, $startBloodhunt, $startMoonstone, $startXmas, $startPitchblack, $startOrc, $startNewEaster or $startThanksgiving\?");
   }
   elsif($text=~/terminate/i) {
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
      quest::delglobal("event8");
      quest::setglobal("event8",0,7,"F");
      quest::delglobal("event9");
      quest::setglobal("event9",0,7,"F");
   }
}

