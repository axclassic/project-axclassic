sub EVENT_SAY { 
my $interested = quest::saylink("interested", 1);
my $troubled = quest::saylink("troubled", 1);
if($text=~/Hail/i){
quest::say("It is a pleasure to meet you. friend.  Please let me know if you have trouble finding the book that you seek.  If you request something that we do not have available. I can make a note to keep an eye out for it.  We are getting in a great variety of interesting new material these days.  Speaking of which. I need someone to take a tome to Elder Animist Dumul.  He has been frantically researching something or another.  I'm sure that you could pry a little and learn more about it if you were to take this book to him.  Is that something that you would be $interested in doing?");
}
if($text=~/interested/i){
quest::say("You have a braver spirit than mine. friend. but I'm glad that someone is available to assist me.  Take care and keep alert.  The Khati Sha seem to be very $troubled by something of late.");
quest::summonitem("9061"); }
}
if($text=~/troubled/i){
quest::say("They have been researching the lore of elder spirits and their relationship to this realm. I really do not have much more information than that. I can only speculate that it has something to do with a disturbance in the spiritual realm. Perhaps...well... I cannot say for sure. If the Animist finds that he can trust you, perhaps you can learn more. I honestly have nothing more to offer you on the subject.");
}
#END of FILE Zone:kerraridge  ID:74425 -- Historian_Sharar 

