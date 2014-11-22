sub EVENT_SIGNAL {
if ($signal == 623){
quest::spawn2(343095,0,0,-4471.8,545.7,128,0.1);
}
elsif ($signal == 624){
 quest::spawn2(343262,0,0,-4373.2,565.8,128.1,212.5);
 }
elsif ($signal == 625){
 quest::spawn2(343263,0,0,-4464.8,726.4,128.8,113);
 }
elsif ($signal == 626){
 quest::spawn2(343264,0,0,-4406.7,666,128.4,171.2);
 }
 elsif ($signal == 631){
  quest::depop(343257);
  quest::depop(343095);
  quest::depopall(343093);
  quest::depopall(343162);
  quest::depopall(343161);
  quest::depop(343160);
  quest::depop(343163);
  quest::depop(343164);
  quest::depop(343165);
  quest::depop(343255);
  quest::depop(343257);
  quest::depop(343262);
  quest::depop(343263);
  quest::depop(343264);
  quest::depop();
  }
  }