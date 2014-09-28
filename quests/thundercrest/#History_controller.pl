my $history_event = 0;

 
  sub EVENT_SPAWN {
  $history_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 317) {
    $client->Message(14,"You must connect the three secrets of Lir together so that their full potential can be realized. Look about you for that which will connect them, for it is almost assuredly already in your possession.");
	quest::shout("depopping self");
	quest::depop();
    }
	if ($signal == 312) {
	 $history_event += 1; # adds one to spawn variable # 
	 quest::shout(" adding one to variable");
	}
	if($signal == 313) { ##signal 313 is from each Guardian_of_the_Halls Protector_of_the_Halls and Defender_of_the_Halls##
    $counter += 1;
	quest::shout("recieved signal 313.");
      if($counter == 3) {
	quest::depop(340054); ##depop Artifact non attackable##
	quest::spawn2(340055); ##spawn killable artifact##
	}
   }
 }



