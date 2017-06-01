##Screech 211173##
sub EVENT_SIGNAL {
  if($signal == 301){
   quest::shout("Very well, Master!");
   quest::signalwith(211174,305,0);
  }
  elsif($signal == 302){
   quest::ze(14,"It would appear we have visitors... We must thank you mortal, for without your help we would never have reached the chamber and be able to free our master from the binds that Adrianne placed on him long ago.");
   quest::signalwith(211179,303,5000); 
  }
   else{
     #do Nothing;
   }
}