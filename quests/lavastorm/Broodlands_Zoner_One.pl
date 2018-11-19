sub EVENT_SPAWN {
     quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER {
  if($ulevel >= 20 && defined $qglobals{"EpicBox"} == 1){
                   $client->Message(14, "You may pass.");
              quest::movepc(337,479.9,-668.5,21.5);
    } 
    else {
 $client->Message(5, "You shall not pass.");
 }
 }
