sub EVENT_SIGNAL{
if($signal == 700){
   quest::shout("To Arms! To Arms! The Eastern Cave is under attack by the Owlbears!");
 }
if($signal == 701){
   quest::shout("To Arms! To Arms! The Eastern Cave is under attack by the Grimlings!");
 }
if($signal == 702){
   quest::shout("The Owlbears have taken control of the Eastern cave!");
   quest::depop();
 }
if($signal == 703){
   quest::shout("The Grimlings have taken control of the Eastern cave!");
   quest::depop();
 }
if($signal == 704){
   quest::shout("The Sonic Wolves have defended the Eastern cave against the Owlbear invasion!");
   quest::depop();
 }
if($signal == 705){
   quest::shout("The Sonic Wolves have defended the Eastern cave against the Grimling invasion!");
   quest::depop();
 }
if($signal == 706){
   quest::shout("The Eastern cave is now controlled by the Grimlings!");
   quest::depop();
 }
if($signal == 707){
   quest::shout("The Eastern cave is now controlled by the Owlbears!");
   quest::depop();
 }
if($signal == 708){
   quest::shout("The Eastern cave is now controlled by the Sonic Wolves!");
   quest::depop();
 }
if($signal == 709){
   quest::shout("The Eastern cave has been defended!");
   quest::depop();
 }
}
