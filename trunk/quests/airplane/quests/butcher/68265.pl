#############
## Butchers Invisible Skiff
## Qadar
## Angelox
##############

sub EVENT_WAYPOINT{
no warnings 'all' ;
if (($skiffa >=35) && ($skiffa <=40)){quest::depop();}
 #if(($debugpl2==1) && ($skiffa <=2)){quest::shout("skiffa is set at $skiffa");}
  if($skiffa==0){
    quest::signal(68150);
    quest::spawn2(68150,233,0,3386,130,-12.5,251);
    quest::spawn2(68150,232,0,3376,143,-12.5,251);
    quest::delglobal("skiffa");
    quest::setglobal("skiffa",0.5,7,"F");
    $skiffa = undef;
    quest::depop();}}

