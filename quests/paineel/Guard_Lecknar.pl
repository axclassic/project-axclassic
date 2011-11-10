sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Uggg.  You needz keyz?  Rrrrrrr.");
}
if($text=~/keyz/i){
quest::say("Uggggg.  Take dis keyz.");
quest::summonitem("6378"); }
}
#END of FILE Zone:paineel  ID:75042 -- Guard_Lecknar 

