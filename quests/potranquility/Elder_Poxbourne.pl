sub EVENT_SPAWN{
  quest::spawn2(203074,0,0,-1420.7,-252.3,-909,61.6);
}
sub EVENT_SAY{
  if ($text=~/hail/i && !defined $qglobals{"pop_ponb_terris"} || !defined $qglobals{"Thelin"} || !defined $qglobals{"Tdagger"} || !defined $qglobals{"Thelp"} || !defined $qglobals{"Tready"} || !defined $qglobals{"Tthule"}){
  quest::signalwith(203003,1500,100);
  }
  elsif ($text=~/hail/i && $qglobals{"pop_ponb_terris"} == 1){
  quest::say("Saved from a world of eternal nightmares, Thelin is forever in your debt.");
  quest::delglobal("pop_ponb_terris");
  }
  else {
   #Do nothing for now
   }
 }
