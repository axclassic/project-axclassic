my $history_event = 0;

 
  sub EVENT_SPAWN {
  $history_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 317) {
    $client->Message(14,"You must connect the three secrets of Lir together so that their full potential can be realized. Look about you for that which will connect them, for it is almost assuredly already in your possession.");
	quest::depop();
    }
	if ($signal == 312) {
	 $history_event += 1; # adds one to spawn variable # 
	 }
	if($signal == 313) { ##signal 313 is from each Guardian_of_the_Halls Protector_of_the_Halls and Defender_of_the_Halls##
    $counter += 1;
	   if($counter == 3) {
	quest::depop(340054); 
	quest::spawn2(340055,0,0,1930.2,2255.5,-53.4,82); 
	}
   }
 }



