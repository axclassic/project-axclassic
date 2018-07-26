#Decaying skeleton quest, dwarf skeletons will eventually give you bone chips if you leave them alone.
#All zones
#Angelox
sub EVENT_SAY {
 if($faction <=4 ){ #should be amailable before anything starts
 my $hades = quest::saylink("Hades", 1);
 my $mercy = quest::saylink("mercy", 1);
 my $reward = quest::saylink("reward", 1);
 my $bone = quest::saylink("chip of my bones", 1); 
 my $staff = quest::saylink("cracked staff", 1);
  if($text=~/hail/i){
     $client->Message(14,"a decaying skeleton says,\"Hail Comrade! Fear not from our kind as you have shown mercy for the tormented of $hades.\"");
     }
  elsif($faction == 1){ #Must be ally to continue quest
     if($text=~/Hades/i){
          $client->Message(14,"Aye, we are the animations of the dead, forced back to a strange life of despair and agony, your $mercy has relieved us of some of this suffering.");
     }
     elsif($text=~/mercy/i){
      $client->Message(14,"a decaying skeleton says,\"Although our new existence is of little hope or meaning, we still enjoy what we have, and look to $reward those who allow us to continue roaming these lands.\"");
     }
     elsif($text=~/reward/i){
      $client->Message(14,"a decaying skeleton says,\" I can give you a $bone or my $staff you quest for.\"");
     }
     elsif($text=~/chip of my bones/i){
      $client->Message(14,"a decaying skeleton says,\"As you wish...\"");
      quest::summonitem(13073);
     }
     elsif($text=~/cracked staff/i){
	if ($ulevel <= 7){
	  if ($nostaff ==1){
	    $client->Message(14,"a decaying skeleton says,\"I already gave away my staff, try again later...\"");
	  }
	else{
	  $client->Message(14,"a decaying skeleton says,\"As you wish...\"");
	  quest::summonitem(6018);
	  $nostaff=1;
	}
       }
      else{
      $client->Message(14,"a decaying skeleton says,\"You must have already finished this quest...\"");
      }
     }
    }
    else{
     $client->Message(14,"Although you have done well, you are not fully trustworthy yet.");
     $nostaff =0;
    }
  }
  else{
  quest::say("Go away,fool!");
  }
}
sub EVENT_DEATH {
$nostaff =0;
}
