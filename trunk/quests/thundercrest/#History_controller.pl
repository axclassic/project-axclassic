my $history_event = 0;

 
  sub EVENT_SPAWN {
  $history_event = 0;
  $counter = undef;
  }
sub EVENT_SIGNAL {
    if ($signal == 315) {
    $client->Message(14,"There remain many secrets here that only you can reveal. Now, you must destroy the guardian protecting the second secret of Yar`Lir.");
	}
	if ($signal == 316) {
	$client->Message(14,"At last, you are nearly through these great halls of knowledge. Destroy the guardian of the final secret and you will be victorious in your search.");
	}
	if ($signal == 317) {
	$client->Message(14,"You must connect the three secrets of Lir together so that their full potential can be realized. Look about you for that which will connect them, for it is almost assuredly already in your possession.");
	}
	if ($signal == 312) {
	 $history_event += 1; # adds one to spawn variable # 
	}
	if($signal == 313) { #signal 313 is from each Guardian_of_the_Halls Protector_of_the_Halls and Defender_of_the_Halls#
    $counter += 1;
      if($counter == 3) {
	quest::depop(340054); #depop Artifact non attackable#
	quest::spawn2(340055); #spawn killable artifact#
	}
   }
 }



