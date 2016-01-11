sub EVENT_SPAWN{
   quest::signalwith(166567,3001,100);
   quest::signalwith(166653,3002,100);
   quest::signalwith(166587,3003,100);
   }
sub EVENT_SIGNAL{
   if($signal == 3004){
     quest::spawn2(166283,0,0,1186.9,2198.8,178.2,189.8);
     quest::depop();
    }
