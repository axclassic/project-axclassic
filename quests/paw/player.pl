# Splitpaw

sub EVENT_CLICKDOOR {
   my $d_id = ($doorid % 256);
   # $client->Message(13, "doorid = $doorid");
   # $client->Message(13, "d_id = $d_id");
   if(($doorid == 2)||($d_id == 2)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 3)||($d_id == 3)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 4)||($d_id == 4)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 5)||($d_id == 5)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 6)||($d_id == 6)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 7)||($d_id == 7)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 8)||($d_id == 8)) {
       quest::signalwith(18059, 1, 2);
   }
   if(($doorid == 9)||($d_id == 9)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 10)||($d_id == 10)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 11)||($d_id == 11)) {
       quest::signalwith(18096, 1, 2);
   }
   if(($doorid == 15)||($d_id == 15)) {
       quest::signalwith(18090, 1, 2);
   }
   if(($doorid == 16)||($d_id == 16)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 17)||($d_id == 17)) {
       quest::signalwith(18070, 1, 2);
   }
   if(($doorid == 41)||($d_id == 41)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 44)||($d_id == 44)) {
       $client->Message(4, "It's locked and you're not holding the key.");
   }
   if(($doorid == 51)||($d_id == 51)) {
       quest::signalwith(18070, 1, 2);
   }
   if(($doorid == 53)||($d_id == 53)) {
       quest::signalwith(18058, 1, 2);
   }
}

