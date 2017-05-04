##Jailer_issue 74559 ##
sub EVENT_SAY {
    if($text=~/Hail/i){
      quest::say("so Prankster pulled afast one on you eh? Let me see if I can fix it.");
	  quest::delglobal("khazi");
  }
 } 