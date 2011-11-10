sub EVENT_DEATH
{
 my $a=92015;  #goblin raider, starts spawn1 cycle
 my $b=92067;  #goblin traitor, trigger mob
 if ($bdied==1) #traitor died once
 {
 #quest::say("I already died once!");
 }
 else
 {
  quest::say("Spawning goblin raider by Nurga");
  quest::spawn2($a,248,0,-612,-2830,-478.75,122);
  $bdied=1; #mark traitor died once
 }
}