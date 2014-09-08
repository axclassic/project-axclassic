#Plane of justice
#Trial of Execution
#
#Tribunal script - ENTRY into the chamber.
#
#
# - Wizardanim
# - tested 4/4/07
# - Modified by Kilelen
# - Modified by greenbean 03/23/2010
###################################

my $hold_event = 0;

sub EVENT_SPAWN {
   #Depop any existing controllers
   quest::signalwith(201425, 0, 0);
   #Spawn the controller
   quest::spawn2(201425, 0, 0, 194, -1120, 72, 0);
}

sub EVENT_SAY { 
my $prepared = quest::saylink("prepared", 1);
my $begin = quest::saylink("begin", 1);  
    if($text=~/Hail/i) {
    quest::emote(' fixes you with a dark, peircing gaze.');
	quest::say("What do you want, mortal? Are you $prepared?");
    }
    elsif($text=~/prepared/i && $faction < 5) {
    quest::say("Very well. When you are ready, you may $begin the trial of execution. The victim will perish should the hooded executioner reach him. Its life will end only when all of the nemeses which accompany it also perish. We shall judge the mark of your success.");
	quest::mocepc(223.5,-1049.7,72.2);
    }
    elsif($text=~/begin/i && $faction < 5) {
    if (!defined $in_progress) {
    quest::say("Then begin.");
    $in_progress = 1;
    quest::settimer("delay_start", 30);
    #Tell Event_Execution_Control about it
    quest::signalwith(201425, 1, 0);  
    quest::movepc(201,194,-1120,72);	
    #Cast Penance of Execution
    quest::selfcast(1127); #required db edit targettype = 41
    }
    else {
    quest::say("I'm sorry, the Trial of Execution is currently unavailable to you.");
  }
 }
}
sub EVENT_TIMER {
    if ($timer eq "delay_start") {
    quest::stoptimer("delay_start");
    }
    elsif ($timer eq "reset_execution") {
    quest::stoptimer("reset_execution");
    $hold_event = 0;
    quest::signalwith(201078,0,5);
   }
}
sub EVENT_SIGNAL {
    if ($signal == 0) {
    if ($in_progress && !$hold_event) {
    quest::shout("The Trial of Execution is now available."); #notify once timer expires OR FAIL.
    quest::stoptimer("delay_start");
     uest::stoptimer("reset_execution");
     $in_progress=undef;
    }
    elsif ($hold_event) {
    #Boss killed & trial area clear - start timer for reset (20 min normally, reduced to 1 min since only one trial is working)
    quest::stoptimer("reset_execution");
    quest::settimer("reset_execution", 60);
  }
 }
}
 sub EVENT_SIGNAL {  
    if ($signal == 1 ) {      
    #Prime Executioner was killed
    $hold_event = 1;
   }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 31842 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31842);
    }
    elsif(plugin::check_handin(\%itemcount, 31796 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31796);
    }
    elsif(plugin::check_handin(\%itemcount, 31960 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31960);
    }
    elsif(plugin::check_handin(\%itemcount, 31845 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31845);
    }
    elsif(plugin::check_handin(\%itemcount, 31844 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31844);
    }
    elsif(plugin::check_handin(\%itemcount, 31846 => 1)) {
    $client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
    quest::summonitem(31846);
    }
     else {
    plugin::return_items(\%itemcount);
 } 
}


