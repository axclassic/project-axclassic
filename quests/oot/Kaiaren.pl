## Modified for Bot Epic 3.0 since normal epic is done by delevel Aardil##
sub EVENT_SAY {
my $expecting = quest::saylink("expecting", 1);
my $final = quest::saylink("final", 1);
my $ready = quest::saylink("ready", 1);
 if($text=~/hail/i){
  quest::say("Hello $name, I have been $expecting you.");
 }
 if($text=~/expecting/i){
  quest::say("There is one $final task between you and the item you seek.");
 }
 if($text=~/final/i){
  quest::say("Yes, you must combat an enlightened one. It is our way that balance must be kept. Without good, evil cannot exist. We are but a small part in the cycle of true immortality. If you are $ready to begin I will battle you. Please do not worry, if you defeat me, my being will continue to exist within you as that is the way of our Order. If you fall however, it was meant to be.");
 }
 if($text=~/ready/i){
  quest::say("Stand fast and ready to prove your worth now $name!");
  quest::attack($name);
 }
}
sub EVENT_DEATH {
  quest::say("You have done well!");
}


# End of File