## a_unkun_deathhound ##
 sub EVENT_SLAY {
	  $client->Message(5,"$mname just killed you! When you return and talk to Grand Historian Gersh for further instructions.");
	  quest::delglobal("EpicThree");
   quest::setglobal("DraniksBdead", 1, 5, "F");
   	  }
	  