#############
#NPC: Cyanelle
#Quest Name: 
#Quest by: 
#Revised: Olhadon
#NPCs Involved: Eldreth
#Items Involved: 
#zone: lakerathe

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello. $name.");
  }
  if($text=~/eldreth/i){
    quest::say("Eldreth is not here right now. *chuckle* He went to find work, but if you know Eldreth, you would know that 'Eldreth working' is an oxymoron! Sometimes I wonder why I still share this tower with him. I suppose I get lonely on this lake, and Jebeker here never has much to say. But I digress. Eldreth will be back sooner rather than later, I would think. You are welcome to stay here and keep me company until he returns, or you can check back later. He is seldom gone more than a few days.");
  }
}
#END of FILE Zone:lakerathe  ID:51093 -- Cyanelle 

