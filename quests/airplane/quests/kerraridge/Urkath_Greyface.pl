sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Errr?  What you say to Urrrkath?  Ah.  Hello to you as well.");
quest::say("You like [bat wings]? Me have bat wings.");  
 }
elsif($text=~/bat wings/i){
quest::say("Me want rat fur. Bring me a rat fur, I give you a bat wing.");
 }
}

sub EVENT_ITEM{
   if($itemcount{13064} == 1){
    quest::say("Thank you, here batwing.");
    quest::say("Bring me more!");
    quest::summonitem(13068);  #Batwing
   }else{
    plugin::return_items(\%itemcount);
    quest::say("Do what I say!");           # give back items
   }
}
#END of FILE Zone:kerraridge  ID:74090 -- Urkath_Greyface 

