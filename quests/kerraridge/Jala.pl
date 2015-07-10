sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings noble one. I am Jala, Master weaver of Shar Vahl. I have been perfecting the art of [Xakra] weaving lately. Please have a look at what I have crafted, maybe you will find something to suit your fashion needs.");
}
if($text=~/what is xakra/i){
quest::say("Xakra is the mystical ethereal silk woven by the Shak Dratha. I believe they use the mystical ethereal shadow silk woven by the Xakra worms. Although this magical silk is quite beautiful, it is also highly unstable if you weave them in large quantities. I have discovered that the hides of rock hoppers manages to hold the silk together fairly well. I can use some help in collecting the silks to continue my craft, if you are willing.");
}
if($text=~/i am willing/i){
quest::say("Wonderful! I'm not much of a hunter myself, so as you can see it can be quite difficult for me to obtain these silks. If you can bring me four of them. I would greatly appreciate it."); }
}
sub EVENT_ITEM { 
if($itemcount{7158} == 4 && $itemcount{2789} == 3){
quest::say("Woohoo! Thank you so much $name! Hey, maybe you would like to try your hand at weaving as well. If you combine the silks in that loom over there, you can make some decent thread to work with. Make four of them and bring them to me. I will judge your craftsmanship.");
 quest::faction(175,1);
    quest::faction(2806,1); 
}
if($itemcount{2791} == 4){
quest::say("Not bad at all! You definitely have some hidden talent there $name. Keep at it and you may just become a master tailor yourself. Here, take this with you. It will help protect you from the nasty bite of the Xakra worms.");
quest::summonitem("1007"); }
}
#END of FILE Zone:sharvahl  ID:155197 -- Jala 

