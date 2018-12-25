sub EVENT_SPAWN {
     quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER {
  if($ulevel >= 20 && defined $qglobals{"EpicBox"} == 1){
               $client->Message(14, "You may pass.");
              quest::movepc(337,-413.4,1120.5,6.2);
    } 
    else {
 $client->Message(5, "You shall not pass.");
 }
 }
