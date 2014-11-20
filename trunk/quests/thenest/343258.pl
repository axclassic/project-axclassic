sub EVENT_SIGNAL {
if ($signal == 623){
quest::spawn2(343095,0,0,-4549.5,450.2,129.6,10.6);
}
elsif ($signal == 624){
 quest::spawn2(343095,0,0,-4373.2,565.8,128.1,212.5);
 }
elsif ($signal == 625){
 quest::spawn2(343095,0,0,-4464.8,726.4,128.8,113.0);
 }
elsif ($signal == 626){
 quest::spawn2(343095,0,0,-4406.7,666,128.4,171.2);
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
  }
  }