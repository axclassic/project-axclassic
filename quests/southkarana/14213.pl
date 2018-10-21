#a_wild_turkey ID 14213 ##
sub EVENT_DEATH{
      quest::signalwith(14230,695,0);
	  }
sub EVENT_SLAY {
	  $client->Message(5,"$mname just killed you! When you return talk to Corny Scrarecrow for further instructions.");
	  quest::delglobal("Thanksscarecrow");
   quest::setglobal("Thanksdead", 1, 5, "F");
   quest::signalwith(14230,697,0);
    }
 