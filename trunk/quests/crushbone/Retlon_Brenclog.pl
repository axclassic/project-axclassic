sub EVENT_SAY{
  if($text=~/Hail/i){
    quest::say("Oh my word!! A rescuer!! Hurry! Get me out of these chains!! Go find the orc who has the keys!");
  }
}
sub EVENT_ITEM{
  if($copper >= 1 || $item1 != 20015){
    quest::say("No, no!! I do not need this!! Get me key number 15!!");
  }
  if($item1 == 20015){
    quest::say("Good work!! I shall be on my way. Farewell my friend!!");
    quest::givecash(0,3,2,0);
     quest::ding(); quest::exp(10000);
    
    quest::faction(176,10);
    quest::faction(91,10);
    quest::faction(115,10);
    quest::faction(322,-20);
    quest::depop();
  }
}