#zone Cauldron
#by Angelox

sub EVENT_SAY {
if($text=~/Hail/i) {
    quest::say("You not berserker, so you go away. Me no talk to you!");
}else{
  #do nothing
   }
}