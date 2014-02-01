sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You are on the grounds of the Brood of Kotiz.  If you do not belong. you must leave at once.  There shall be no [third rank skullcap] for you.");
}
if($text=~/skullcap/i){
quest::say("I offer the third rank apprentice skullcap to those who wear the second.  If that is you. then you will do the [bidding of the tower].");
}
if($text=~/tower/i){
quest::say("Take this glass canopic.  Within it you shall place a brain for me.  The brain I seek is that of a sarnak crypt raider.  Any shall do.  The ones we seek should be near the Lake of Ill Omen.  When you obtain the brain. you must quickly put it into the glass canopic with [embalming fluid]. When these are combined. the canopic shall seal and if you return it to me with your second rank skullcap. I shall hand you the next and final skullcap.");
}
if($text=~/fluid/i){
quest::say("Embalming fluid is created through brewing. but do not drink it!!  You can learn about the process of brewing on our grounds."); }
}
#END of FILE Zone:cabwest  ID:3433 -- Master_Rixiz 

