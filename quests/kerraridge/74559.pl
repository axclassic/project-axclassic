##Jailer_issue 74559 ##
sub EVENT_SAY {
    if($text=~/Hail/i){
      quest::say("so Prankster pulled a fast one on you eh? Let me see if I can fix it.");
	  quest::spawn_condition("kerraridge",3,1);
    quest::depopall(74541);
    quest::delglobal("khazi");
    quest::setglobal("khazi",1,3,"F");           # reset quest on handin
    $khazi=undef;
  }
 } 