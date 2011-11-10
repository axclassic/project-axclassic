sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You [friend of Gardunk]? Meez friend of Gardunk.");
}
if($text=~/i am a friend of gardunk/i){
quest::say("Dat good. He tell meez you was comin'. Meez learn you to fight like alligator. Dominate through fear. Dat is what we do. Strike fear into heart of enemies. You [ready to start]?");
}
if($text=~/i am ready to start/i){
quest::say("Good. We start easy. Little froggies a good place. They our enemies. You go to da swamp and kill da tadpoles. Bring back to me four pieces of Froglok Tadpole Flesh. Strip da flesh from our enemies. Dat your first task."); }
}
#END of FILE Zone:grobb  ID:40011 -- Gargh 

