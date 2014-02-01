##################################\
## Zone: Timorous
## Invisible Capt Skiff (uses grid 27)
## Qadar
## Angelox
#################################

sub EVENT_WAYPOINT{
if (($skiffa >=75) && ($skiffa <=80)){quest::depop();}
 if (($skiffa >=41) && ($skiffa <=43)){quest::depop();}
  if ($skiffa ==0){quest::signal(96320);}
   if(($debugpl2==40) && ($skiffa <=42)){quest::shout("skiffa is set at $skiffa");}
    if($skiffa==40){
     quest::signal(96320);
     quest::spawn2(96320,25,0,-2110.9,-2123.4,-4.5,143);
     quest::spawn2(96320,26,0,-2092.5,-2130.5,-4.5,143);
     quest::delglobal("skiffa");
     quest::setglobal("skiffa",41,7,"F");
     $skiffa = undef;
     quest::depop();}}
    
