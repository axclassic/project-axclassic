#Wild_Turkey ID 14210 ##
sub EVENT_DEATH{
      quest::signalwith(14229,685,0);
	  }
sub EVENT_SLAY {
	  $client->Message(5,"$mname just killed you! When you return talk to Corny Scrarecrow for further instructions.");
	  quest::delglobal("Thanksscarecrow");
   quest::setglobal("Thanksdead", 1, 5, "F");
   quest::signalwith(14229,687,0);
    }
 