sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I suppose you're one of Nestrals new employees. eh? Well if that's the case I can help get you outfitted with some [gear] necessary for people in this [line of work].");
}
if($text=~/what gear/i){
quest::say("The first thing you need is a suit of sturdy traders clothing. Take this note to Verona Rankin and she'll help you with a suit tailored to your needs. Once you have been outfitted in your traders clothing return to me and I will inform you of your [next task].");
quest::summonitem("19846");
}
if($text=~/what next task/i){
quest::say("Ready to get to work are you? Listen carefully. Outside Freeports South gate you will find one of our employees. Rigg Nostra. who is acting as an intermediary between the Coalition of Tradefolk and some recently acquired business associates. Give him this card so he knows I've sent you and he will give you further instructions. Do not mention any of our names in public. The Freeport Militia would likely impose high taxes on the Coalition if they found out about the goods being exchanged to us by our new associates.");
quest::summonitem("19917"); }
}
#END of FILE Zone:freporte  ID:6124 -- Tovan_Tenlah 

