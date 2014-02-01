sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Step up. step up! Please take a moment to purchase some supplies from me.  Times are hard and my [luck] has been bad.");
}
if($text=~/what luck/i){
quest::say("I have just come from Hollowshade Moor a few weeks ago.  My fishing days have been very unprosperous. The lures that I have now are made of low quality Acrylia and scare the fish away rather than attract them.  I want to make a new lure. and on my way in I noticed the dull color of the [scorpions].  I would have moved closer to them but unfortunately  I am deathly allergic to the poisons found in scorpion venom.");
}
if($text=~/what scorpions/i){
quest::say("The scorpions are at the bottom of the canyon surrounding the city.  If you can bring me four shells to make a few lures. I will give you my old lure.  Be careful making your way down the ledges. as there are many steep drops."); }
}
#END of FILE Zone:sharvahl  ID:155097 -- Dharr_Nadim 

