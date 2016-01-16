sub EVENT_SIGNAL{
if($signal == 601){
   quest::shout("To Arms! To Arms! The Owlbear Cave is under attack by the Grimliings!");
 }
if($signal == 602){
   quest::shout("The Grimlings have taken control of the Northern cave!");
   quest::depop();
 }
if($signal == 603){
   quest::shout("The Owlbears have defended the Northern cave against the Grimling invasion!");
   quest::depop();
 }
if($signal == 604){
   quest::shout("The Northern cave is now controlled by the Grimlings!");
   quest::depop();
 }
if($signal == 605){
   quest::shout("The Northern cave is now controlled by the Owlbears!");
   quest::depop();
 }
if($signal == 606){
   quest::shout("The Northern cave is now controlled by the Sonic Wolves!");
   quest::depop();
 }
}
