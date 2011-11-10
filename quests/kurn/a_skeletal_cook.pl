sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Some cracked old bones, two zombie flesh, and a salt minnow make up the rest. Throw inside a skull and mix, and I would have a delightful dish. But with no eyes I have no sight to make Kurn's delicious delight. And if I could I would not eat without a tongue behind my teeth.");
 }
}
sub EVENT_ITEM {
 #Handin: a Glowing Skull (12401)
 if(plugin::check_handin(\%itemcount, 12401 => 1)){
  quest::me("The cook's bones crack as he reaches out to take the skull from your hands. A voice in your mind says, 'Thank you. Now I can leave this dreadful place. Please take this as I no longer have any use for it'. The cook places the skull back in your hands before collapsing into a lifeless pile of bones.");
  quest::summonitem(59526); #The Skull of Torture (59526)
 }
 else {
  quest::say("I have no need for this item, $name. You can have it back.");
  plugin::return_items(\%itemcount);
 }
}

#Scripted By: Fatty Beerbelly