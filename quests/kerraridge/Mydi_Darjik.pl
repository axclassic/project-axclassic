sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. did you need assistance with something or are you just browsing?");
}
if($text=~/solution/i){
quest::say("It's really not as difficult as it sounds. The spores required to make the solution that you'll need are easy to find. They grow in the dulfis mushrooms that are found in the caves beyond the thicket.");
quest::say("You'll just need to throw the whole mushroom into a flask of water to brew. Once the dulfis has boiled in the water for a while, you'll get a murky gray liquid. Boil the cloth in that liquid for a bit in the brew barrel and then wrap the steaming cloth around the buckler and the tincture that Fharra gave you. Let the cloth cool and you should see the desired results. Bring the buckler to me once you'r done and I'll tell you if you did it correctly."); 
}
}
sub EVENT_ITEM {
my $solution = quest::saylink("solution", 1);
if (plugin::check_handin(\%itemcount, 3495 => 1)) {
quest::say("Yes. yes, I can improve your shield easy enough");
quest::emote(' takes out a piece of cloth and cuts it big enough to cover your buckler twice over and folds it neatly. Handing it back to you.'):
quest::emote(' looks around for a moment.');
quest::say("Sometimes I feel as if the spirits are playing a trick on me. I am out of spores. I never seem to run out of spores until the times when I need them most. You'll need to gather them on your own to make the soaking $solution.");
}
elsif (plugin::check_handin(\%itemcount, 5543 => 1)) {
quest::say("Very nice $name, you seem to have a grasp of this. I have yet another errand for you.");
quest::say("Take this bag and fill it with wetfang eyes, they come from large wetfangs in Paludal Caverns."); 
quest::summonitem(17076);
quest::summonitem(5543);
}
elsif (plugin::check_handin(\%itemcount, 5541 => 1)) {
quest::say("Thank you very much! I was almost out of these eyes and I'm sure you'll agree they aren't easy to come by. Your assistance will not go unnoted. Here is the blessing I promised you.");
quest::say("Take this token to Spiritist Fehril along with your recruit's cloak, and your wonderful new buckler. He'll know that I sent you with my blessing. Take care and may the spirits guide you, young Dar Khura.");
quest::summonitem(5542);
}
}
#END of FILE Zone:sharvahl  ID:155068 -- Mydi_Darjik 

