sub EVENT_CONNECT {
 ## Aardil checking for global as to sleeper is alive or dead 
 if(defined $qglobals{"Sleeperawake"} == 1){
quest::spawn_condition("sleeper", 1,0); ##This has to be the zone name  so code knows which zone to look into
quest::spawn_condition("sleeper", 2,1);

}
else{
quest::spawn_condition("sleeper", 1,1); 
quest::spawn_condition("sleeper", 2,0);
 $Sleeperawake=undef;
 
    } #end else
  } # EVENT_CONNECT End