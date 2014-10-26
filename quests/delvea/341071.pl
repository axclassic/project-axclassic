my $halfling_greed_event = 0;
my $in_progress = 0;

sub EVENT_SPAWN { 
    $halfling_greed_event = 1;
    $in_progress = 1;
	}
sub EVENT_SIGNAL {
   if (!defined $in_progress) {
   if ($signal == 101 ){
   quest::ze(14, "You have correctly opened the first chest in the proper order.");
   }
   elsif ($signal == 102){
   quest::ze(14, "You have failed to solve the puzzle.");
   }
   elsif ($signal == 103){
   quest::ze(14, "You have failed to solve the puzzle.");
   }
   elsif ($signal == 104){
   quest::ze(14, "You have failed to solve the puzzle.");
   }
   }
  
