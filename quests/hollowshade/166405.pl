sub EVENT_SIGNAL{
if($signal == 200){
   quest::shout("To Arms! To Arms! The Northern Cave is under attack by the Sonic Wolves!");
  }
if($signal == 201){
   quest::shout("To Arms! To Arms! The Northern Cave is under attack by the Grimlings!");
 }
if($signal == 202){
   quest::shout("The Sonic Wolves have taken control of the Northern cave!");
   quest::depop();
 }
if($signal == 203){
   quest::shout("The Grimlings have taken control of the Northern cave!");
   quest::depop();
 }
if($signal == 204){
   quest::shout("The Owlbears have defended the Northern cave against the Sonic Wolf invasion!");
   quest::depop();
 }
if($signal == 205){
   quest::shout("The Owlbears have defended the Northern cave against the Grimling invasion!");
   quest::depop();
 }
if($signal == 206){
   quest::shout("The Northern cave is now controlled by the Grimlings!");
   quest::depop();
 }
if($signal == 207){
   quest::shout("The Northern cave is now controlled by the Owlbears!");
   quest::depop();
 }
if($signal == 208){
   quest::shout("The Northern cave is now controlled by the Sonic Wolves!");
   quest::depop();
 }
if($signal == 209){
   quest::shout("The Northern cave has been defended!");
   quest::depop();
 }
}
