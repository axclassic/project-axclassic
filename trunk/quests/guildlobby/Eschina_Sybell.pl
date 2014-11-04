#######################################
## NPC: Test                         ##
#######################################
sub EVENT_SAY {
my $aatotal = $client->GetSpentAA();

  if ($text=~/hail/i) {
    $client->Message(14,"Hello $name , you have $aatotal AAs");
  }
}