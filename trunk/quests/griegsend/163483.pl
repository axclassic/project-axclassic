sub EVENT_DEATH{
 my $random_result = int(rand(100));
  if ($random_result<=50){
quest::signalwith(163075,400);
quest::delglobal("grieg_event");
quest::setglobal("grieg_event",3,3,"F");
$grieg_event=undef;
  }else{
  #do nothing
 }
}