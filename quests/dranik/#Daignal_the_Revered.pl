##All text is made up by Aardil, I could not find the correct dialogue##
sub EVENT_SAY { 
my $crime = quest::saylink("crime", 1);
my $killing = quest::saylink("killing", 1);
  if ($text=~/Hail/i){
  quest::emote(' stares at you directly in the eyes.');
  quest::say("I know not of what you speak. I am but a traveler much like you, wishing no harm yet you say I am accused of committing a $crime?");
 }
  if ($text=~/crime/i){
  quest::say("So my past associations have come back to haunt me and someone is planning on $killing me?"); 
 }
  if ($text=~/killing/i){
  quest::say("I am innocent I tell ya, but if the contract is signed, then the truth does not matter.");
  quest::spawn2(336537,0,0,698.4,838.4,145.2,136);
  quest::attack(336091);
 }
} 
sub EVENT_DEATH {
  quest::emote( 'cries out in pain');
  quest::spawn2(336583,0,0,700.7,796.8,145.2,231);
  quest::spawn2(336583,0,0,674.2,854.4,145.2,113.1);
 }