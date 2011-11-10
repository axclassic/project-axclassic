sub EVENT_SAY { 
if($text=~/.*will.*deliver.*kelethin.*/i){
quest::say("Take this letter to Jakum Webdancer in Kelethin.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles.");
quest::say("Take this letter to Jakum Webdancer in Kelethin.  You can find him at the bard guild hall.  I am sure he will compensate you for your troubles.");
quest::summonitem("18163");
}
if($text=~/Hail/i){
quest::say("Hail. $name - Are you [interested] in helping the League of Antonican Bards by delivering some [mail]?");
}
if($text=~/what mail/i){
quest::say("The League of Antonican Bards has a courier system made up of travelers and adventurers.  We pay good gold to anyone who will take messages from bards such as myself to one of our more central offices.  Are you [interested]?");
}
if($text=~/i am interested/i){
quest::say("I have messages that need to go to - well. right now I have one that needs to go to Kelethin.  Will you [deliver] mail to [Kelethin] for me?"); }
}
#END of FILE Zone:felwithea  ID:61068 -- Tacar_Tissleplay 

