sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome.  Who has [sent] you to me?");
}
if($text=~/Grand Master Glox sent me/i){
quest::say("So Grand Master Glox has sent you?  You must be new to the court.  We are of the Swifttail caste as are you.  Under the guidance of masters such as I. you will forge your body into a weapon of pure destruction.  Do not bother the Grand Master.  he is in constant meditation and is bothered with only the most paramount of concerns.  Are you [ready to train]?");
}
if($text=~/Yes I am ready to train/i){
quest::say("Then I can offer training in the martial arts as well as other skills.  Please remember to obtain knowledge from our court chronicler.  You shall also begin to aid your brothers and sisters with [menial tasks].  All begin upon the rung of dust and all have done these tasks in order to climb to the next rung.");
}
if($text=~/What menial tasks/i){
quest::say("We have a few menial tasks we require our young members to perform.  Young members must [tailor training bags] for our court.");
}
if($text=~/What is tailor training bags/i){
quest::say("Then take this leech husk pouch and fill it with the obvious.  Once done. combine the skins and take the full leech husk pouch to a local tailor by the name of Klok Mugruk.  He is the one who cleans and toughens the husks for us. He shall hand you a ready-made training bag husk.  He will instruct you further.");
}
if($text=~/master glox sent me/i){
quest::say("So Grand Master Glox has sent you?  You must be new to the court.  We are of the Swifttail caste as are you.  Under the guidance of masters such as I. you will forge your body into a weapon of pure destruction.  Do not bother the Grand Master.  he is in constant meditation and is bothered with only the most paramount of concerns.  Are you [ready to train]?");
}
if($text=~/I am ready to train/i){
quest::say("Then I can offer training in the martial arts as well as other skills.  Please remember to obtain knowledge from our court chronicler.  You shall also begin to aid your brothers and sisters with [menial tasks].  All begin upon the rung of dust and all have done these tasks in order to climb to the next rung.");
}
if($text=~/I will tailor training bags/i){
quest::say("Then take this leech husk pouch and fill it with the obvious.  Once done. combine the skins and take the full leech husk pouch to a local tailor by the name of Klok Mugruk.  He is the one who cleans and toughens the husks for us. He shall hand you a ready-made training bag husk.  He will instruct you further."); }
}
#END of FILE Zone:cabeast  ID:3429 -- Master_Bain 

