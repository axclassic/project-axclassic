sub EVENT_SIGNAL{
  if($signal == 207){
    quest::signalwith(166273,201,0);
    quest::depop();
    }
  if($signal == 203){
   quest::spawn2(166495,0,0,1988,1128,28.3,154); #a grimling guard
   quest::spawn2(166792,0,0,1974.7,1143.6,25.6,129.5); #Prince Garzemort
   quest::spawn2(166594,0,0,1956.3,1129.3,25.6,131.9); #a grimling guard
   quest::spawn2(166782,0,0,1978,982.1,31.2,121); #a grimling conqueror
   quest::spawn2(166780,0,0,2009.3,991.1,34.2,117.1); #a grimling manacrafter
   quest::spawn2(166778,0,0,1921.5,1009.1,29.4,24.4); #a grimling thief
   quest::spawn2(166781,0,0,1925.5,1097.7,25.6,140.1); #a grimling soldier
   quest::spawn2(166779,0,0,2026.6,1071.1,25.6,68.8); #a grimling spiritist
   quest::depop(166783);
    quest::depop();
  }
  }
