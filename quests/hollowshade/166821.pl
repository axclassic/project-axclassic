sub EVENT_SIGNAL{
if($signal == 500){
   quest::shout("To Arms! To Arms! The Southern Village is under attack by the Owlbears!");
 }
if($signal == 501){
   quest::shout("To Arms! To Arms! The Southern Village is under attack by the Sonic Wolves!");
 }
if($signal == 502){
   quest::shout("The Owlbears have taken control of the Southern Village!");
   quest::depop();
 }
if($signal == 503){
   quest::shout("The Sonic Wolves have taken control of the Southern Village!");
   quest::depop();
 }
if($signal == 504){
   quest::shout("The Grimlings have defended the Southern Village against the Owlbear invasion!");
   quest::depop();
 }
if($signal == 505){
   quest::shout("The Grimlings have defended the Southern Village against the Sonic Wolf invasion!");
   quest::depop();
 }
if($signal == 506){
   quest::shout("The Southern Village is now controlled by the Grimlings!");
   quest::depop();
 }
if($signal == 507){
   quest::shout("The Southern Village is now controlled by the Owlbears!");
   quest::depop();
 }
if($signal == 508){
   quest::shout("The Southern Village is now controlled by the Sonic Wolves!");
   quest::depop();
 }
if($signal == 509){
   quest::shout("The Southern Village been defended!");
   quest::depop();
 }
}
