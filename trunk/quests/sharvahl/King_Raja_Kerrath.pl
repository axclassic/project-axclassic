sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings citizen... you are very brave to approach me in this manner.  That sort of bravery warrants my respect.  How may I help you?"); }
}
sub EVENT_ITEM { 
if($itemcount{18299} == 1){
quest::say("Your humility and willingness to serve shall not be wasted. There is much to be done. $name. and our people thank you in advance for your selfless service.");
quest::say("Return to Registrar Bindarah with this note.");
quest::summonitem("18304"); }
}
#END of FILE Zone:sharvahl  ID:155154 -- King_Raja_Kerrath 

