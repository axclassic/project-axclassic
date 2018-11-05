## a_crevice_bat ##
 sub EVENT_SLAY {
	  $client->Message(5,"$mname just killed you! When you return and talk to Grand Historian Gersh for further instructions.");
	  quest::delglobal("EpicFour");
   quest::setglobal("DraniksCdead", 1, 5, "F");
   	  }
	  