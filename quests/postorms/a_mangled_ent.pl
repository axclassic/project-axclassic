##a mangled ent 210545 ##
sub EVENT_SAY {
my $giving = quest::saylink("giving", 1);
my $completed = quest::saylink("completed", 1);
    if($text=~/hail/i) {
   quest::say("Are you $giving up? Or is the task $completed?"); 
   }
    if($text=~/giving/i) {
   quest::say("Tis a sad day then, Relv the Mysterious had more faith in mortals, but perhaps in time you will return and proove him right.");
   quest::movepc(210,-1795,-2059,-473.6);  
   quest::signalwith(210080,210,0);
   }
    if($text=~/completed/i) {
   quest::say("Well done $name! I shall send you back to Relv the Mysterious so you can collect your reward.");
   quest::movepc(210,1670.8,2160.6,-449.9);
   }
  } 
   