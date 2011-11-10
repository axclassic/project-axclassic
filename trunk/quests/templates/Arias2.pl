#zone: Most Newbee Zones
#Angelox

sub EVENT_SAY {
 if (($text=~/hail/i)&&($race eq 'Froglok')) {
  quest::say("Hail $name! I represent the people of Gloomingdeep, and was sent here to recruit [help].");
  quest::say("I see you are of the Froglok race, you should know Frogloks have a new [town] in Kunark.");}
 elsif ($text=~/hail/i){
  quest::say("Hail $name! I represent the people of Gloomingdeep, and was sent here to recruit [help].");}
elsif ($text=~/help/i) {
  quest::say("A slave revolt has broken out in the mines, we need you to help them as they escape.");
  quest::say("If you [agree], I will take you with me, as I am about to leave for Gloomingdeep .");}
  elsif (($text=~/wish to go/i)&&($race eq 'Froglok')) {
   quest::say("Very well then ....");
   quest::movepc(83,-1830.0,-1259.9,27.1);}
  elsif (($text=~/agree/i)&&($race eq 'Froglok')&&($ulevel<=18)){
  quest::say("Good, Let's help the revolt!.");
   quest::movepc(189,-255.7,33.2,15.3);}
  elsif (($text=~/agree/i)&&($ulevel<=18)) {
  quest::say("Good, Let's help the revolt!.");
  quest::movepc(189,-61.7,-123.0,17.4);}
 elsif (($text=~/town/i)&&($race eq 'Froglok')) {
  quest::say("The Frogloks have a new town with GMs of all classes waiting to help you, do you [wish to go] there?");}
else{
  quest::say ("Sorry you're to high in level to enter.");}
}
