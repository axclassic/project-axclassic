sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You dare to intrude upon the presence of a Lord of Pain?!  Such foolish acts can only be those of a knight in training.  Are you a [knight in training]?");
}
if($text=~/I am a knight in training/i){
quest::say("If you are a pawn. then let us begin with a simple test.  Complete the test and you shall be rewarded with a new khukri.  Do you [wish to perform the test of a pawn]?");
}
if($text=~/I wish to perform the test of a pawn/i){
quest::say("You shall carry this pack.  Within it you shall combine 4 sarnak hatchling heads. When you have the full sarnak head pack then you shall return it to me along with your pawn's khukri and I shall reward you with the khukri of a knave. Beware. the sarnak are our most hated foes and even their whelps are quite formidable fighters. Be sure to seek out Klok Mugruk.  He may have some curscale armor available."); }
}
#END of FILE Zone:cabeast  ID:3310 -- Lord_Gikzic 

