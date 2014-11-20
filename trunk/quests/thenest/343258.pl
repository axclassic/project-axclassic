sub EVENT_SIGNAL {
if ($signal == 623){
quest::spawn2(343095,0,0,-4595.5,269.2,132.8,0);
}
elsif ($signal == 624){
 quest::spawn2(343095,0,0,-4628.8,236.2,132,0);
 }
 elsif ($signal == 625){
 quest::spawn2(343095,0,0,-4641.1,725.8,131.5,0);
 }
 elsif ($signal == 626){
 quest::spawn2(343095,0,0,-4516.6,623,131.5,0);
 }
  elsif ($signal == 627){
  quest::depop(343257);
  quest::depopall(343095);
  quest::depopall(343093);
  quest::depopall(343162);
  quest::depopall(343161);
  quest::depop(343160);
  quest::depop(343163);
  quest::depop(343164);
  quest::depop(343165);
  quest::depop(343255);
  quest::depop(343257);
  quest::depop();
  
 }