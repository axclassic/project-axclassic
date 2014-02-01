sub EVENT_SAY { 
if($text=~/I bear the mantle of a crusader/i){
quest::say("We shall see if you are worthy of that. I shall make [armor] for you. to aid you in your service to our Father. I specialize in the forging of [bracers]. [greaves]. [masks]. and [breastplates]. Sirtha makes the other items of armor. Take care when you address her. hatchling. it would not be the first time a hatchling has left here with scars.");
}
if($text=~/bracers/i){
quest::say("Have you ever seen Bloodgills? I hear they will devour a broodling in seconds and that their scales are tough as iron. Bring me some of these scales. a banded bracer. and a sapphire as blue as the sky. Only then will I give the bracer to you. broodling.");
}
if($text=~/greaves/i){
quest::say("Do you know the beasts that call themselves sarnaks? One such beast who calls itself Zorash attacked an envoy of merchants who were to deliver a pair of special boots to me. It taunts us by wearing them as a trophy. Bring them back and the skull of Grachnist. his goblin ally. Return them to me along with a star ruby and your banded greaves. and I shall craft you an excellent pair of greaves.");
}
if($text=~/mask/i){
quest::say("Have you ever encountered a drixie before? I crush every one I see. They are an annoyance beyond mere words! Kill the Queen and bring me her wings as a trophy along with an emerald of fire and a banded mask.");
}
if($text=~/breastplate/i){
quest::say("Ahhhh....a breastplate you want. is it? Well. they are not easy to come by. Fetch me a scorpion chitin. Intact. mind you! They are extremely fragile and must be treated before they can protect your carcass. Also. fetch me a war braid from a sarnak to connect the pieces. I also require a ruby and your banded tunic. Do this and I shall make it for you. hatchling. Now. go!"); }
}
#END of FILE Zone:cabeast  ID:5757 -- Sarth_Scarscale 

