sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Do not approach the Tower of Death unless you have been summoned to rebirth.  My brother was unfortunate enough to venture into their halls and he has never been seen again."); 
quest::say("If you are looking for [bat wings], I can also help you with that.");}
elsif ($text=~/bat wings/i){
    quest::say("I have many bat wings collected on my trips around Norrath, bring me Loose Scale, and I will give you a bat wing in return .");  }
}

sub EVENT_ITEM{
   if($itemcount{12466} == 1){
    quest::say("Thank you and here is your batwing.");
    quest::summonitem(13068);  #Batwing
    }
}

#END of FILE Zone:cabwest  ID:5105 -- Trooper_Gegren 

